<?php
require_once 'db_connect.php';

header('Content-Type: application/json');

if (!isset($_GET['id']) || empty($_GET['id'])) {
    http_response_code(400);
    echo json_encode(['error' => 'GRN ID is required']);
    exit;
}

$grnId = intval($_GET['id']);

try {
    // 1. Fetch GRN details with supplier info
    $grnQuery = "
        SELECT 
            g.*, 
            s.name AS supplier_name, s.company_name AS supplier_company, s.phone AS supplier_phone, s.email AS supplier_email
        FROM grns g
        LEFT JOIN suppliers s ON g.supplier_id = s.id
        WHERE g.id = ?
    ";
    $stmt = $pdo->prepare($grnQuery);
    $stmt->execute([$grnId]);
    $grn = $stmt->fetch();

    if (!$grn) {
        http_response_code(404);
        echo json_encode(['error' => 'GRN not found']);
        exit;
    }

    // 2. Fetch GRN items with product details
    $itemsQuery = "
        SELECT 
            gi.*, 
            p.name AS product_name, p.sku AS product_sku, cat.name AS category_name
        FROM grn_items gi
        JOIN products p ON gi.product_id = p.id
        LEFT JOIN categories cat ON p.category_id = cat.id
        WHERE gi.grn_id = ?
    ";
    $stmt = $pdo->prepare($itemsQuery);
    $stmt->execute([$grnId]);
    $items = $stmt->fetchAll();

    // 3. Return JSON
    echo json_encode([
        'success' => true,
        'grn' => $grn,
        'items' => $items
    ]);

} catch (\PDOException $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Database query failed: ' . $e->getMessage()]);
}
