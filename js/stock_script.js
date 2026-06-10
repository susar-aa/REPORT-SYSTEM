// Stock Report Interactivity, Filtering, and CSV Export Script

document.addEventListener('DOMContentLoaded', function() {
    // Initialize Lucide Icons if loaded
    if (typeof lucide !== 'undefined') {
        lucide.createIcons();
    }

    // Tab Navigation
    const navItems = document.querySelectorAll('.nav-item');
    const sections = document.querySelectorAll('.dashboard-section');

    navItems.forEach(item => {
        item.addEventListener('click', function(e) {
            // Check if this nav-item is a link to another page (like index.php)
            if (this.getAttribute('href')) {
                return; // Let standard link click proceed
            }

            e.preventDefault();
            const targetSectionId = this.getAttribute('data-target');

            // Update active nav item
            navItems.forEach(n => n.classList.remove('active'));
            this.classList.add('active');

            // Update visible section
            sections.forEach(sec => {
                sec.classList.remove('active');
                if (sec.id === targetSectionId) {
                    sec.classList.add('active');
                }
            });
        });
    });

    // Modal Operations
    const modalOverlay = document.getElementById('details-modal');
    const btnCloseModal = document.querySelector('.btn-close');

    if (btnCloseModal) {
        btnCloseModal.addEventListener('click', closeModal);
    }
    
    if (modalOverlay) {
        modalOverlay.addEventListener('click', function(e) {
            if (e.target === modalOverlay) {
                closeModal();
            }
        });
    }

    // Escape key listener to close modal
    document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape' && modalOverlay && modalOverlay.classList.contains('active')) {
            closeModal();
        }
    });

    // Setup stock filtering
    setupStockTableFiltering();
    updateFilteredAggregates();
    
    // Setup CSV Export
    const btnExport = document.getElementById('btn-export-csv');
    if (btnExport) {
        btnExport.addEventListener('click', exportStockTableToCSV);
    }
    
    // Setup interactive counted stock inputs
    setupCountedStockInputs();
});

function openModal() {
    const modal = document.getElementById('details-modal');
    if (modal) {
        modal.classList.add('active');
        document.body.style.overflow = 'hidden';
    }
}

function closeModal() {
    const modal = document.getElementById('details-modal');
    if (modal) {
        modal.classList.remove('active');
        document.body.style.overflow = '';
    }
}

