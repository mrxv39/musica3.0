// tableSelection.js
function setupTableSelection() {
    document.querySelectorAll('table tbody tr').forEach(row => {
        row.addEventListener('click', function() {
            document.querySelectorAll('table tbody tr').forEach(r => r.classList.remove('selected'));
            this.classList.add('selected');
        });
    });
}