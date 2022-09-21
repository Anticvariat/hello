function AutoHeight(element) {
    element.style.height = (element.scrollHeight)+"px";
}
let element = document.getElementById("contact-me-body")

element.addEventListener('input', (event) => {
    AutoHeight(element)
});