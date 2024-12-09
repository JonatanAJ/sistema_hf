function showForm(formId) {
    const forms = document.querySelectorAll('.tab-pane');
    forms.forEach(form => {
        form.classList.remove('active');
    });
    document.getElementById(formId).classList.add('active');
}

function toggleSubButtons() {
    const mainButton = document.getElementById('mainButton');
    const buttonContainer = mainButton.closest('.button-container');
    buttonContainer.classList.toggle('show-sub-buttons');
}
document.addEventListener('DOMContentLoaded', () => {
    showForm('identificacao');
});