function formatCurrency(value) {
    return 'Rs. ' + parseFloat(value).toLocaleString('en-US', {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
}

// Fetch and Show GRN Details
function viewGrnDetails(grnId) {
    const modalBody = document.querySelector('.modal-body');
    if (!modalBody) return;

    modalBody.innerHTML = `
        <div style="display: flex; flex-direction: column; align-items: center; justify-content: center; padding: 4rem 0; gap: 1rem;">
            <div class="loader" style="border: 4px solid rgba(255,255,255,0.05); border-top: 4px solid var(--accent-indigo); border-radius: 50%; width: 40px; height: 40px; animation: spin 1s linear infinite;"></div>
            <p style="color: var(--text-secondary);">Retrieving Goods Received details...</p>
        </div>
        <style>
            @keyframes spin { 0% { transform: rotate(0deg); } 100% { transform: rotate(360deg); } }
        </style>
    `;
    
    document.getElementById('modal-order-id-title').textContent = 'GRN #' + grnId;
    openModal();

    fetch('get_grn_details.php?id=' + grnId)
        .then(response => {
            if (!response.ok) throw new Error('Network response was not ok');
            return response.json();
        })
        .then(data => {
            if (!data.success) {
                modalBody.innerHTML = `<p style="color: var(--accent-rose); text-align: center;">Error: ${data.error}</p>`;
                return;
            }

            const grn = data.grn;
            const items = data.items;

            let html = `
                <div class="modal-summary-grid">
                    <div class="modal-info-block">
                        <div class="modal-info-title">Supplier Details</div>
                        <div class="modal-info-val">${grn.supplier_name || 'N/A'}</div>
                        <div class="modal-info-desc">${grn.supplier_company ? '🏢 ' + grn.supplier_company : ''}</div>
                        <div class="modal-info-desc">${grn.supplier_phone ? '📞 ' + grn.supplier_phone : ''}</div>
                        <div class="modal-info-desc">${grn.supplier_email ? '✉️ ' + grn.supplier_email : ''}</div>
                    </div>

                    <div class="modal-info-block">
                        <div class="modal-info-title">GRN Details</div>
                        <div class="modal-info-val">Ref: ${grn.reference_no || 'N/A'}</div>
                        <div class="modal-info-desc">Date: ${grn.grn_date}</div>
                        <div class="modal-info-desc">Received: ${new Date(grn.created_at).toLocaleString()}</div>
                    </div>

                    <div class="modal-info-block">
                        <div class="modal-info-title">Payment Method</div>
                        <div class="modal-info-val">${grn.payment_method}</div>
                        <div class="modal-info-desc">Status: <span class="badge badge-${grn.payment_status === 'paid' ? 'paid' : 'pending'}">${grn.payment_status}</span></div>
                    </div>

                    <div class="modal-info-block">
                        <div class="modal-info-title">Cost Valuation</div>
                        <div class="modal-info-val" style="color: var(--accent-indigo); font-weight: 800;">${formatCurrency(grn.total_amount)}</div>
                        <div class="modal-info-desc">Paid Amount: ${formatCurrency(grn.paid_amount)}</div>
                    </div>
                </div>

                <div class="modal-table-title">
                    <span>Received Items</span>
                    <span style="font-size: 0.8rem; color: var(--text-secondary); font-weight: normal;">${items.length} items</span>
                </div>
                <div class="modal-table-wrapper">
                    <table class="modal-table">
                        <thead>
                            <tr>
                                <th>Item Code / SKU</th>
                                <th>Product Name</th>
                                <th style="text-align: right;">Received Qty</th>
                                <th style="text-align: right;">Unit Cost Price</th>
                                <th style="text-align: right;">Total Cost Value</th>
                            </tr>
                        </thead>
                        <tbody>
            `;

            items.forEach(item => {
                const total = item.quantity * item.unit_cost;
                html += `
                    <tr>
                        <td style="color: var(--text-secondary); font-family: monospace;">${item.product_sku || 'N/A'}</td>
                        <td style="font-weight: 500;">
                            ${item.product_name}
                            <div style="font-size: 0.7rem; color: var(--text-muted); font-weight: normal;">${item.category_name || ''}</div>
                        </td>
                        <td style="text-align: right; font-weight: 600;">${item.quantity}</td>
                        <td style="text-align: right;">${formatCurrency(item.unit_cost)}</td>
                        <td style="text-align: right; font-weight: 600;">${formatCurrency(total)}</td>
                    </tr>
                `;
            });

            html += `
                        </tbody>
                    </table>
                </div>
            `;

            modalBody.innerHTML = html;
        })
        .catch(err => {
            console.error('Error fetching GRN details:', err);
            modalBody.innerHTML = `<p style="color: var(--accent-rose); text-align: center; padding: 2rem;">Failed to load GRN details.</p>`;
        });
}

// Stock Table Filtering & Audit Recalculations
function setupStockTableFiltering() {
    const searchInput = document.getElementById('stock-search');
    const categoryFilter = document.getElementById('stock-category-filter');
    const statusFilter = document.getElementById('stock-status-filter');
    const table = document.getElementById('stock-audit-table');
    
    const countDisplay = document.getElementById('stock-filtered-count');
    const costDisplay = document.getElementById('stock-filtered-cost');
    const retailDisplay = document.getElementById('stock-filtered-retail');

    if (!table) return;

    const rows = table.querySelectorAll('tbody tr:not(.empty-row)');

    function filterTable() {
        const query = searchInput.value.toLowerCase().trim();
        const categoryVal = categoryFilter.value.toLowerCase();
        const statusVal = statusFilter.value;

        let visibleCount = 0;
        let totalCostValuation = 0;
        let totalRetailValuation = 0;

        rows.forEach(row => {
            const sku = row.cells[0].textContent.toLowerCase();
            const name = row.cells[1].textContent.toLowerCase();
            const category = row.getAttribute('data-category').toLowerCase();
            
            const warehouseStock = parseInt(row.getAttribute('data-warehouse')) || 0;
            const variance = parseInt(row.getAttribute('data-variance')) || 0;
            const costVal = parseFloat(row.getAttribute('data-cost')) || 0;
            const sellingVal = parseFloat(row.getAttribute('data-selling')) || 0;

            // Filters check
            const matchesQuery = sku.includes(query) || name.includes(query);
            const matchesCategory = categoryVal === 'all' || category === categoryVal;
            
            let matchesStatus = true;
            if (statusVal === 'out_of_stock') {
                matchesStatus = warehouseStock === 0;
            } else if (statusVal === 'low_stock') {
                matchesStatus = warehouseStock > 0 && warehouseStock <= 10;
            } else if (statusVal === 'has_variance') {
                matchesStatus = variance !== 0;
            }

            if (matchesQuery && matchesCategory && matchesStatus) {
                row.style.display = '';
                visibleCount++;
                totalCostValuation += warehouseStock * costVal;
                totalRetailValuation += warehouseStock * sellingVal;
            } else {
                row.style.display = 'none';
            }
        });

        // Update displays
        if (countDisplay) countDisplay.textContent = visibleCount;
        if (costDisplay) costDisplay.textContent = formatCurrency(totalCostValuation);
        if (retailDisplay) retailDisplay.textContent = formatCurrency(totalRetailValuation);

        // Manage Empty State row
        let emptyRow = table.querySelector('.empty-row');
        if (visibleCount === 0) {
            if (!emptyRow) {
                const cols = table.querySelectorAll('thead th').length;
                const newRow = document.createElement('tr');
                newRow.className = 'empty-row';
                newRow.innerHTML = `
                    <td colspan="${cols}" style="text-align: center; padding: 3rem; color: var(--text-secondary);">
                        <div style="display: flex; flex-direction: column; align-items: center; justify-content: center; gap: 0.5rem;">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-boxes"><path d="M2.97 12.92A2 2 0 0 0 2 14.63v3.24a2 2 0 0 0 .97 1.71l8.32 4.79a2 2 0 0 0 2.06 0l8.32-4.79a2 2 0 0 0 .97-1.71v-3.24a2 2 0 0 0-.97-1.71L12.5 8.2a2 2 0 0 0-1 0Z"/><path d="M7 17v4.5"/><path d="M17 17v4.5"/><path d="M2 17.5h20"/><circle cx="12" cy="5.5" r="3.5"/></svg>
                            <span>No stock audit items match your filters</span>
                        </div>
                    </td>
                `;
                table.querySelector('tbody').appendChild(newRow);
            } else {
                emptyRow.style.display = '';
            }
        } else if (emptyRow) {
            emptyRow.style.display = 'none';
        }
        updateFilteredAggregates();
    }

    searchInput.addEventListener('input', filterTable);
    categoryFilter.addEventListener('change', filterTable);
    statusFilter.addEventListener('change', filterTable);
}

// Convert table to CSV file and trigger download
function exportStockTableToCSV() {
    const table = document.getElementById('stock-audit-table');
    if (!table) return;

    let csvContent = [];
    const headers = [];
    
    // Get headers (exclude action button)
    const headerCols = table.querySelectorAll('thead th');
    headerCols.forEach(col => {
        headers.push('"' + col.textContent.replace(/"/g, '""').trim() + '"');
    });
    csvContent.push(headers.join(','));

    // Get rows
    const rows = table.querySelectorAll('tbody tr:not(.empty-row)');
    rows.forEach(row => {
        // Skip if row is filtered out
        if (row.style.display === 'none') return;
        
        const rowData = [];
        const cols = row.querySelectorAll('td');
        
        cols.forEach((col, idx) => {
            let text = col.textContent.trim();
            // Clean up currencies and commas
            text = text.replace(/Rs\.\s*/g, '');
            text = text.replace(/,/g, '');
            rowData.push('"' + text.replace(/"/g, '""') + '"');
        });
        
        csvContent.push(rowData.join(','));
    });

    // Create File and download
    const csvString = csvContent.join('\n');
    const blob = new Blob([csvString], { type: 'text/csv;charset=utf-8;' });
    const link = document.createElement('a');
    
    const dateStr = new Date().toISOString().slice(0, 10);
    link.href = URL.createObjectURL(blob);
    link.setAttribute('download', `Fintrix_Stock_Audit_Report_${dateStr}.csv`);
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}

// Setup counted stock input fields event handlers
function setupCountedStockInputs() {
    const inputs = document.querySelectorAll('.counted-stock-input');
    
    inputs.forEach(input => {
        let prevVal = input.value;
        
        // Listen to change and blur events
        const triggerSave = () => {
            const newVal = input.value.trim();
            if (newVal === prevVal) return; // No change, skip
            
            const productId = input.getAttribute('data-product-id');
            const row = input.closest('tr');
            const indicator = row.querySelector('.save-status-indicator');
            
            // Show loading status
            if (indicator) {
                indicator.style.backgroundColor = 'var(--accent-amber)';
            }
            input.style.borderColor = 'var(--accent-amber)';
            
            // Build Form Data
            const formData = new FormData();
            formData.append('product_id', productId);
            formData.append('counted_stock', newVal);
            
            fetch('update_counted_stock.php', {
                method: 'POST',
                body: formData
            })
            .then(response => {
                if (!response.ok) throw new Error('HTTP error ' + response.status);
                return response.json();
            })
            .then(data => {
                if (!data.success) {
                    console.error('Error saving counted stock:', data.error);
                    if (indicator) {
                        indicator.style.backgroundColor = 'var(--accent-rose)';
                    }
                    input.style.borderColor = 'var(--accent-rose)';
                    return;
                }
                
                // Update previous value
                prevVal = input.value;
                
                // Show success status indicator
                if (indicator) {
                    indicator.style.backgroundColor = 'var(--accent-emerald)';
                    setTimeout(() => {
                        indicator.style.backgroundColor = 'transparent';
                    }, 1500);
                }
                input.style.borderColor = 'rgba(255,255,255,0.1)';
                
                // Update row attributes
                const actualStock = data.counted !== null ? parseInt(data.counted) : parseInt(data.remaining);
                row.setAttribute('data-warehouse', actualStock);
                row.setAttribute('data-variance', data.variance);
                
                const costVal = parseFloat(row.getAttribute('data-cost')) || 0;
                const varVal = parseInt(data.variance);
                const varianceValue = varVal * costVal;
                row.setAttribute('data-variance-value', varianceValue);
                
                // Update UI cells in the table row
                const cellVariance = row.querySelector('.cell-variance');
                if (cellVariance) {
                    cellVariance.textContent = varVal > 0 ? '+' + varVal : varVal;
                    cellVariance.style.color = varVal > 0 ? 'var(--accent-emerald)' : (varVal < 0 ? 'var(--accent-rose)' : 'var(--text-muted)');
                }

                const cellVarianceValue = row.querySelector('.cell-variance-value');
                if (cellVarianceValue) {
                    cellVarianceValue.textContent = formatCurrency(varianceValue);
                    cellVarianceValue.style.color = varianceValue > 0 ? 'var(--accent-emerald)' : (varianceValue < 0 ? 'var(--accent-rose)' : 'var(--text-muted)');
                }
                
                const cellAsset = row.querySelector('.cell-asset-value');
                if (cellAsset) {
                    cellAsset.textContent = formatCurrency(actualStock * costVal);
                }
                
                // Update filtered aggregates at the bottom of the table
                updateFilteredAggregates();
                
                // Update the global KPI widgets at the top
                recalculateKPICards(data.globalVarianceCount);
            })
            .catch(err => {
                console.error('Network error saving counted stock:', err);
                if (indicator) {
                    indicator.style.backgroundColor = 'var(--accent-rose)';
                }
                input.style.borderColor = 'var(--accent-rose)';
            });
        };
        
        input.addEventListener('blur', triggerSave);
        input.addEventListener('keydown', function(e) {
            if (e.key === 'Enter') {
                input.blur(); // Trigger blur which triggers save
            }
        });
    });
}

// Recalculate and update the filtered totals display
function updateFilteredAggregates() {
    const table = document.getElementById('stock-audit-table');
    if (!table) return;
    
    const rows = table.querySelectorAll('tbody tr:not(.empty-row)');
    const countDisplay = document.getElementById('stock-filtered-count');
    const costDisplay = document.getElementById('stock-filtered-cost');
    
    let visibleCount = 0;
    let totalCostValuation = 0;

    let sumGrn = 0;
    let sumSold = 0;
    let sumReturned = 0;
    let sumDamaged = 0;
    let sumCalculated = 0;
    let sumRemaining = 0;
    let sumCounted = 0;
    let sumVariance = 0;
    let sumVarianceValue = 0;
    let sumAssetValue = 0;
    
    rows.forEach(row => {
        if (row.style.display !== 'none') {
            visibleCount++;
            
            // Get data attributes or text contents
            const warehouseStock = parseInt(row.getAttribute('data-warehouse')) || 0;
            const costVal = parseFloat(row.getAttribute('data-cost')) || 0;
            totalCostValuation += warehouseStock * costVal;

            sumGrn += parseInt(row.cells[2].textContent) || 0;
            sumSold += parseInt(row.cells[3].textContent) || 0;
            sumReturned += parseInt(row.cells[4].textContent.replace('+', '')) || 0;
            sumDamaged += parseInt(row.cells[5].textContent.replace('-', '')) || 0;
            sumCalculated += parseInt(row.cells[6].textContent) || 0;
            
            const cellRemaining = row.querySelector('.cell-remaining');
            sumRemaining += cellRemaining ? (parseInt(cellRemaining.textContent) || 0) : 0;

            const inputCounted = row.querySelector('.counted-stock-input');
            if (inputCounted && inputCounted.value !== '') {
                sumCounted += parseInt(inputCounted.value) || 0;
            }

            const cellVariance = row.querySelector('.cell-variance');
            sumVariance += cellVariance ? (parseInt(cellVariance.textContent.replace('+', '')) || 0) : 0;

            const cellVarValAttr = parseFloat(row.getAttribute('data-variance-value')) || 0;
            sumVarianceValue += cellVarValAttr;

            sumAssetValue += warehouseStock * costVal;
        }
    });
    
    if (countDisplay) countDisplay.textContent = visibleCount;
    if (costDisplay) costDisplay.textContent = formatCurrency(totalCostValuation);

    // Update tfoot cells
    const tfootGrn = document.getElementById('total-grn');
    const tfootSold = document.getElementById('total-sold');
    const tfootReturned = document.getElementById('total-returned');
    const tfootDamaged = document.getElementById('total-damaged');
    const tfootCalculated = document.getElementById('total-calculated');
    const tfootRemaining = document.getElementById('total-remaining');
    const tfootCounted = document.getElementById('total-counted');
    const tfootVariance = document.getElementById('total-variance');
    const tfootVarianceValue = document.getElementById('total-variance-value');
    const tfootAssetValue = document.getElementById('total-asset-value');

    if (tfootGrn) tfootGrn.textContent = sumGrn.toLocaleString();
    if (tfootSold) tfootSold.textContent = sumSold.toLocaleString();
    if (tfootReturned) tfootReturned.textContent = '+' + sumReturned.toLocaleString();
    if (tfootDamaged) tfootDamaged.textContent = '-' + sumDamaged.toLocaleString();
    if (tfootCalculated) tfootCalculated.textContent = sumCalculated.toLocaleString();
    if (tfootRemaining) tfootRemaining.textContent = sumRemaining.toLocaleString();
    if (tfootCounted) tfootCounted.textContent = sumCounted.toLocaleString();
    
    if (tfootVariance) {
        tfootVariance.textContent = sumVariance > 0 ? '+' + sumVariance.toLocaleString() : sumVariance.toLocaleString();
        tfootVariance.style.color = sumVariance > 0 ? 'var(--accent-emerald)' : (sumVariance < 0 ? 'var(--accent-rose)' : 'var(--text-muted)');
    }
    
    if (tfootVarianceValue) {
        tfootVarianceValue.textContent = formatCurrency(sumVarianceValue);
        tfootVarianceValue.style.color = sumVarianceValue > 0 ? 'var(--accent-emerald)' : (sumVarianceValue < 0 ? 'var(--accent-rose)' : 'var(--text-muted)');
    }

    if (tfootAssetValue) tfootAssetValue.textContent = formatCurrency(sumAssetValue);
}

// Recalculate top level dashboard KPI widgets based on the DOM table state and DB variance count
function recalculateKPICards(globalVarianceCount) {
    const table = document.getElementById('stock-audit-table');
    if (!table) return;
    
    const rows = table.querySelectorAll('tbody tr:not(.empty-row)');
    
    let totalRemainingQty = 0;
    let totalValCost = 0;
    let totalValRetail = 0;
    
    rows.forEach(row => {
        const warehouseStock = parseInt(row.getAttribute('data-warehouse')) || 0;
        const costVal = parseFloat(row.getAttribute('data-cost')) || 0;
        const sellingVal = parseFloat(row.getAttribute('data-selling')) || 0;
        
        totalRemainingQty += warehouseStock;
        totalValCost += warehouseStock * costVal;
        totalValRetail += warehouseStock * sellingVal;
    });
    
    // Update Cost Valuation Card
    const costValEl = document.getElementById('kpi-cost-valuation');
    if (costValEl) {
        costValEl.textContent = formatCurrency(totalValCost);
    }
    
    // Update Retail Valuation Card
    const retailValEl = document.getElementById('kpi-retail-valuation');
    if (retailValEl) {
        retailValEl.textContent = formatCurrency(totalValRetail);
    }
    
    // Update Profit Margin inside Retail Valuation Card
    const marginEl = document.getElementById('kpi-profit-margin');
    if (marginEl) {
        marginEl.textContent = 'Profit Margin: ' + formatCurrency(totalValRetail - totalValCost);
    }
    
    // Update Total Remaining Stock Quantity Card
    const remainingEl = document.getElementById('kpi-total-remaining');
    if (remainingEl) {
        remainingEl.textContent = totalRemainingQty.toLocaleString() + ' units';
    }
    
    // Update Audit Status Card (Variance count)
    const statusValEl = document.getElementById('kpi-variance-status');
    const iconContainer = document.getElementById('kpi-variance-icon-container');
    
    if (statusValEl) {
        if (globalVarianceCount > 0) {
            statusValEl.textContent = globalVarianceCount + ' Discrepancies';
            statusValEl.style.color = 'var(--accent-amber)';
            if (iconContainer) {
                iconContainer.style.background = 'var(--accent-amber-glow)';
                iconContainer.style.color = 'var(--accent-amber)';
            }
        } else {
            statusValEl.textContent = 'Verified OK';
            statusValEl.style.color = 'var(--accent-emerald)';
            if (iconContainer) {
                iconContainer.style.background = 'var(--accent-emerald-glow)';
                iconContainer.style.color = 'var(--accent-emerald)';
            }
        }
    }
}
