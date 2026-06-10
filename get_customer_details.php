<?php
header('Content-Type: application/json');
require 'db_connect.php';

if (!isset($_GET['id']) || empty($_GET['id'])) {
    echo json_encode(['success' => false, 'error' => 'Customer ID is required.']);
    exit;
}

$customerId = intval($_GET['id']);

try {
    // 1. Fetch customer details
    $customerStmt = $pdo->prepare("
        SELECT 
            c.*, 
            e.name as rep_name,
            r.name as route_name
        FROM customers c
        LEFT JOIN employees e ON c.rep_id = e.id
        LEFT JOIN routes r ON c.route_id = r.id
        WHERE c.id = ?
    ");
    $customerStmt->execute([$customerId]);
    $customer = $customerStmt->fetch();

    if (!$customer) {
        echo json_encode(['success' => false, 'error' => 'Customer not found.']);
        exit;
    }

    // Unset password to prevent sensitive data leak
    unset($customer['password']);

    // 2. Fetch sales aggregates for this customer
    $statsStmt = $pdo->prepare("
        SELECT 
            COUNT(o.id) as total_orders,
            IFNULL(SUM(o.total_amount), 0) as total_spent,
            IFNULL(SUM(CASE WHEN o.payment_method = 'Credit' THEN o.total_amount - o.paid_amount ELSE 0 END), 0) as outstanding_balance,
            MIN(o.created_at) as first_order_date,
            MAX(o.created_at) as last_order_date
        FROM orders o
        WHERE o.customer_id = ? AND o.order_status != 'cancelled'
    ");
    $statsStmt->execute([$customerId]);
    $stats = $statsStmt->fetch();

    echo json_encode([
        'success' => true,
        'customer' => $customer,
        'stats' => $stats
    ]);

} catch (\PDOException $e) {
    echo json_encode(['success' => false, 'error' => 'Database query failed: ' . $e->getMessage()]);
}
