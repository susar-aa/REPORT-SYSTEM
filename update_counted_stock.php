<?php
header('Content-Type: application/json');
require_once 'db_connect.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['success' => false, 'error' => 'Invalid request method.']);
    exit;
}

$productId = isset($_POST['product_id']) ? intval($_POST['product_id']) : 0;
$countedStockVal = isset($_POST['counted_stock']) ? trim($_POST['counted_stock']) : '';

if ($productId <= 0) {
    echo json_encode(['success' => false, 'error' => 'Invalid product ID.']);
    exit;
}

try {
    if ($countedStockVal === '') {
        // Reset to NULL
        $stmt = $pdo->prepare("UPDATE products SET counted_stock = NULL WHERE id = ?");
        $stmt->execute([$productId]);
    } else {
        $countedStock = intval($countedStockVal);
        $stmt = $pdo->prepare("UPDATE products SET counted_stock = ? WHERE id = ?");
        $stmt->execute([$countedStock, $productId]);
    }
    
    // Fetch updated product calculations to return to frontend for dynamic UI updates
    $query = "
        SELECT 
            p.stock AS warehouse_stock,
            p.counted_stock,
            COALESCE(grn.total_received, 0) AS total_received,
            COALESCE(sales.total_sold, 0) AS total_sold,
            COALESCE(returns.total_returned, 0) AS total_returned,
            COALESCE(damaged.total_damaged, 0) AS total_damaged,
            COALESCE(vehicle.total_vehicle, 0) AS total_vehicle
        FROM products p
        LEFT JOIN (
            SELECT product_id, SUM(quantity) AS total_received FROM grn_items GROUP BY product_id
        ) grn ON p.id = grn.product_id
        LEFT JOIN (
            SELECT oi.product_id, SUM(oi.quantity) AS total_sold 
            FROM order_items oi
            JOIN orders o ON oi.order_id = o.id
            WHERE o.order_status != 'cancelled'
            GROUP BY oi.product_id
        ) sales ON p.id = sales.product_id
        LEFT JOIN (
            SELECT sri.product_id, SUM(sri.quantity) AS total_returned FROM sales_return_items sri GROUP BY sri.product_id
        ) returns ON p.id = returns.product_id
        LEFT JOIN (
            SELECT product_id, SUM(stock_qty) AS total_damaged FROM damaged_stock GROUP BY product_id
        ) damaged ON p.id = damaged.product_id
        LEFT JOIN (
            SELECT product_id, SUM(stock_qty) AS total_vehicle FROM vehicle_stock GROUP BY product_id
        ) vehicle ON p.id = vehicle.product_id
        WHERE p.id = ?
    ";
    
    $stmt = $pdo->prepare($query);
    $stmt->execute([$productId]);
    $product = $stmt->fetch();
    
    if ($product) {
        $calculated = intval($product['total_received']) - intval($product['total_sold']) + intval($product['total_returned']) - intval($product['total_damaged']);
        $remaining = intval($product['warehouse_stock']) + intval($product['total_vehicle']);
        $counted = $product['counted_stock'];
        
        $variance = ($counted !== null) ? (intval($counted) - $calculated) : ($remaining - $calculated);
        
        // Also recalculate total variance items across database to update KPI card
        $totalVarianceStmt = $pdo->query("
            SELECT COUNT(*) FROM (
                SELECT 
                    p.id,
                    p.stock AS warehouse_stock,
                    p.counted_stock,
                    COALESCE(grn.total_received, 0) AS total_received,
                    COALESCE(sales.total_sold, 0) AS total_sold,
                    COALESCE(returns.total_returned, 0) AS total_returned,
                    COALESCE(damaged.total_damaged, 0) AS total_damaged,
                    COALESCE(vehicle.total_vehicle, 0) AS total_vehicle
                FROM products p
                LEFT JOIN (
                    SELECT product_id, SUM(quantity) AS total_received FROM grn_items GROUP BY product_id
                ) grn ON p.id = grn.product_id
                LEFT JOIN (
                    SELECT oi.product_id, SUM(oi.quantity) AS total_sold 
                    FROM order_items oi
                    JOIN orders o ON oi.order_id = o.id
                    WHERE o.order_status != 'cancelled'
                    GROUP BY oi.product_id
                ) sales ON p.id = sales.product_id
                LEFT JOIN (
                    SELECT sri.product_id, SUM(sri.quantity) AS total_returned FROM sales_return_items sri GROUP BY sri.product_id
                ) returns ON p.id = returns.product_id
                LEFT JOIN (
                    SELECT product_id, SUM(stock_qty) AS total_damaged FROM damaged_stock GROUP BY product_id
                ) damaged ON p.id = damaged.product_id
                LEFT JOIN (
                    SELECT product_id, SUM(stock_qty) AS total_vehicle FROM vehicle_stock GROUP BY product_id
                ) vehicle ON p.id = vehicle.product_id
            ) as audit_temp
            WHERE IF(counted_stock IS NOT NULL, counted_stock, (warehouse_stock + total_vehicle)) != (total_received - total_sold + total_returned - total_damaged)
        ");
        $newVarianceCount = $totalVarianceStmt->fetchColumn();
        
        echo json_encode([
            'success' => true,
            'calculated' => $calculated,
            'remaining' => $remaining,
            'counted' => $counted,
            'variance' => $variance,
            'globalVarianceCount' => $newVarianceCount
        ]);
    } else {
        echo json_encode(['success' => false, 'error' => 'Product data not found.']);
    }
} catch (Exception $e) {
    echo json_encode(['success' => false, 'error' => $e->getMessage()]);
}
