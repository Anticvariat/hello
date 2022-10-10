function AutoHeight(element) {
    element.style.height = "100px";
    element.style.height = (element.scrollHeight)+"px";
}
let element = document.getElementById("auto-height")

AutoHeight(element)
element.addEventListener('input', (event) => {
    AutoHeight(element)
});