<?php
require_once 'db_connect.php';

try {
    // --------------------------------------------------------
    // 1. GENERAL STATISTICS
    // --------------------------------------------------------
    
    // Total Active Sales Count & Sum
    $statsStmt = $pdo->query("
        SELECT 
            COUNT(id) as total_count,
            SUM(total_amount) as total_sum,
            AVG(total_amount) as avg_amount
        FROM orders 
        WHERE order_status != 'cancelled'
    ");
    $stats = $statsStmt->fetch();
    
    $totalSalesCount = $stats['total_count'] ?? 0;
    $totalSalesSum = $stats['total_sum'] ?? 0;
    $averageOrderVal = $stats['avg_amount'] ?? 0;

    // Cash Sales Summaries
    $cashStatsStmt = $pdo->query("
        SELECT 
            COUNT(id) as cash_count,
            SUM(total_amount) as cash_sum
        FROM orders 
        WHERE payment_method = 'Cash' AND order_status != 'cancelled'
    ");
    $cashStats = $cashStatsStmt->fetch();
    $totalCashCount = $cashStats['cash_count'] ?? 0;
    $totalCashSum = $cashStats['cash_sum'] ?? 0;

    // Credit Sales Summaries
    $creditStatsStmt = $pdo->query("
        SELECT 
            COUNT(id) as credit_count,
            SUM(total_amount) as credit_sum,
            SUM(paid_amount) as credit_paid,
            SUM(total_amount - paid_amount) as credit_outstanding
        FROM orders 
        WHERE payment_method = 'Credit' AND order_status != 'cancelled'
    ");
    $creditStats = $creditStatsStmt->fetch();
    $totalCreditCount = $creditStats['credit_count'] ?? 0;
    $totalCreditSum = $creditStats['credit_sum'] ?? 0;
    $totalCreditPaid = $creditStats['credit_paid'] ?? 0;
    $totalCreditOutstanding = $creditStats['credit_outstanding'] ?? 0;

    // Other Sales Summaries (Bank & Cheque)
    $otherStatsStmt = $pdo->query("
        SELECT 
            COUNT(id) as other_count,
            SUM(total_amount) as other_sum
        FROM orders 
        WHERE payment_method NOT IN ('Cash', 'Credit') AND order_status != 'cancelled'
    ");
    $otherStats = $otherStatsStmt->fetch();
    $totalOtherCount = $otherStats['other_count'] ?? 0;
    $totalOtherSum = $otherStats['other_sum'] ?? 0;
    
    // Cancelled Orders Count
    $cancelledCount = $pdo->query("SELECT COUNT(*) FROM orders WHERE order_status = 'cancelled'")->fetchColumn();

    // --------------------------------------------------------
    // 2. LEADERBOARDS & RECENT ORDERS
    // --------------------------------------------------------
    
    // Top 5 Products by Quantity
    $topProductsStmt = $pdo->query("
        SELECT 
            p.name, p.sku, 
            SUM(oi.quantity) as total_qty, 
            SUM(oi.quantity * oi.price - oi.discount) as total_revenue
        FROM order_items oi
        JOIN orders o ON oi.order_id = o.id
        JOIN products p ON oi.product_id = p.id
        WHERE o.order_status != 'cancelled'
        GROUP BY oi.product_id
        ORDER BY total_qty DESC
        LIMIT 5
    ");
    $topProducts = $topProductsStmt->fetchAll();

    // Top 5 Customers by Revenue
    $topCustomersStmt = $pdo->query("
        SELECT 
            c.id as customer_id, c.name, c.phone,
            COUNT(o.id) as order_count,
            SUM(o.total_amount) as total_spent
        FROM orders o
        JOIN customers c ON o.customer_id = c.id
        WHERE o.order_status != 'cancelled'
        GROUP BY o.customer_id
        ORDER BY total_spent DESC
        LIMIT 5
    ");
    $topCustomers = $topCustomersStmt->fetchAll();

    // Recent 10 Orders
    $recentOrdersStmt = $pdo->query("
        SELECT 
            o.id, o.created_at, o.total_amount, o.payment_method, o.payment_status,
            o.customer_id, c.name as customer_name
        FROM orders o
        LEFT JOIN customers c ON o.customer_id = c.id
        ORDER BY o.created_at DESC
        LIMIT 10
    ");
    $recentOrders = $recentOrdersStmt->fetchAll();

    // --------------------------------------------------------
    // 3. CHART DATA GATHERING (JSON ENCODED)
    // --------------------------------------------------------
    
    // Sales Trends Grouped by Date (last 30 sales days)
    $trendStmt = $pdo->query("
        SELECT 
            DATE(created_at) as sale_date, 
            SUM(total_amount) as daily_total, 
            SUM(CASE WHEN payment_method = 'Cash' THEN total_amount ELSE 0 END) as daily_cash, 
            SUM(CASE WHEN payment_method = 'Credit' THEN total_amount ELSE 0 END) as daily_credit, 
            SUM(CASE WHEN payment_method NOT IN ('Cash', 'Credit') THEN total_amount ELSE 0 END) as daily_other 
        FROM orders 
        WHERE order_status != 'cancelled' 
        GROUP BY DATE(created_at) 
        ORDER BY sale_date ASC
        LIMIT 30
    ");
    $trendData = $trendStmt->fetchAll();
    
    $trendDates = [];
    $trendTotals = [];
    $trendCash = [];
    $trendCredit = [];
    $trendOther = [];
    
    foreach ($trendData as $row) {
        $trendDates[] = date('M d', strtotime($row['sale_date']));
        $trendTotals[] = floatval($row['daily_total']);
        $trendCash[] = floatval($row['daily_cash']);
        $trendCredit[] = floatval($row['daily_credit']);
        $trendOther[] = floatval($row['daily_other']);
    }

    // Payment method breakdown for Doughnut chart
    $distributionStmt = $pdo->query("
        SELECT payment_method, SUM(total_amount) as method_total 
        FROM orders 
        WHERE order_status != 'cancelled' 
        GROUP BY payment_method
    ");
    $distributionData = $distributionStmt->fetchAll();
    $distLabels = [];
    $distTotals = [];
    foreach ($distributionData as $row) {
        $distLabels[] = $row['payment_method'];
        $distTotals[] = floatval($row['method_total']);
    }

    // --------------------------------------------------------
    // 4. DETAILED TABS QUERIES
    // --------------------------------------------------------
    
    // Cash Sales
    $cashSalesStmt = $pdo->query("
        SELECT 
            o.id, o.created_at, o.total_amount, 
            o.customer_id, c.name as customer_name, 
            e.name as rep_name,
            (SELECT COUNT(*) FROM order_items WHERE order_id = o.id) as items_count
        FROM orders o
        LEFT JOIN customers c ON o.customer_id = c.id
        LEFT JOIN employees e ON o.rep_id = e.id
        WHERE o.payment_method = 'Cash' AND o.order_status != 'cancelled'
        ORDER BY o.created_at DESC
    ");
    $cashSales = $cashSalesStmt->fetchAll();

    // Credit Sales
    $creditSalesStmt = $pdo->query("
        SELECT 
            o.id, o.created_at, o.total_amount, o.paid_amount, o.payment_status, o.order_status,
            o.customer_id, c.name as customer_name, 
            e.name as rep_name,
            (SELECT COUNT(*) FROM order_items WHERE order_id = o.id) as items_count
        FROM orders o
        LEFT JOIN customers c ON o.customer_id = c.id
        LEFT JOIN employees e ON o.rep_id = e.id
        WHERE o.payment_method = 'Credit' AND o.order_status != 'cancelled'
        ORDER BY o.created_at DESC
    ");
    $creditSales = $creditSalesStmt->fetchAll();

    // Other Sales (Bank & Cheque)
    $otherSalesStmt = $pdo->query("
        SELECT 
            o.id, o.created_at, o.total_amount, o.payment_method,
            o.customer_id, c.name as customer_name, 
            e.name as rep_name,
            (SELECT COUNT(*) FROM order_items WHERE order_id = o.id) as items_count
        FROM orders o
        LEFT JOIN customers c ON o.customer_id = c.id
        LEFT JOIN employees e ON o.rep_id = e.id
        WHERE o.payment_method NOT IN ('Cash', 'Credit') AND o.order_status != 'cancelled'
        ORDER BY o.created_at DESC
    ");
    $otherSales = $otherSalesStmt->fetchAll();

} catch (\PDOException $e) {
    die("Database query failed: " . $e->getMessage());
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fintrix Sales Analytics & Reporting Dashboard</title>
    
    <!-- CSS Dependencies -->
    <link rel="stylesheet" href="css/style.css">
    
    <!-- Lucide Icons Library (via CDN) -->
    <script src="https://unpkg.com/lucide@latest"></script>
    <!-- Chart.js (via CDN) -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <div class="app-container">
        <!-- Sidebar Navigation -->
        <aside class="sidebar">
            <div class="logo-container">
                <div class="logo-icon">
                    <i data-lucide="trending-up"></i>
                </div>
                <div class="logo-text">FINTRIX DB</div>
            </div>
            
            <nav class="sidebar-nav">
                <div class="sidebar-section-title" style="font-size: 0.7rem; color: var(--text-muted); text-transform: uppercase; letter-spacing: 1px; padding: 0.5rem 1rem; margin-top: 0.5rem; font-weight: 700;">Sales Reports</div>
                <a class="nav-item active" data-target="section-overview">
                    <i data-lucide="layout-dashboard"></i>
                    <span>Overview Dashboard</span>
                </a>
                <a class="nav-item nav-cash" data-target="section-cash">
                    <i data-lucide="banknote"></i>
                    <span>Cash Sales</span>
                </a>
                <a class="nav-item nav-credit" data-target="section-credit">
                    <i data-lucide="credit-card"></i>
                    <span>Credit Sales</span>
                </a>
                <a class="nav-item nav-other" data-target="section-other">
                    <i data-lucide="landmark"></i>
                    <span>Other Sales</span>
                </a>
                
                <div class="sidebar-section-title" style="font-size: 0.7rem; color: var(--text-muted); text-transform: uppercase; letter-spacing: 1px; padding: 0.5rem 1rem; margin-top: 1.5rem; font-weight: 700;">Stock Reports</div>
                <a href="stock_report.php" class="nav-item">
                    <i data-lucide="boxes"></i>
                    <span>Stock Audit Report</span>
                </a>
            </nav>
            
            <div class="sidebar-footer">
                <p>Report System v1.2</p>
                <p style="font-size: 0.7rem; margin-top: 4px;">Localhost XAMPP Server</p>
            </div>
        </aside>

        <!-- Main Dashboard Viewport -->
        <main class="main-content">
            <!-- Header -->
            <header class="top-header">
                <div class="header-title">
                    <h1 id="page-display-title">Sales Data Hub</h1>
                    <p>Comprehensive transaction monitoring and metrics auditing</p>
                </div>
                <div class="header-actions">
                    <div style="background: var(--bg-glass); border: 1px solid var(--border-glass); padding: 0.5rem 1rem; border-radius: 12px; font-size: 0.85rem; display: flex; align-items: center; gap: 0.5rem;">
                        <span style="width: 8px; height: 8px; background: var(--accent-emerald); border-radius: 50%; display: inline-block; box-shadow: 0 0 8px var(--accent-emerald);"></span>
                        <span>DB: fintrix_db (Connected)</span>
                    </div>
                </div>
            </header>

            <!-- ========================================================================= -->
            <!-- SECTION 1: OVERVIEW DASHBOARD -->
            <!-- ========================================================================= -->
            <section id="section-overview" class="dashboard-section active">
                <!-- KPI Widgets Grid -->
                <div class="kpi-grid">
                    <!-- KPI Card 1: Total Sales -->
                    <div class="kpi-card kpi-orders">
                        <div class="kpi-header">
                            <span class="kpi-title">Active Revenue</span>
                            <div class="kpi-icon"><i data-lucide="bar-chart-3"></i></div>
                        </div>
                        <div class="kpi-value">Rs. <?= number_format($totalSalesSum, 2) ?></div>
                        <div class="kpi-footer">
                            <span class="kpi-trend up"><i data-lucide="check"></i> Active</span>
                            <span><?= $totalSalesCount ?> Invoices Generated</span>
                        </div>
                    </div>

                    <!-- KPI Card 2: Cash Sales -->
                    <div class="kpi-card kpi-cash">
                        <div class="kpi-header">
                            <span class="kpi-title">Cash Sales</span>
                            <div class="kpi-icon"><i data-lucide="banknote"></i></div>
                        </div>
                        <div class="kpi-value">Rs. <?= number_format($totalCashSum, 2) ?></div>
                        <div class="kpi-footer">
                            <span><?= $totalCashCount ?> Paid Cash Sales</span>
                        </div>
                    </div>

                    <!-- KPI Card 3: Credit Sales -->
                    <div class="kpi-card kpi-credit">
                        <div class="kpi-header">
                            <span class="kpi-title">Credit Sales</span>
                            <div class="kpi-icon"><i data-lucide="credit-card"></i></div>
                        </div>
                        <div class="kpi-value">Rs. <?= number_format($totalCreditSum, 2) ?></div>
                        <div class="kpi-footer">
                            <span style="color: var(--accent-amber); font-weight: 500;">
                                Oustanding: Rs. <?= number_format($totalCreditOutstanding, 2) ?>
                            </span>
                        </div>
                    </div>

                    <!-- KPI Card 4: Other Sales -->
                    <div class="kpi-card kpi-other">
                        <div class="kpi-header">
                            <span class="kpi-title">Other (Bank/Cheque)</span>
                            <div class="kpi-icon"><i data-lucide="landmark"></i></div>
                        </div>
                        <div class="kpi-value">Rs. <?= number_format($totalOtherSum, 2) ?></div>
                        <div class="kpi-footer">
                            <span><?= $totalOtherCount ?> Transactions</span>
                        </div>
                    </div>
                </div>

                <!-- Charts Grid -->
                <div class="charts-grid">
                    <!-- Chart 1: Revenue Trends -->
                    <div class="chart-card">
                        <div class="chart-header">
                            <h3 class="chart-title">Daily Sales Trends</h3>
                            <span style="font-size: 0.8rem; color: var(--text-secondary);">Last 30 Active Days</span>
                        </div>
                        <div class="chart-container">
                            <canvas id="revenueTrendChart"></canvas>
                        </div>
                    </div>

                    <!-- Chart 2: Method splits -->
                    <div class="chart-card">
                        <div class="chart-header">
                            <h3 class="chart-title">Sales Distribution</h3>
                            <span style="font-size: 0.8rem; color: var(--text-secondary);">By Payment Mode</span>
                        </div>
                        <div class="chart-container" style="display: flex; align-items: center; justify-content: center;">
                            <canvas id="distributionChart" style="max-height: 250px; max-width: 250px;"></canvas>
                        </div>
                    </div>
                </div>

                <!-- Split Grid: Top Selling / Top Customers / Recent Orders -->
                <div class="split-grid">
                    <!-- Top Selling Products -->
                    <div class="split-card">
                        <div class="split-card-header">
                            <h3 class="split-card-title"><i data-lucide="package" style="color: var(--accent-indigo);"></i> Top Selling Products</h3>
                            <span class="badge badge-paid">Qty</span>
                        </div>
                        <div class="split-card-list">
                            <?php if (!empty($topProducts)): ?>
                                <?php foreach ($topProducts as $p): ?>
                                    <div class="split-item">
                                        <div class="split-item-left">
                                            <span class="split-item-name"><?= htmlspecialchars($p['name']) ?></span>
                                            <span class="split-item-sub">SKU: <?= htmlspecialchars($p['sku']) ?></span>
                                        </div>
                                        <div class="split-item-right">
                                            <div class="split-item-val"><?= $p['total_qty'] ?> Packs</div>
                                            <div class="split-item-sub">Rs. <?= number_format($p['total_revenue'], 2) ?></div>
                                        </div>
                                    </div>
                                <?php endforeach; ?>
                            <?php else: ?>
                                <p style="color: var(--text-muted); text-align: center; padding: 2rem;">No items data found</p>
                            <?php endif; ?>
                        </div>
                    </div>

                    <!-- Top Customers -->
                    <div class="split-card">
                        <div class="split-card-header">
                            <h3 class="split-card-title"><i data-lucide="users" style="color: var(--accent-cyan);"></i> Top Customers</h3>
                            <span class="badge badge-waiting">Total spent</span>
                        </div>
                        <div class="split-card-list">
                            <?php if (!empty($topCustomers)): ?>
                                <?php foreach ($topCustomers as $c): ?>
                                    <div class="split-item">
                                        <div class="split-item-left">
                                            <span class="split-item-name">
                                                <?php if (!empty($c['customer_id'])): ?>
                                                    <a href="#" class="customer-link" onclick="viewCustomerProfile(<?= $c['customer_id'] ?>); return false;"><?= htmlspecialchars($c['name']) ?></a>
                                                <?php else: ?>
                                                    <?= htmlspecialchars($c['name']) ?>
                                                <?php endif; ?>
                                            </span>
                                            <span class="split-item-sub">📞 <?= htmlspecialchars($c['phone'] ?: 'N/A') ?></span>
                                        </div>
                                        <div class="split-item-right">
                                            <div class="split-item-val">Rs. <?= number_format($c['total_spent'], 2) ?></div>
                                            <div class="split-item-sub"><?= $c['order_count'] ?> Orders Placed</div>
                                        </div>
                                    </div>
                                <?php endforeach; ?>
                            <?php else: ?>
                                <p style="color: var(--text-muted); text-align: center; padding: 2rem;">No customer data found</p>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>

                <!-- Recent Sales Table -->
                <div class="table-card">
                    <div class="table-filters" style="border-bottom: none;">
                        <h3 class="chart-title"><i data-lucide="history" style="color: var(--accent-amber); vertical-align: middle; margin-right: 0.5rem; display: inline-block;"></i> Recent Orders Activity</h3>
                    </div>
                    <div class="table-responsive">
                        <table class="glass-table">
                            <thead>
                                <tr>
                                    <th>Order ID</th>
                                    <th>Customer</th>
                                    <th>Method</th>
                                    <th>Date</th>
                                    <th>Status</th>
                                    <th style="text-align: right;">Total Amount</th>
                                    <th style="text-align: center;">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($recentOrders as $ro): ?>
                                    <tr>
                                        <td>#<?= $ro['id'] ?></td>
                                        <td>
                                            <?php if (!empty($ro['customer_id'])): ?>
                                                <a href="#" class="customer-link" onclick="viewCustomerProfile(<?= $ro['customer_id'] ?>); return false;"><?= htmlspecialchars($ro['customer_name']) ?></a>
                                            <?php else: ?>
                                                <?= htmlspecialchars($ro['customer_name'] ?? 'Walk-in Customer') ?>
                                            <?php endif; ?>
                                        </td>
                                        <td>
                                            <span class="badge badge-method <?= strtolower(str_replace(' ', '-', $ro['payment_method'])) ?>">
                                                <?= $ro['payment_method'] ?>
                                            </span>
                                        </td>
                                        <td style="color: var(--text-secondary);"><?= date('Y-m-d H:i', strtotime($ro['created_at'])) ?></td>
                                        <td>
                                            <span class="badge badge-<?= $ro['payment_status'] ?>">
                                                <?= $ro['payment_status'] ?>
                                            </span>
                                        </td>
                                        <td style="text-align: right; font-weight: 600;">Rs. <?= number_format($ro['total_amount'], 2) ?></td>
                                        <td style="text-align: center;">
                                            <button class="btn-view" onclick="viewOrderDetails(<?= $ro['id'] ?>)">
                                                <i data-lucide="eye"></i> View
                                            </button>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>

            <!-- ========================================================================= -->
            <!-- SECTION 2: CASH SALES TAB -->
            <!-- ========================================================================= -->
            <section id="section-cash" class="dashboard-section">
                <!-- Filter bar -->
                <div class="table-card" style="margin-bottom: 1.5rem;">
                    <div class="table-filters">
                        <div class="filter-group">
                            <div class="search-input-wrapper">
                                <i data-lucide="search"></i>
                                <input type="text" id="cash-search" class="search-input" placeholder="Search Order ID, Customer, Rep...">
                            </div>
                            <div style="display: flex; align-items: center; gap: 0.5rem;">
                                <span style="font-size: 0.8rem; color: var(--text-secondary);">From:</span>
                                <input type="date" id="cash-date-start" class="form-date">
                            </div>
                            <div style="display: flex; align-items: center; gap: 0.5rem;">
                                <span style="font-size: 0.8rem; color: var(--text-secondary);">To:</span>
                                <input type="date" id="cash-date-end" class="form-date">
                            </div>
                        </div>
                        
                        <!-- Mini filtered summaries -->
                        <div style="display: flex; gap: 1.5rem;">
                            <div style="text-align: right;">
                                <div style="font-size: 0.75rem; color: var(--text-muted); text-transform: uppercase;">Filtered Count</div>
                                <div id="cash-filtered-count" style="font-family: var(--font-heading); font-weight: 700; font-size: 1.15rem; color: var(--accent-emerald);"><?= count($cashSales) ?></div>
                            </div>
                            <div style="text-align: right; border-left: 1px solid var(--border-glass); padding-left: 1.5rem;">
                                <div style="font-size: 0.75rem; color: var(--text-muted); text-transform: uppercase;">Filtered Total</div>
                                <div id="cash-filtered-total" style="font-family: var(--font-heading); font-weight: 700; font-size: 1.15rem; color: var(--accent-emerald);">Rs. <?= number_format($totalCashSum, 2) ?></div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="table-responsive">
                        <table class="glass-table" id="cash-sales-table">
                            <thead>
                                <tr>
                                    <th>Order ID</th>
                                    <th>Customer Name</th>
                                    <th>Sales Rep</th>
                                    <th>Created Date</th>
                                    <th style="text-align: center;">Item Count</th>
                                    <th style="text-align: right;">Sales Total</th>
                                    <th style="text-align: center;">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php if (!empty($cashSales)): ?>
                                    <?php foreach ($cashSales as $sale): ?>
                                        <tr data-date="<?= date('Y-m-d', strtotime($sale['created_at'])) ?>" data-amount="<?= $sale['total_amount'] ?>">
                                            <td>#<?= $sale['id'] ?></td>
                                            <td style="font-weight: 500;">
                                                <?php if (!empty($sale['customer_id'])): ?>
                                                    <a href="#" class="customer-link" onclick="viewCustomerProfile(<?= $sale['customer_id'] ?>); return false;"><?= htmlspecialchars($sale['customer_name']) ?></a>
                                                <?php else: ?>
                                                    <?= htmlspecialchars($sale['customer_name'] ?? 'Walk-in Customer') ?>
                                                <?php endif; ?>
                                            </td>
                                            <td style="color: var(--text-secondary);"><?= htmlspecialchars($sale['rep_name'] ?? 'Direct Sales') ?></td>
                                            <td style="color: var(--text-secondary);"><?= date('Y-m-d H:i', strtotime($sale['created_at'])) ?></td>
                                            <td style="text-align: center;"><span class="badge badge-method"><?= $sale['items_count'] ?> items</span></td>
                                            <td style="text-align: right; font-weight: 600; color: var(--accent-emerald);">Rs. <?= number_format($sale['total_amount'], 2) ?></td>
                                            <td style="text-align: center;">
                                                <button class="btn-view" onclick="viewOrderDetails(<?= $sale['id'] ?>)">
                                                    <i data-lucide="eye"></i> Details
                                                </button>
                                            </td>
                                        </tr>
                                    <?php endforeach; ?>
                                <?php else: ?>
                                    <tr class="empty-row">
                                        <td colspan="7" style="text-align: center; padding: 4rem;">No cash sales records found in database</td>
                                    </tr>
                                <?php endif; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>

            <!-- ========================================================================= -->
            <!-- SECTION 3: CREDIT SALES TAB -->
            <!-- ========================================================================= -->
            <section id="section-credit" class="dashboard-section">
                <!-- Filter bar -->
                <div class="table-card" style="margin-bottom: 1.5rem;">
                    <div class="table-filters">
                        <div class="filter-group">
                            <div class="search-input-wrapper">
                                <i data-lucide="search"></i>
                                <input type="text" id="credit-search" class="search-input" placeholder="Search Order ID, Customer, Rep...">
                            </div>
                            <div style="display: flex; align-items: center; gap: 0.5rem;">
                                <span style="font-size: 0.8rem; color: var(--text-secondary);">From:</span>
                                <input type="date" id="credit-date-start" class="form-date">
                            </div>
                            <div style="display: flex; align-items: center; gap: 0.5rem;">
                                <span style="font-size: 0.8rem; color: var(--text-secondary);">To:</span>
                                <input type="date" id="credit-date-end" class="form-date">
                            </div>
                            <div>
                                <select id="credit-status-filter" class="form-select">
                                    <option value="all">All Clearing Status</option>
                                    <option value="outstanding">Outstanding Balance</option>
                                    <option value="cleared">Cleared (Fully Paid)</option>
                                </select>
                            </div>
                        </div>
                        
                        <!-- Mini filtered summaries -->
                        <div style="display: flex; gap: 1.5rem;">
                            <div style="text-align: right;">
                                <div style="font-size: 0.75rem; color: var(--text-muted); text-transform: uppercase;">Filtered Count</div>
                                <div id="credit-filtered-count" style="font-family: var(--font-heading); font-weight: 700; font-size: 1.15rem; color: var(--accent-amber);"><?= count($creditSales) ?></div>
                            </div>
                            <div style="text-align: right; border-left: 1px solid var(--border-glass); padding-left: 1.5rem;">
                                <div style="font-size: 0.75rem; color: var(--text-muted); text-transform: uppercase;">Filtered Value</div>
                                <div id="credit-filtered-total" style="font-family: var(--font-heading); font-weight: 700; font-size: 1.15rem; color: var(--accent-amber);">Rs. <?= number_format($totalCreditSum, 2) ?></div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="table-responsive">
                        <table class="glass-table" id="credit-sales-table">
                            <thead>
                                <tr>
                                    <th>Order ID</th>
                                    <th>Customer Name</th>
                                    <th>Sales Rep</th>
                                    <th>Created Date</th>
                                    <th>Payment Status</th>
                                    <th style="text-align: right;">Total Amount</th>
                                    <th style="text-align: right;">Paid Amount</th>
                                    <th style="text-align: right;">Outstanding</th>
                                    <th style="text-align: center;">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php if (!empty($creditSales)): ?>
                                    <?php foreach ($creditSales as $sale): 
                                        $outstanding = $sale['total_amount'] - $sale['paid_amount'];
                                    ?>
                                        <tr data-date="<?= date('Y-m-d', strtotime($sale['created_at'])) ?>" 
                                            data-amount="<?= $sale['total_amount'] ?>"
                                            data-status="<?= $sale['payment_status'] ?>">
                                            <td>#<?= $sale['id'] ?></td>
                                            <td style="font-weight: 500;">
                                                <?php if (!empty($sale['customer_id'])): ?>
                                                    <a href="#" class="customer-link" onclick="viewCustomerProfile(<?= $sale['customer_id'] ?>); return false;"><?= htmlspecialchars($sale['customer_name']) ?></a>
                                                <?php else: ?>
                                                    <?= htmlspecialchars($sale['customer_name'] ?? 'Walk-in Customer') ?>
                                                <?php endif; ?>
                                            </td>
                                            <td style="color: var(--text-secondary);"><?= htmlspecialchars($sale['rep_name'] ?? 'Direct Sales') ?></td>
                                            <td style="color: var(--text-secondary);"><?= date('Y-m-d H:i', strtotime($sale['created_at'])) ?></td>
                                            <td>
                                                <span class="badge badge-<?= $sale['payment_status'] ?>">
                                                    <?= $sale['payment_status'] ?>
                                                </span>
                                            </td>
                                            <td style="text-align: right; font-weight: 600;">Rs. <?= number_format($sale['total_amount'], 2) ?></td>
                                            <td style="text-align: right; color: var(--accent-emerald);">Rs. <?= number_format($sale['paid_amount'], 2) ?></td>
                                            <td style="text-align: right; font-weight: 600; color: <?= $outstanding > 0 ? 'var(--accent-amber)' : 'var(--text-secondary)' ?>;">
                                                Rs. <?= number_format($outstanding, 2) ?>
                                            </td>
                                            <td style="text-align: center;">
                                                <button class="btn-view" onclick="viewOrderDetails(<?= $sale['id'] ?>)">
                                                    <i data-lucide="eye"></i> Details
                                                </button>
                                            </td>
                                        </tr>
                                    <?php endforeach; ?>
                                <?php else: ?>
                                    <tr class="empty-row">
                                        <td colspan="9" style="text-align: center; padding: 4rem;">No credit sales records found in database</td>
                                    </tr>
                                <?php endif; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>

            <!-- ========================================================================= -->
            <!-- SECTION 4: OTHER SALES TAB -->
            <!-- ========================================================================= -->
            <section id="section-other" class="dashboard-section">
                <!-- Filter bar -->
                <div class="table-card" style="margin-bottom: 1.5rem;">
                    <div class="table-filters">
                        <div class="filter-group">
                            <div class="search-input-wrapper">
                                <i data-lucide="search"></i>
                                <input type="text" id="other-search" class="search-input" placeholder="Search Order ID, Customer, Rep...">
                            </div>
                            <div style="display: flex; align-items: center; gap: 0.5rem;">
                                <span style="font-size: 0.8rem; color: var(--text-secondary);">From:</span>
                                <input type="date" id="other-date-start" class="form-date">
                            </div>
                            <div style="display: flex; align-items: center; gap: 0.5rem;">
                                <span style="font-size: 0.8rem; color: var(--text-secondary);">To:</span>
                                <input type="date" id="other-date-end" class="form-date">
                            </div>
                            <div>
                                <select id="other-method-filter" class="form-select">
                                    <option value="all">All Other Methods</option>
                                    <option value="bank">Bank Transfers Only</option>
                                    <option value="cheque">Cheques Only</option>
                                </select>
                            </div>
                        </div>
                        
                        <!-- Mini filtered summaries -->
                        <div style="display: flex; gap: 1.5rem;">
                            <div style="text-align: right;">
                                <div style="font-size: 0.75rem; color: var(--text-muted); text-transform: uppercase;">Filtered Count</div>
                                <div id="other-filtered-count" style="font-family: var(--font-heading); font-weight: 700; font-size: 1.15rem; color: var(--accent-cyan);"><?= count($otherSales) ?></div>
                            </div>
                            <div style="text-align: right; border-left: 1px solid var(--border-glass); padding-left: 1.5rem;">
                                <div style="font-size: 0.75rem; color: var(--text-muted); text-transform: uppercase;">Filtered Value</div>
                                <div id="other-filtered-total" style="font-family: var(--font-heading); font-weight: 700; font-size: 1.15rem; color: var(--accent-cyan);">Rs. <?= number_format($totalOtherSum, 2) ?></div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="table-responsive">
                        <table class="glass-table" id="other-sales-table">
                            <thead>
                                <tr>
                                    <th>Order ID</th>
                                    <th>Customer Name</th>
                                    <th>Sales Rep</th>
                                    <th>Created Date</th>
                                    <th style="text-align: center;">Payment Method</th>
                                    <th style="text-align: center;">Item Count</th>
                                    <th style="text-align: right;">Sales Total</th>
                                    <th style="text-align: center;">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php if (!empty($otherSales)): ?>
                                    <?php foreach ($otherSales as $sale): ?>
                                        <tr data-date="<?= date('Y-m-d', strtotime($sale['created_at'])) ?>" 
                                            data-amount="<?= $sale['total_amount'] ?>"
                                            data-method="<?= $sale['payment_method'] ?>">
                                            <td>#<?= $sale['id'] ?></td>
                                            <td style="font-weight: 500;">
                                                <?php if (!empty($sale['customer_id'])): ?>
                                                    <a href="#" class="customer-link" onclick="viewCustomerProfile(<?= $sale['customer_id'] ?>); return false;"><?= htmlspecialchars($sale['customer_name']) ?></a>
                                                <?php else: ?>
                                                    <?= htmlspecialchars($sale['customer_name'] ?? 'Walk-in Customer') ?>
                                                <?php endif; ?>
                                            </td>
                                            <td style="color: var(--text-secondary);"><?= htmlspecialchars($sale['rep_name'] ?? 'Direct Sales') ?></td>
                                            <td style="color: var(--text-secondary);"><?= date('Y-m-d H:i', strtotime($sale['created_at'])) ?></td>
                                            <td style="text-align: center;">
                                                <span class="badge badge-method <?= strtolower(str_replace(' ', '-', $sale['payment_method'])) ?>">
                                                    <?= $sale['payment_method'] ?>
                                                </span>
                                            </td>
                                            <td style="text-align: center;"><span class="badge badge-method"><?= $sale['items_count'] ?> items</span></td>
                                            <td style="text-align: right; font-weight: 600; color: var(--accent-cyan);">Rs. <?= number_format($sale['total_amount'], 2) ?></td>
                                            <td style="text-align: center;">
                                                <button class="btn-view" onclick="viewOrderDetails(<?= $sale['id'] ?>)">
                                                    <i data-lucide="eye"></i> Details
                                                </button>
                                            </td>
                                        </tr>
                                    <?php endforeach; ?>
                                <?php else: ?>
                                    <tr class="empty-row">
                                        <td colspan="8" style="text-align: center; padding: 4rem;">No bank/cheque sales records found in database</td>
                                    </tr>
                                <?php endif; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
        </main>
    </div>

    <!-- ========================================================================= -->
    <!-- DETAILED GLASS MODAL OVERLAY -->
    <!-- ========================================================================= -->
    <div id="details-modal" class="modal-overlay">
        <div class="modal-wrapper">
            <div class="modal-header">
                <div class="modal-title">
                    <h2 id="modal-header-label">Invoice Details: <span id="modal-order-id-title" style="color: var(--accent-indigo);">#0</span></h2>
                </div>
                <button class="btn-close">&times;</button>
            </div>
            <div class="modal-body">
                <!-- Dynamically populated via script.js -->
            </div>
        </div>
    </div>

    <!-- Interactivity script -->
    <script src="js/script.js"></script>
    
    <!-- Render Chart.js Configurations -->
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        // 1. REVENUE TREND CHART
        const trendCtx = document.getElementById('revenueTrendChart').getContext('2d');
        
        const trendDates = <?= json_encode($trendDates) ?>;
        const trendTotals = <?= json_encode($trendTotals) ?>;
        const trendCash = <?= json_encode($trendCash) ?>;
        const trendCredit = <?= json_encode($trendCredit) ?>;
        const trendOther = <?= json_encode($trendOther) ?>;

        new Chart(trendCtx, {
            type: 'line',
            data: {
                labels: trendDates,
                datasets: [
                    {
                        label: 'Total Revenue',
                        data: trendTotals,
                        borderColor: '#6366f1',
                        backgroundColor: 'rgba(99, 102, 241, 0.05)',
                        borderWidth: 3,
                        pointRadius: 3,
                        pointHoverRadius: 6,
                        tension: 0.3,
                        fill: true
                    },
                    {
                        label: 'Cash Revenue',
                        data: trendCash,
                        borderColor: '#10b981',
                        borderWidth: 2,
                        pointRadius: 0,
                        tension: 0.3,
                        hidden: true
                    },
                    {
                        label: 'Credit Revenue',
                        data: trendCredit,
                        borderColor: '#f59e0b',
                        borderWidth: 2,
                        pointRadius: 0,
                        tension: 0.3,
                        hidden: true
                    },
                    {
                        label: 'Other Revenue',
                        data: trendOther,
                        borderColor: '#0ea5e9',
                        borderWidth: 2,
                        pointRadius: 0,
                        tension: 0.3,
                        hidden: true
                    }
                ]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'top',
                        labels: {
                            color: '#9ca3af',
                            font: { family: 'Inter', size: 11 }
                        }
                    },
                    tooltip: {
                        mode: 'index',
                        intersect: false,
                        callbacks: {
                            label: function(context) {
                                return context.dataset.label + ': Rs. ' + context.raw.toLocaleString();
                            }
                        }
                    }
                },
                scales: {
                    x: {
                        grid: { color: 'rgba(255, 255, 255, 0.03)' },
                        ticks: { color: '#9ca3af', font: { family: 'Inter', size: 10 } }
                    },
                    y: {
                        grid: { color: 'rgba(255, 255, 255, 0.03)' },
                        ticks: {
                            color: '#9ca3af',
                            font: { family: 'Inter', size: 10 },
                            callback: function(value) {
                                return 'Rs. ' + (value >= 1000 ? (value/1000) + 'k' : value);
                            }
                        }
                    }
                }
            }
        });

        // 2. DISTRIBUTION DOUGHNUT CHART
        const distCtx = document.getElementById('distributionChart').getContext('2d');
        const distLabels = <?= json_encode($distLabels) ?>;
        const distTotals = <?= json_encode($distTotals) ?>;
        
        // Match theme colors
        const colorMap = {
            'Cash': '#10b981',
            'Credit': '#f59e0b',
            'Bank': '#0ea5e9',
            'Cheque': '#6366f1'
        };
        const bgColors = distLabels.map(label => colorMap[label] || '#9ca3af');

        new Chart(distCtx, {
            type: 'doughnut',
            data: {
                labels: distLabels,
                datasets: [{
                    data: distTotals,
                    backgroundColor: bgColors,
                    borderWidth: 0,
                    hoverOffset: 10
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'bottom',
                        labels: {
                            color: '#9ca3af',
                            font: { family: 'Inter', size: 11 },
                            padding: 15
                        }
                    },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                const total = context.dataset.data.reduce((a, b) => a + b, 0);
                                const percentage = ((context.raw / total) * 100).toFixed(1);
                                return ' ' + context.label + ': Rs. ' + context.raw.toLocaleString() + ' (' + percentage + '%)';
                            }
                        }
                    }
                },
                cutout: '70%'
            }
        });
    });
    </script>
</body>
</html>
