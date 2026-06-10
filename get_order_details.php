<?php
require_once 'db_connect.php';

header('Content-Type: application/json');

if (!isset($_GET['id']) || empty($_GET['id'])) {
    http_response_code(400);
    echo json_encode(['error' => 'Order ID is required']);
    exit;
}

$orderId = intval($_GET['id']);

try {
    // 1. Fetch order details with customer and rep info
    $orderQuery = "
        SELECT 
            o.*, 
            c.name AS customer_name, c.phone AS customer_phone, c.address AS customer_address, c.email AS customer_email,
            e.name AS rep_name, e.phone AS rep_phone, e.emp_code AS rep_code
        FROM orders o
        LEFT JOIN customers c ON o.customer_id = c.id
        LEFT JOIN employees e ON o.rep_id = e.id
        WHERE o.id = ?
    ";
    $stmt = $pdo->prepare($orderQuery);
    $stmt->execute([$orderId]);
    $order = $stmt->fetch();

    if (!$order) {
        http_response_code(404);
        echo json_encode(['error' => 'Order not found']);
        exit;
    }

    // 2. Fetch order items with product details
    $itemsQuery = "
        SELECT 
            oi.*, 
            p.name AS product_name, p.sku AS product_sku, cat.name AS category_name
        FROM order_items oi
        JOIN products p ON oi.product_id = p.id
        LEFT JOIN categories cat ON p.category_id = cat.id
        WHERE oi.order_id = ?
    ";
    $stmt = $pdo->prepare($itemsQuery);
    $stmt->execute([$orderId]);
    $items = $stmt->fetchAll();

    // 3. Fetch cheque details if payment method is Cheque
    $cheque = null;
    if (strtolower($order['payment_method']) === 'cheque') {
        $chequeQuery = "
            SELECT bank_name, cheque_number, banking_date, status 
            FROM cheques 
            WHERE order_id = ? OR (customer_id = ? AND amount = ?)
            LIMIT 1
        ";
        $stmt = $pdo->prepare($chequeQuery);
        $stmt->execute([$orderId, $order['customer_id'], $order['total_amount']]);
        $cheque = $stmt->fetch();
    }

    // 4. Return combined JSON response
    echo json_encode([
        'success' => true,
        'order' => $order,
        'items' => $items,
        'cheque' => $cheque
    ]);

} catch (\PDOException $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Database query failed: ' . $e->getMessage()]);
}
