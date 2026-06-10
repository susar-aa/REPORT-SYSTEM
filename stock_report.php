<?php
require_once 'db_connect.php';

try {
    // 1. Fetch Categories for Filter Dropdown
    $categoriesStmt = $pdo->query("SELECT id, name FROM categories ORDER BY name");
    $categories = $categoriesStmt->fetchAll();

    // 2. Fetch Master Stock Audit Dataset
    $stockAuditQuery = "
        SELECT 
            p.id, 
            p.sku, 
            p.name, 
            p.stock AS warehouse_stock,
            p.cost_price,
            p.selling_price,
            p.counted_stock,
            c.name AS category_name,
            COALESCE(grn.total_received, 0) AS total_received,
            COALESCE(sales.total_sold, 0) AS total_sold,
            COALESCE(returns.total_returned, 0) AS total_returned,
            COALESCE(damaged.total_damaged, 0) AS total_damaged,
            COALESCE(vehicle.total_vehicle, 0) AS total_vehicle
        FROM products p
        LEFT JOIN categories c ON p.category_id = c.id
        LEFT JOIN (
            SELECT product_id, SUM(quantity) AS total_received 
            FROM grn_items 
            GROUP BY product_id
        ) grn ON p.id = grn.product_id
        LEFT JOIN (
            SELECT oi.product_id, SUM(oi.quantity) AS total_sold 
            FROM order_items oi
            JOIN orders o ON oi.order_id = o.id
            WHERE o.order_status != 'cancelled'
            GROUP BY oi.product_id
        ) sales ON p.id = sales.product_id
        LEFT JOIN (
            SELECT sri.product_id, SUM(sri.quantity) AS total_returned 
            FROM sales_return_items sri
            GROUP BY sri.product_id
        ) returns ON p.id = returns.product_id
        LEFT JOIN (
            SELECT product_id, SUM(stock_qty) AS total_damaged 
            FROM damaged_stock 
            GROUP BY product_id
        ) damaged ON p.id = damaged.product_id
        LEFT JOIN (
            SELECT product_id, SUM(stock_qty) AS total_vehicle 
            FROM vehicle_stock 
            GROUP BY product_id
        ) vehicle ON p.id = vehicle.product_id
        ORDER BY category_name, p.name
    ";
    $stockAuditStmt = $pdo->query($stockAuditQuery);
    $stockAuditData = $stockAuditStmt->fetchAll();

    // Aggregate overall KPI metrics from the master dataset
    $totalSkus = count($stockAuditData);
    $totalRemainingItems = 0; // Combined Warehouse + Vehicle stock
    $totalValuationCost = 0;
    $totalValuationRetail = 0;
    $totalSoldItems = 0;
    $totalReturnedItems = 0;
    $totalDamagedItems = 0;
    $totalVarianceItems = 0;

    foreach ($stockAuditData as $row) {
        $wStock = intval($row['warehouse_stock']);
        $vStock = intval($row['total_vehicle']);
        $remainingStock = $wStock + $vStock; // Merged vehicle stock into remaining stock
        $countedStock = $row['counted_stock'] !== null ? intval($row['counted_stock']) : null;
        $actualStock = $countedStock !== null ? $countedStock : $remainingStock;
        
        $cPrice = floatval($row['cost_price']);
        $sPrice = floatval($row['selling_price']);
        
        $totalRemainingItems += $actualStock;
        $totalValuationCost += ($actualStock * $cPrice);
        $totalValuationRetail += ($actualStock * $sPrice);
        
        $totalSoldItems += intval($row['total_sold']);
        $totalReturnedItems += intval($row['total_returned']);
        $totalDamagedItems += intval($row['total_damaged']);

        // Calculated Stock = Received - Sold + Returned - Damaged
        $calculatedStock = intval($row['total_received']) - intval($row['total_sold']) + intval($row['total_returned']) - intval($row['total_damaged']);
        if ($actualStock !== $calculatedStock) {
            $totalVarianceItems++;
        }
    }

    // 3. Fetch GRN History
    $grnHistoryQuery = "
        SELECT 
            g.id, 
            g.reference_no, 
            g.grn_date, 
            g.total_amount, 
            g.payment_method, 
            g.payment_status,
            s.name AS supplier_name,
            (SELECT COUNT(*) FROM grn_items WHERE grn_id = g.id) AS items_count
        FROM grns g
        LEFT JOIN suppliers s ON g.supplier_id = s.id
        ORDER BY g.grn_date DESC
    ";
    $grnHistory = $pdo->query($grnHistoryQuery)->fetchAll();

    // 4. Fetch Vehicle Stock Allocation Details
    $vehicleStockQuery = "
        SELECT 
            vs.id, 
            vs.stock_qty, 
            vs.last_audit_date, 
            p.name AS product_name, 
            p.sku AS product_sku, 
            p.cost_price,
            e.name AS rep_name
        FROM vehicle_stock vs
        JOIN products p ON vs.product_id = p.id
        JOIN employees e ON vs.rep_id = e.id
        WHERE vs.stock_qty > 0
        ORDER BY e.name, p.name
    ";
    $vehicleAllocations = $pdo->query($vehicleStockQuery)->fetchAll();

    // 5. Fetch Damaged Stock Logs
    $damagedLogsQuery = "
        SELECT 
            ds.id, 
            ds.stock_qty, 
            ds.updated_at, 
            p.name AS product_name, 
            p.sku AS product_sku, 
            p.cost_price
        FROM damaged_stock ds
        JOIN products p ON ds.product_id = p.id
        WHERE ds.stock_qty > 0
        ORDER BY ds.updated_at DESC
    ";
    $damagedLogs = $pdo->query($damagedLogsQuery)->fetchAll();

    // 6. Fetch Sales Returns History
    $returnsLogsQuery = "
        SELECT 
            sr.id, 
            sr.total_amount, 
            sr.notes, 
            sr.created_at, 
            c.name AS customer_name,
            e.name AS rep_name
        FROM sales_returns sr
        JOIN customers c ON sr.customer_id = c.id
        LEFT JOIN employees e ON sr.rep_id = e.id
        ORDER BY sr.created_at DESC
    ";
    $returnsLogs = $pdo->query($returnsLogsQuery)->fetchAll();

} catch (\PDOException $e) {
    die("Database query failed: " . $e->getMessage());
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fintrix Inventory & Stock Reconciliation Audit</title>
    
    <!-- CSS Dependencies -->
    <link rel="stylesheet" href="css/style.css">
    
    <!-- Lucide Icons Library (via CDN) -->
    <script src="https://unpkg.com/lucide@latest"></script>
</head>
<body>
    <div class="app-container">
        <!-- Sidebar Navigation -->
        <aside class="sidebar">
            <div class="logo-container">
                <div class="logo-icon" style="background: linear-gradient(135deg, var(--accent-cyan), var(--accent-emerald)); box-shadow: 0 4px 15px rgba(16, 185, 129, 0.3);">
                    <i data-lucide="boxes"></i>
                </div>
                <div class="logo-text">FINTRIX DB</div>
            </div>
            
            <nav class="sidebar-nav">
                <div class="sidebar-section-title" style="font-size: 0.7rem; color: var(--text-muted); text-transform: uppercase; letter-spacing: 1px; padding: 0.5rem 1rem; margin-top: 0.5rem; font-weight: 700;">Sales Reports</div>
                <a href="index.php" class="nav-item">
                    <i data-lucide="layout-dashboard"></i>
                    <span>Overview Dashboard</span>
                </a>
                
                <div class="sidebar-section-title" style="font-size: 0.7rem; color: var(--text-muted); text-transform: uppercase; letter-spacing: 1px; padding: 0.5rem 1rem; margin-top: 1.5rem; font-weight: 700;">Stock Reports</div>
                <a class="nav-item active" data-target="stock-overview">
                    <i data-lucide="boxes"></i>
                    <span>Stock Overview</span>
                </a>
                <a class="nav-item nav-grn" data-target="stock-grn">
                    <i data-lucide="clipboard-list"></i>
                    <span>GRN History</span>
                </a>
                <a class="nav-item nav-returns" data-target="stock-returns">
                    <i data-lucide="refresh-cw"></i>
                    <span>Returns & Damages</span>
                </a>
            </nav>
            
            <div class="sidebar-footer">
                <p>Report System v1.2</p>
                <p style="font-size: 0.7rem; margin-top: 4px;">Localhost XAMPP Server</p>
            </div>
        </aside>

        <!-- Main Viewport -->
        <main class="main-content">
            <!-- Header -->
            <header class="top-header">
                <div class="header-title">
                    <h1>Inventory & Stock Reports</h1>
                    <p>Stock ledger audit, Goods Received Notes tracking, and returns logs</p>
                </div>
                <div class="header-actions">
                    <div style="background: var(--bg-glass); border: 1px solid var(--border-glass); padding: 0.5rem 1rem; border-radius: 12px; font-size: 0.85rem; display: flex; align-items: center; gap: 0.5rem;">
                        <span style="width: 8px; height: 8px; background: var(--accent-cyan); border-radius: 50%; display: inline-block; box-shadow: 0 0 8px var(--accent-cyan);"></span>
                        <span>Stock Live Audit</span>
                    </div>
                </div>
            </header>

            <!-- ========================================================================= -->
            <!-- SECTION 1: STOCK OVERVIEW & AUDIT TABLE -->
            <!-- ========================================================================= -->
            <section id="stock-overview" class="dashboard-section active">
                <!-- KPI Widgets Grid -->
                <div class="kpi-grid">
                    <!-- KPI Card 1: Cost Valuation -->
                    <div class="kpi-card kpi-other">
                        <div class="kpi-header">
                            <span class="kpi-title">Stock Value (Cost)</span>
                            <div class="kpi-icon" style="background: var(--accent-cyan-glow); color: var(--accent-cyan);"><i data-lucide="calculator"></i></div>
                        </div>
                        <div class="kpi-value" id="kpi-cost-valuation">Rs. <?= number_format($totalValuationCost, 2) ?></div>
                        <div class="kpi-footer">
                            <span>Remaining cost asset value</span>
                        </div>
                    </div>

                    <!-- KPI Card 2: Retail Valuation -->
                    <div class="kpi-card kpi-indigo">
                        <div class="kpi-header">
                            <span class="kpi-title">Stock Value (Retail)</span>
                            <div class="kpi-icon" style="background: var(--accent-indigo-glow); color: var(--accent-indigo);"><i data-lucide="tags"></i></div>
                        </div>
                        <div class="kpi-value" id="kpi-retail-valuation">Rs. <?= number_format($totalValuationRetail, 2) ?></div>
                        <div class="kpi-footer">
                            <span id="kpi-profit-margin" style="color: var(--accent-emerald); font-weight: 500;">
                                Profit Margin: Rs. <?= number_format($totalValuationRetail - $totalValuationCost, 2) ?>
                            </span>
                        </div>
                    </div>

                    <!-- KPI Card 3: Total Remaining Stock Count -->
                    <div class="kpi-card kpi-cash">
                        <div class="kpi-header">
                            <span class="kpi-title">Remaining Stock Qty</span>
                            <div class="kpi-icon" style="background: var(--accent-emerald-glow); color: var(--accent-emerald);"><i data-lucide="package"></i></div>
                        </div>
                        <div class="kpi-value" id="kpi-total-remaining"><?= number_format($totalRemainingItems) ?> units</div>
                        <div class="kpi-footer">
                            <span>Warehouse & Vehicle Stock combined</span>
                        </div>
                    </div>

                    <!-- KPI Card 4: Audit Alert (Variance) -->
                    <div class="kpi-card kpi-credit">
                        <div class="kpi-header">
                            <span class="kpi-title">Audit Status</span>
                            <div id="kpi-variance-icon-container" class="kpi-icon" style="background: <?= $totalVarianceItems > 0 ? 'var(--accent-amber-glow)' : 'var(--accent-emerald-glow)' ?>; color: <?= $totalVarianceItems > 0 ? 'var(--accent-amber)' : 'var(--accent-emerald)' ?>;"><i data-lucide="shield-alert"></i></div>
                        </div>
                        <div class="kpi-value" id="kpi-variance-status" style="color: <?= $totalVarianceItems > 0 ? 'var(--accent-amber)' : 'var(--accent-emerald)' ?>;">
                            <?= $totalVarianceItems > 0 ? $totalVarianceItems . ' Discrepancies' : 'Verified OK' ?>
                        </div>
                        <div class="kpi-footer">
                            <span>Calculated vs. remaining stock mismatch</span>
                        </div>
                    </div>
                </div>

                <!-- Stock Audit Table Card -->
                <div class="table-card">
                    <div class="table-filters">
                        <div class="filter-group">
                            <div class="search-input-wrapper">
                                <i data-lucide="search"></i>
                                <input type="text" id="stock-search" class="search-input" placeholder="Search product name or SKU...">
                            </div>
                            <div>
                                <select id="stock-category-filter" class="form-select">
                                    <option value="all">All Categories</option>
                                    <?php foreach ($categories as $cat): ?>
                                        <option value="<?= htmlspecialchars($cat['name']) ?>"><?= htmlspecialchars($cat['name']) ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                            <div>
                                <select id="stock-status-filter" class="form-select">
                                    <option value="all">All Statuses</option>
                                    <option value="has_variance">Variance / Mismatch Only</option>
                                    <option value="low_stock">Low Stock (≤10 Units)</option>
                                    <option value="out_of_stock">Out of Stock Only</option>
                                </select>
                            </div>
                        </div>
                        
                        <!-- Actions & Counts -->
                        <div style="display: flex; align-items: center; gap: 1.5rem;">
                            <button id="btn-export-csv" class="btn-view" style="background: var(--accent-indigo-glow); border-color: var(--accent-indigo); color: #fff;">
                                <i data-lucide="download"></i> Export CSV
                            </button>
                            <div style="text-align: right; border-left: 1px solid var(--border-glass); padding-left: 1.5rem;">
                                <div style="font-size: 0.75rem; color: var(--text-muted); text-transform: uppercase;">Filtered Count</div>
                                <div id="stock-filtered-count" style="font-family: var(--font-heading); font-weight: 700; font-size: 1.15rem; color: var(--accent-emerald);"><?= count($stockAuditData) ?></div>
                            </div>
                            <div style="text-align: right; border-left: 1px solid var(--border-glass); padding-left: 1.5rem;">
                                <div style="font-size: 0.75rem; color: var(--text-muted); text-transform: uppercase;">Filtered Cost Value</div>
                                <div id="stock-filtered-cost" style="font-family: var(--font-heading); font-weight: 700; font-size: 1.15rem; color: var(--accent-cyan);">Rs. <?= number_format($totalValuationCost, 2) ?></div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="table-responsive">
                        <table class="glass-table" id="stock-audit-table">
                            <thead>
                                <tr>
                                    <th>SKU / Code</th>
                                    <th>Product Name</th>
                                    <th class="col-grn-in" style="text-align: right;">GRN In</th>
                                    <th class="col-sold-out" style="text-align: right;">Sold Out</th>
                                    <th class="col-returned" style="text-align: right;">Returned</th>
                                    <th class="col-damaged" style="text-align: right;">Damaged</th>
                                    <th class="col-calculated" style="text-align: right;">Calculated</th>
                                    <th style="text-align: right;">Remaining Stock</th>
                                    <th style="text-align: right; width: 120px;">Counted Stock</th>
                                    <th style="text-align: right;">Variance</th>
                                    <th class="col-cost" style="text-align: right;">Unit Cost</th>
                                    <th class="col-asset" style="text-align: right;">Total Cost Asset</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php if (!empty($stockAuditData)): ?>
                                    <?php foreach ($stockAuditData as $product): 
                                        $calculated = intval($product['total_received']) - intval($product['total_sold']) + intval($product['total_returned']) - intval($product['total_damaged']);
                                        $remaining = intval($product['warehouse_stock']) + intval($product['total_vehicle']);
                                        $counted = $product['counted_stock'];
                                        $variance = ($counted !== null) ? (intval($counted) - $calculated) : ($remaining - $calculated);
                                        $assetValue = ($counted !== null ? intval($counted) : $remaining) * floatval($product['cost_price']);
                                    ?>
                                        <tr data-id="<?= $product['id'] ?>"
                                            data-category="<?= htmlspecialchars($product['category_name'] ?? 'Uncategorized') ?>" 
                                            data-warehouse="<?= $remaining ?>"
                                            data-variance="<?= $variance ?>"
                                            data-cost="<?= $product['cost_price'] ?>"
                                            data-selling="<?= $product['selling_price'] ?>">
                                            <td style="font-family: monospace; color: var(--text-secondary);"><?= htmlspecialchars($product['sku'] ?? 'N/A') ?></td>
                                            <td>
                                                <div style="font-weight: 500;"><?= htmlspecialchars($product['name']) ?></div>
                                                <div style="font-size: 0.75rem; color: var(--text-muted);"><?= htmlspecialchars($product['category_name'] ?? 'Uncategorized') ?></div>
                                            </td>
                                            <td class="col-grn-in" style="text-align: right;"><?= $product['total_received'] ?></td>
                                            <td class="col-sold-out" style="text-align: right; color: var(--accent-rose);"><?= $product['total_sold'] ?></td>
                                            <td class="col-returned" style="text-align: right; color: var(--accent-emerald);"><?= $product['total_returned'] > 0 ? '+' . $product['total_returned'] : '0' ?></td>
                                            <td class="col-damaged" style="text-align: right; color: var(--accent-rose);"><?= $product['total_damaged'] > 0 ? '-' . $product['total_damaged'] : '0' ?></td>
                                            <td class="col-calculated" style="text-align: right; font-weight: 600;" class="cell-calculated"><?= $calculated ?></td>
                                            <td style="text-align: right; font-weight: 700; color: <?= $remaining == 0 ? 'var(--accent-rose)' : 'var(--text-primary)' ?>;" class="cell-remaining">
                                                <?= $remaining ?>
                                            </td>
                                            <td style="text-align: right; padding: 4px 8px;">
                                                <div style="display: flex; align-items: center; justify-content: flex-end; gap: 6px;">
                                                    <input type="number" 
                                                           class="counted-stock-input" 
                                                           value="<?= $counted !== null ? $counted : '' ?>" 
                                                           placeholder="--" 
                                                           data-product-id="<?= $product['id'] ?>"
                                                           style="width: 75px; text-align: right; background: rgba(255,255,255,0.05); border: 1px solid var(--border-glass); border-radius: 6px; padding: 4px 6px; color: #fff; font-weight: 600; outline: none; transition: border-color 0.2s, background-color 0.2s;">
                                                    <span class="save-status-indicator" style="width: 6px; height: 6px; border-radius: 50%; display: inline-block; background: transparent; transition: background-color 0.3s;"></span>
                                                </div>
                                            </td>
                                            <td style="text-align: right; font-weight: 700; color: <?= $variance > 0 ? 'var(--accent-emerald)' : ($variance < 0 ? 'var(--accent-rose)' : 'var(--text-muted)') ?>;" class="cell-variance">
                                                <?= $variance > 0 ? '+' . $variance : ($variance < 0 ? $variance : '0') ?>
                                            </td>
                                            <td class="col-cost" style="text-align: right;">Rs. <?= number_format($product['cost_price'], 2) ?></td>
                                            <td class="col-asset" style="text-align: right; font-weight: 600; color: var(--accent-cyan);" class="cell-asset-value">Rs. <?= number_format($assetValue, 2) ?></td>
                                        </tr>
                                    <?php endforeach; ?>
                                <?php else: ?>
                                    <tr class="empty-row">
                                        <td colspan="12" style="text-align: center; padding: 4rem;">No products found in the database.</td>
                                    </tr>
                                <?php endif; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>

            <!-- ========================================================================= -->
            <!-- SECTION 2: GOODS RECEIVED NOTES HISTORY -->
            <!-- ========================================================================= -->
            <section id="stock-grn" class="dashboard-section">
                <!-- GRN Table Card -->
                <div class="table-card">
                    <div class="table-filters" style="border-bottom: none;">
                        <h3 class="chart-title"><i data-lucide="clipboard-list" style="color: var(--accent-cyan); vertical-align: middle; margin-right: 0.5rem; display: inline-block;"></i> Supplier Receipts Log (GRN)</h3>
                    </div>
                    <div class="table-responsive">
                        <table class="glass-table">
                            <thead>
                                <tr>
                                    <th>GRN ID</th>
                                    <th>Ref Number</th>
                                    <th>Supplier Name</th>
                                    <th>Received Date</th>
                                    <th>Payment Method</th>
                                    <th style="text-align: center;">Unique Items</th>
                                    <th style="text-align: right;">Total Cost Value</th>
                                    <th style="text-align: center;">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php if (!empty($grnHistory)): ?>
                                    <?php foreach ($grnHistory as $grn): ?>
                                        <tr>
                                            <td>#<?= $grn['id'] ?></td>
                                            <td style="font-family: monospace;"><?= htmlspecialchars($grn['reference_no'] ?? 'N/A') ?></td>
                                            <td style="font-weight: 500;"><?= htmlspecialchars($grn['supplier_name'] ?? 'N/A') ?></td>
                                            <td style="color: var(--text-secondary);"><?= date('Y-m-d', strtotime($grn['grn_date'])) ?></td>
                                            <td>
                                                <span class="badge badge-method"><?= $grn['payment_method'] ?></span>
                                            </td>
                                            <td style="text-align: center;"><span class="badge badge-method"><?= $grn['items_count'] ?> Products</span></td>
                                            <td style="text-align: right; font-weight: 600; color: var(--accent-cyan);">Rs. <?= number_format($grn['total_amount'], 2) ?></td>
                                            <td style="text-align: center;">
                                                <button class="btn-view" onclick="viewGrnDetails(<?= $grn['id'] ?>)">
                                                    <i data-lucide="eye"></i> View Items
                                                </button>
                                            </td>
                                        </tr>
                                    <?php endforeach; ?>
                                <?php else: ?>
                                    <tr>
                                        <td colspan="8" style="text-align: center; padding: 4rem; color: var(--text-secondary);">No GRN logs found in the database</td>
                                    </tr>
                                <?php endif; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>



            <!-- ========================================================================= -->
            <!-- SECTION 4: RETURNS AND DAMAGES LOGS -->
            <!-- ========================================================================= -->
            <section id="stock-returns" class="dashboard-section">
                <div class="charts-grid" style="grid-template-columns: 1fr 1fr;">
                    <!-- Customer Returns Log -->
                    <div class="table-card" style="margin-bottom: 0;">
                        <div class="table-filters" style="border-bottom: none;">
                            <h3 class="chart-title"><i data-lucide="refresh-cw" style="color: var(--accent-emerald); vertical-align: middle; margin-right: 0.5rem; display: inline-block;"></i> Customer Sales Returns</h3>
                        </div>
                        <div class="table-responsive">
                            <table class="glass-table">
                                <thead>
                                    <tr>
                                        <th>Return ID</th>
                                        <th>Customer</th>
                                        <th>Sales Rep</th>
                                        <th>Date</th>
                                        <th style="text-align: right;">Refund Value</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (!empty($returnsLogs)): ?>
                                        <?php foreach ($returnsLogs as $ret): ?>
                                            <tr>
                                                <td>#<?= $ret['id'] ?></td>
                                                <td>
                                                    <div style="font-weight: 500;"><?= htmlspecialchars($ret['customer_name']) ?></div>
                                                    <div style="font-size: 0.75rem; color: var(--text-muted);"><?= htmlspecialchars($ret['notes'] ?: 'No notes') ?></div>
                                                </td>
                                                <td style="color: var(--text-secondary);"><?= htmlspecialchars($ret['rep_name'] ?? 'System/Admin') ?></td>
                                                <td style="color: var(--text-secondary);"><?= date('Y-m-d H:i', strtotime($ret['created_at'])) ?></td>
                                                <td style="text-align: right; font-weight: 600; color: var(--accent-emerald);">Rs. <?= number_format($ret['total_amount'], 2) ?></td>
                                            </tr>
                                        <?php endforeach; ?>
                                    <?php else: ?>
                                        <tr>
                                            <td colspan="5" style="text-align: center; padding: 3rem; color: var(--text-secondary);">No customer returns recorded</td>
                                        </tr>
                                    <?php endif; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Damaged Stock Log -->
                    <div class="table-card" style="margin-bottom: 0;">
                        <div class="table-filters" style="border-bottom: none;">
                            <h3 class="chart-title"><i data-lucide="shield-alert" style="color: var(--accent-rose); vertical-align: middle; margin-right: 0.5rem; display: inline-block;"></i> Damaged Stock Ledger</h3>
                        </div>
                        <div class="table-responsive">
                            <table class="glass-table">
                                <thead>
                                    <tr>
                                        <th>Product SKU</th>
                                        <th>Product Name</th>
                                        <th style="text-align: right;">Quantity</th>
                                        <th style="text-align: right;">Loss Valuation</th>
                                        <th>Logged Time</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (!empty($damagedLogs)): ?>
                                        <?php foreach ($damagedLogs as $dmg): ?>
                                            <tr>
                                                <td style="font-family: monospace; color: var(--text-secondary);"><?= htmlspecialchars($dmg['product_sku']) ?></td>
                                                <td style="font-weight: 500;"><?= htmlspecialchars($dmg['product_name']) ?></td>
                                                <td style="text-align: right; font-weight: 700; color: var(--accent-rose);"><?= $dmg['stock_qty'] ?></td>
                                                <td style="text-align: right; font-weight: 600;">Rs. <?= number_format($dmg['stock_qty'] * floatval($dmg['cost_price']), 2) ?></td>
                                                <td style="color: var(--text-secondary);"><?= date('Y-m-d H:i', strtotime($dmg['updated_at'])) ?></td>
                                            </tr>
                                        <?php endforeach; ?>
                                    <?php else: ?>
                                        <tr>
                                            <td colspan="5" style="text-align: center; padding: 3rem; color: var(--text-secondary);">No damaged items recorded in ledger</td>
                                        </tr>
                                    <?php endif; ?>
                                </tbody>
                            </table>
                        </div>
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
                    <h2>Receipt Details: <span id="modal-order-id-title" style="color: var(--accent-cyan);">#0</span></h2>
                </div>
                <button class="btn-close">&times;</button>
            </div>
            <div class="modal-body">
                <!-- Dynamically populated via stock_script.js -->
            </div>
        </div>
    </div>

    <!-- Interactivity script -->
    <script src="js/stock_script.js"></script>
</body>
</html>
