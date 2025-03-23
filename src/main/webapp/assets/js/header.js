
const avatarButton = document.getElementById('dropdownTrigger');
const userDropdown = document.getElementById('userDropdown');

avatarButton.addEventListener('click', () => {
    userDropdown.classList.toggle('hidden');
});

// Close the dropdown when clicking outside
document.addEventListener('click', (event) => {
    if (!avatarButton.contains(event.target) && !userDropdown.contains(event.target)) {
        userDropdown.classList.add('hidden');
    }
});
