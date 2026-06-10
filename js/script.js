// Dashboard Interactivity and Filtering Script

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
            // Check if this nav-item is a link to another page
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

    // Listen for Escape key to close modal
    document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape' && modalOverlay.classList.contains('active')) {
            closeModal();
        }
    });

    // Real-Time Table Filtering and Search for all tabs
    setupTableFiltering('cash-search', 'cash-date-start', 'cash-date-end', 'cash-sales-table', 'cash-filtered-total', 'cash-filtered-count');
    setupTableFiltering('credit-search', 'credit-date-start', 'credit-date-end', 'credit-sales-table', 'credit-filtered-total', 'credit-filtered-count', 'credit-status-filter');
    setupTableFiltering('other-search', 'other-date-start', 'other-date-end', 'other-sales-table', 'other-filtered-total', 'other-filtered-count', 'other-method-filter');
});

// Modal Operations Functions
function openModal() {
    const modal = document.getElementById('details-modal');
    modal.classList.add('active');
    document.body.style.overflow = 'hidden';
}

function closeModal() {
    const modal = document.getElementById('details-modal');
    modal.classList.remove('active');
    document.body.style.overflow = '';
}

// Format Currency
function formatCurrency(value) {
    return 'Rs. ' + parseFloat(value).toLocaleString('en-US', {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
}

// Fetch and Show Order Details
function viewOrderDetails(orderId) {
    // Show loading indicator or reset modal content
    const modalBody = document.querySelector('.modal-body');
    modalBody.innerHTML = `
        <div style="display: flex; flex-direction: column; align-items: center; justify-content: center; padding: 4rem 0; gap: 1rem;">
            <div class="loader" style="border: 4px solid rgba(255,255,255,0.05); border-top: 4px solid var(--accent-indigo); border-radius: 50%; width: 40px; height: 40px; animation: spin 1s linear infinite;"></div>
            <p style="color: var(--text-secondary);">Retrieving order details...</p>
        </div>
        <style>
            @keyframes spin { 0% { transform: rotate(0deg); } 100% { transform: rotate(360deg); } }
        </style>
    `;
    
    openModal();

    fetch('get_order_details.php?id=' + orderId)
        .then(response => {
            if (!response.ok) throw new Error('Network response was not ok');
            return response.json();
        })
        .then(data => {
            if (!data.success) {
                modalBody.innerHTML = `<p style="color: var(--accent-rose); text-align: center;">Error: ${data.error}</p>`;
                return;
            }

            const order = data.order;
            const items = data.items;
            const cheque = data.cheque;

            // Header info adjustment
            document.getElementById('modal-header-label').innerHTML = `Invoice Details: <span id="modal-order-id-title" style="color: var(--accent-indigo);">#${order.id}</span>`;

            // Generate HTML for modal
            let html = '';

            // 1. Summary Cards
            html += `
                <div class="modal-summary-grid">
                    <div class="modal-info-block">
                        <div class="modal-info-title">Customer Details</div>
                        <div class="modal-info-val">${order.customer_name || 'Walk-in Customer'}</div>
                        <div class="modal-info-desc">${order.customer_phone ? '📞 ' + order.customer_phone : ''}</div>
                        <div class="modal-info-desc">${order.customer_email ? '✉️ ' + order.customer_email : ''}</div>
                        <div class="modal-info-desc" style="margin-top: 4px; font-size: 0.75rem; color: var(--text-muted);">${order.customer_address || ''}</div>
                    </div>
                    
                    <div class="modal-info-block">
                        <div class="modal-info-title">Sales Representative</div>
                        <div class="modal-info-val">${order.rep_name || 'Direct / System'}</div>
                        <div class="modal-info-desc">${order.rep_code ? 'Code: ' + order.rep_code : ''}</div>
                        <div class="modal-info-desc">${order.rep_phone ? '📞 ' + order.rep_phone : ''}</div>
                    </div>

                    <div class="modal-info-block">
                        <div class="modal-info-title">Order Timeline</div>
                        <div class="modal-info-val" style="font-size: 0.95rem;">${new Date(order.created_at).toLocaleString('en-US', { dateStyle: 'medium', timeStyle: 'short' })}</div>
                        <div class="modal-info-desc" style="margin-top: 4px;">
                            Status: <span class="badge badge-${order.order_status === 'cancelled' ? 'cancelled' : 'paid'}" style="font-size: 0.65rem; padding: 2px 6px;">${order.order_status}</span>
                        </div>
                    </div>

                    <div class="modal-info-block">
                        <div class="modal-info-title">Payment Method</div>
                        <div class="modal-info-val">
                            <span class="badge badge-method ${order.payment_method.toLowerCase().replace(' ', '-')}">${order.payment_method}</span>
                        </div>
                        <div class="modal-info-desc" style="margin-top: 4px;">
                            Payment Status: <span class="badge badge-${order.payment_status}">${order.payment_status}</span>
                        </div>
                    </div>
                </div>
            `;

            // If cheque information is available, display a cheque clearing info block
            if (cheque) {
                html += `
                    <div class="modal-info-block" style="border-left: 4px solid var(--accent-indigo); margin-bottom: 2rem; background: rgba(99, 102, 241, 0.04);">
                        <div class="modal-info-title" style="color: var(--accent-indigo);">Cheque Clearance Status</div>
                        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(140px, 1fr)); gap: 1rem; margin-top: 0.5rem;">
                            <div>
                                <span style="font-size: 0.75rem; color: var(--text-muted);">Cheque No:</span>
                                <div style="font-weight: 600; font-size: 0.9rem;">${cheque.cheque_number}</div>
                            </div>
                            <div>
                                <span style="font-size: 0.75rem; color: var(--text-muted);">Bank:</span>
                                <div style="font-weight: 600; font-size: 0.9rem;">${cheque.bank_name}</div>
                            </div>
                            <div>
                                <span style="font-size: 0.75rem; color: var(--text-muted);">Banking Date:</span>
                                <div style="font-weight: 600; font-size: 0.9rem;">${cheque.banking_date}</div>
                            </div>
                            <div>
                                <span style="font-size: 0.75rem; color: var(--text-muted);">Status:</span>
                                <div>
                                    <span class="badge badge-${cheque.status === 'passed' ? 'paid' : (cheque.status === 'returned' ? 'cancelled' : 'pending')}" style="padding: 2px 8px; font-size: 0.65rem;">
                                        ${cheque.status}
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                `;
            }

            // 2. Items Table
            html += `
                <div class="modal-table-title">
                    <span>Items Ordered</span>
                    <span style="font-size: 0.8rem; color: var(--text-secondary); font-weight: normal;">${items.length} unique items</span>
                </div>
                <div class="modal-table-wrapper">
                    <table class="modal-table">
                        <thead>
                            <tr>
                                <th>Item Code / SKU</th>
                                <th>Product Name</th>
                                <th style="text-align: right;">Quantity</th>
                                <th style="text-align: right;">Unit Price</th>
                                <th style="text-align: right;">Discount</th>
                                <th style="text-align: right;">Total</th>
                            </tr>
                        </thead>
                        <tbody>
            `;

            items.forEach(item => {
                const total = (item.quantity * item.price) - item.discount;
                const focBadge = item.is_foc ? '<span class="badge" style="background:rgba(16, 185, 129, 0.15); color:var(--accent-emerald); font-size:0.65rem; padding:1px 4px; margin-left:6px;">FOC</span>' : '';
                html += `
                    <tr>
                        <td style="color: var(--text-secondary); font-family: monospace;">${item.product_sku || 'N/A'}</td>
                        <td style="font-weight: 500;">
                            ${item.product_name}
                            ${focBadge}
                            <div style="font-size: 0.7rem; color: var(--text-muted); font-weight: normal;">${item.category_name || ''}</div>
                        </td>
                        <td style="text-align: right; font-weight: 600;">${item.quantity}</td>
                        <td style="text-align: right;">${formatCurrency(item.price)}</td>
                        <td style="text-align: right; color: var(--accent-rose);">${item.discount > 0 ? '-' + formatCurrency(item.discount) : 'Rs. 0.00'}</td>
                        <td style="text-align: right; font-weight: 600;">${formatCurrency(total)}</td>
                    </tr>
                `;
            });

            html += `
                        </tbody>
                    </table>
                </div>
            `;

            // 3. Totals Block
            const subtotalVal = parseFloat(order.subtotal) || 0;
            const discountVal = parseFloat(order.discount_amount) || 0;
            const taxVal = parseFloat(order.tax_amount) || 0;
            const totalVal = parseFloat(order.total_amount) || 0;
            const paidVal = parseFloat(order.paid_amount) || 0;
            const remainingVal = totalVal - paidVal;

            html += `
                <div class="modal-total-block">
                    <div class="modal-total-row">
                        <span class="modal-total-label">Subtotal:</span>
                        <span class="modal-total-val">${formatCurrency(subtotalVal)}</span>
                    </div>
            `;

            if (discountVal > 0) {
                html += `
                    <div class="modal-total-row" style="color: var(--accent-rose);">
                        <span class="modal-total-label">Promo/Order Discount:</span>
                        <span class="modal-total-val">-${formatCurrency(discountVal)}</span>
                    </div>
                `;
            }

            if (taxVal > 0) {
                html += `
                    <div class="modal-total-row">
                        <span class="modal-total-label">Tax:</span>
                        <span class="modal-total-val">${formatCurrency(taxVal)}</span>
                    </div>
                `;
            }

            html += `
                    <div class="modal-total-row" style="border-top: 1px solid var(--border-glass); padding-top: 0.5rem; margin-top: 0.25rem;">
                        <span class="modal-total-label" style="font-weight: 600;">Grand Total:</span>
                        <span class="modal-total-val grand">${formatCurrency(totalVal)}</span>
                    </div>
            `;

            if (order.payment_method.toLowerCase() === 'credit') {
                html += `
                    <div class="modal-total-row" style="color: var(--accent-emerald);">
                        <span class="modal-total-label">Amount Paid:</span>
                        <span class="modal-total-val" style="font-weight: 600;">${formatCurrency(paidVal)}</span>
                    </div>
                    <div class="modal-total-row" style="color: ${remainingVal > 0 ? 'var(--accent-amber)' : 'var(--text-secondary)'}; border-top: 1px dashed var(--border-glass); padding-top: 0.25rem;">
                        <span class="modal-total-label">${remainingVal > 0 ? 'Outstanding Balance:' : 'Status:'}</span>
                        <span class="modal-total-val" style="font-weight: 700;">
                            ${remainingVal > 0 ? formatCurrency(remainingVal) : 'Fully Cleared'}
                        </span>
                    </div>
                `;
            }

            html += `</div>`;

            // Write HTML to body
            modalBody.innerHTML = html;
        })
        .catch(err => {
            console.error('Error fetching order details:', err);
            modalBody.innerHTML = `<p style="color: var(--accent-rose); text-align: center; padding: 2rem;">Failed to load order details. Please try again.</p>`;
        });
}

// Fetch and Show Customer Profile details
function viewCustomerProfile(customerId) {
    const modalBody = document.querySelector('.modal-body');
    modalBody.innerHTML = `
        <div style="display: flex; flex-direction: column; align-items: center; justify-content: center; padding: 4rem 0; gap: 1rem;">
            <div class="loader" style="border: 4px solid rgba(255,255,255,0.05); border-top: 4px solid var(--accent-indigo); border-radius: 50%; width: 40px; height: 40px; animation: spin 1s linear infinite;"></div>
            <p style="color: var(--text-secondary);">Retrieving customer profile...</p>
        </div>
        <style>
            @keyframes spin { 0% { transform: rotate(0deg); } 100% { transform: rotate(360deg); } }
        </style>
    `;
    
    openModal();

    fetch('get_customer_details.php?id=' + customerId)
        .then(response => {
            if (!response.ok) throw new Error('Network response was not ok');
            return response.json();
        })
        .then(data => {
            if (!data.success) {
                modalBody.innerHTML = `<p style="color: var(--accent-rose); text-align: center;">Error: ${data.error}</p>`;
                return;
            }

            const customer = data.customer;
            const stats = data.stats;

            // Change modal header title
            document.getElementById('modal-header-label').innerHTML = `Customer Profile: <span id="modal-order-id-title" style="color: var(--accent-cyan);">${customer.name}</span> <span style="font-size: 0.9rem; color: var(--text-muted); font-weight: normal; margin-left: 0.5rem;">(#${customer.id})</span>`;

            let html = '';

            // 1. Business Metrics Grid
            html += `
                <div class="modal-summary-grid" style="margin-bottom: 2rem;">
                    <div class="modal-info-block" style="border-left: 4px solid var(--accent-indigo); margin-bottom: 0;">
                        <div class="modal-info-title">Total Spent</div>
                        <div class="modal-info-val" style="color: var(--accent-indigo);">${formatCurrency(stats.total_spent)}</div>
                        <div class="modal-info-desc">${stats.total_orders} Orders Generated</div>
                    </div>
                    
                    <div class="modal-info-block" style="border-left: 4px solid ${stats.outstanding_balance > 0 ? 'var(--accent-amber)' : 'var(--accent-emerald)'}; margin-bottom: 0;">
                        <div class="modal-info-title">Outstanding Balance</div>
                        <div class="modal-info-val" style="color: ${stats.outstanding_balance > 0 ? 'var(--accent-amber)' : 'var(--accent-emerald)'};">${formatCurrency(stats.outstanding_balance)}</div>
                        <div class="modal-info-desc">${stats.outstanding_balance > 0 ? 'Action Required' : 'Account Cleared'}</div>
                    </div>

                    <div class="modal-info-block" style="margin-bottom: 0;">
                        <div class="modal-info-title">First Order</div>
                        <div class="modal-info-val" style="font-size: 0.95rem;">${stats.first_order_date ? new Date(stats.first_order_date).toLocaleDateString('en-US', {dateStyle: 'medium'}) : 'N/A'}</div>
                        <div class="modal-info-desc">Initial Purchase</div>
                    </div>

                    <div class="modal-info-block" style="margin-bottom: 0;">
                        <div class="modal-info-title">Latest Activity</div>
                        <div class="modal-info-val" style="font-size: 0.95rem;">${stats.last_order_date ? new Date(stats.last_order_date).toLocaleDateString('en-US', {dateStyle: 'medium'}) : 'N/A'}</div>
                        <div class="modal-info-desc">Last Active Order</div>
                    </div>
                </div>
            `;

            // 2. Profile Details Blocks
            html += `
                <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin-bottom: 1rem;">
                    <!-- Customer Information -->
                    <div class="modal-info-block" style="background: rgba(255,255,255,0.01); border: 1px solid var(--border-glass); padding: 1.25rem; margin-bottom: 0;">
                        <h3 style="font-family: var(--font-heading); color: #fff; font-size: 1rem; margin-bottom: 1rem; display: flex; align-items: center; gap: 0.5rem; margin-top: 0;">
                            <i data-lucide="user" style="color: var(--accent-cyan); width: 18px; height: 18px;"></i>
                            Primary Profile Details
                        </h3>
                        <table style="width: 100%; border-collapse: collapse; font-size: 0.85rem;">
                            <tr style="border-bottom: 1px solid rgba(255,255,255,0.03);">
                                <td style="padding: 0.5rem 0; color: var(--text-muted); width: 35%;">Owner / Contact Person:</td>
                                <td style="padding: 0.5rem 0; color: #fff; font-weight: 500;">${customer.owner_name || 'N/A'}</td>
                            </tr>
                            <tr style="border-bottom: 1px solid rgba(255,255,255,0.03);">
                                <td style="padding: 0.5rem 0; color: var(--text-muted);">Registered Email:</td>
                                <td style="padding: 0.5rem 0; color: #fff;">${customer.email || 'N/A'}</td>
                            </tr>
                            <tr style="border-bottom: 1px solid rgba(255,255,255,0.03);">
                                <td style="padding: 0.5rem 0; color: var(--text-muted);">Phone Number:</td>
                                <td style="padding: 0.5rem 0; color: #fff; font-family: monospace;">${customer.phone || 'N/A'}</td>
                            </tr>
                            <tr style="border-bottom: 1px solid rgba(255,255,255,0.03);">
                                <td style="padding: 0.5rem 0; color: var(--text-muted);">WhatsApp:</td>
                                <td style="padding: 0.5rem 0; color: #fff; font-family: monospace;">${customer.whatsapp || 'N/A'}</td>
                            </tr>
                            <tr>
                                <td style="padding: 0.5rem 0; color: var(--text-muted);">Member Since:</td>
                                <td style="padding: 0.5rem 0; color: var(--text-secondary);">${customer.created_at ? new Date(customer.created_at).toLocaleString() : 'N/A'}</td>
                            </tr>
                        </table>
                    </div>

                    <!-- Territory and Logistics Info -->
                    <div class="modal-info-block" style="background: rgba(255,255,255,0.01); border: 1px solid var(--border-glass); padding: 1.25rem; margin-bottom: 0;">
                        <h3 style="font-family: var(--font-heading); color: #fff; font-size: 1rem; margin-bottom: 1rem; display: flex; align-items: center; gap: 0.5rem; margin-top: 0;">
                            <i data-lucide="map-pin" style="color: var(--accent-amber); width: 18px; height: 18px;"></i>
                            Route & Logistics Mapping
                        </h3>
                        <table style="width: 100%; border-collapse: collapse; font-size: 0.85rem;">
                            <tr style="border-bottom: 1px solid rgba(255,255,255,0.03);">
                                <td style="padding: 0.5rem 0; color: var(--text-muted); width: 35%;">Assigned Route:</td>
                                <td style="padding: 0.5rem 0; color: #fff; font-weight: 500;">${customer.route_name || 'N/A'}</td>
                            </tr>
                            <tr style="border-bottom: 1px solid rgba(255,255,255,0.03);">
                                <td style="padding: 0.5rem 0; color: var(--text-muted);">Sales Representative:</td>
                                <td style="padding: 0.5rem 0; color: #fff;">${customer.rep_name || 'N/A'}</td>
                            </tr>
                            <tr style="border-bottom: 1px solid rgba(255,255,255,0.03);">
                                <td style="padding: 0.5rem 0; color: var(--text-muted);">Delivery Address:</td>
                                <td style="padding: 0.5rem 0; color: var(--text-secondary); line-height: 1.4;">${customer.address || 'N/A'}</td>
                            </tr>
                            <tr>
                                <td style="padding: 0.5rem 0; color: var(--text-muted);">GPS Coordinates:</td>
                                <td style="padding: 0.5rem 0; color: var(--text-secondary);">
                                    ${customer.latitude && customer.longitude ? 
                                        `<span style="font-family: monospace; font-size: 0.75rem;">${customer.latitude}, ${customer.longitude}</span>
                                         <div style="margin-top: 0.5rem;">
                                             <a href="https://www.google.com/maps/search/?api=1&query=${customer.latitude},${customer.longitude}" target="_blank" style="background: rgba(245, 158, 11, 0.15); color: var(--accent-amber); text-decoration: none; padding: 4px 8px; border-radius: 6px; font-size: 0.75rem; display: inline-flex; align-items: center; gap: 0.25rem;">
                                                 <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-navigation"><polygon points="3 11 22 2 13 21 11 13 3 11"/></svg>
                                                 Navigate
                                             </a>
                                         </div>` 
                                        : 'N/A'}
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            `;

            modalBody.innerHTML = html;

            // Re-run Lucide icons for any dynamically added icons
            if (typeof lucide !== 'undefined') {
                lucide.createIcons();
            }
        })
        .catch(err => {
            console.error('Error fetching customer profile:', err);
            modalBody.innerHTML = `<p style="color: var(--accent-rose); text-align: center; padding: 2rem;">Failed to load customer profile. Please try again.</p>`;
        });
}

// Generic Table Filtering and Real-time Aggregation
function setupTableFiltering(searchInputId, dateStartId, dateEndId, tableId, totalDisplayId, countDisplayId, extraFilterId = null) {
    const searchInput = document.getElementById(searchInputId);
    const dateStart = document.getElementById(dateStartId);
    const dateEnd = document.getElementById(dateEndId);
    const table = document.getElementById(tableId);
    const totalDisplay = document.getElementById(totalDisplayId);
    const countDisplay = document.getElementById(countDisplayId);
    const extraFilter = extraFilterId ? document.getElementById(extraFilterId) : null;

    if (!table) return;

    const rows = table.querySelectorAll('tbody tr:not(.empty-row)');

    function filterTable() {
        const query = searchInput.value.toLowerCase().trim();
        const start = dateStart.value ? new Date(dateStart.value + 'T00:00:00') : null;
        const end = dateEnd.value ? new Date(dateEnd.value + 'T23:59:59') : null;
        const extraVal = extraFilter ? extraFilter.value.toLowerCase() : 'all';

        let filteredTotal = 0;
        let visibleCount = 0;

        rows.forEach(row => {
            // Get data attributes or text
            const orderId = row.cells[0].textContent.toLowerCase();
            const customer = row.cells[1].textContent.toLowerCase();
            const rep = row.cells[2].textContent.toLowerCase();
            const dateStr = row.getAttribute('data-date'); // expected YYYY-MM-DD
            const rowDate = dateStr ? new Date(dateStr + 'T00:00:00') : null;
            const amountVal = parseFloat(row.getAttribute('data-amount')) || 0;
            
            // Extra filter checks
            let passesExtra = true;
            if (extraFilterId === 'credit-status-filter' && extraVal !== 'all') {
                const status = row.getAttribute('data-status').toLowerCase();
                if (extraVal === 'outstanding' && status !== 'pending' && status !== 'waiting') passesExtra = false;
                if (extraVal === 'cleared' && status !== 'paid') passesExtra = false;
            } else if (extraFilterId === 'other-method-filter' && extraVal !== 'all') {
                const method = row.getAttribute('data-method').toLowerCase();
                if (extraVal !== method) passesExtra = false;
            }

            // Checks
            const matchesQuery = orderId.includes(query) || customer.includes(query) || rep.includes(query);
            
            let matchesDate = true;
            if (rowDate) {
                if (start && rowDate < start) matchesDate = false;
                if (end && rowDate > end) matchesDate = false;
            }

            if (matchesQuery && matchesDate && passesExtra) {
                row.style.display = '';
                filteredTotal += amountVal;
                visibleCount++;
            } else {
                row.style.display = 'none';
            }
        });

        // Update indicators
        if (totalDisplay) {
            totalDisplay.textContent = formatCurrency(filteredTotal);
        }
        if (countDisplay) {
            countDisplay.textContent = visibleCount;
        }

        // Show/hide empty row state
        let emptyRow = table.querySelector('.empty-row');
        if (visibleCount === 0) {
            if (!emptyRow) {
                const cols = table.querySelectorAll('thead th').length;
                const newRow = document.createElement('tr');
                newRow.className = 'empty-row';
                newRow.innerHTML = `
                    <td colspan="${cols}" style="text-align: center; padding: 3rem 1.5rem; color: var(--text-secondary);">
                        <div style="display: flex; flex-direction: column; align-items: center; justify-content: center; gap: 0.5rem;">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-search-x"><path d="m13.5 8.5-5 5"/><path d="m8.5 8.5 5 5"/><circle cx="11" cy="11" r="8"/><path d="m21 21-4.3-4.3"/></svg>
                            <span>No sales records match your filters</span>
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
    }

    // Add Event Listeners
    searchInput.addEventListener('input', filterTable);
    dateStart.addEventListener('change', filterTable);
    dateEnd.addEventListener('change', filterTable);
    if (extraFilter) {
        extraFilter.addEventListener('change', filterTable);
    }
}
