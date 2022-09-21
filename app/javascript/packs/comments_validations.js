function isValid() {
  let body = document.getElementById("comment_body").value;
  let alert = document.getElementById("alert")
  
  if (body == null || body.length < 10) {
    alert.style.visibility = "visible"
    alert.innerHTML = "Комментарий должен содержать не менее 10 символов!";
    return false;
  }

}
let button = document.getElementById("send")

button.addEventListener('click', (event) => {
    if (isValid() == false)
      event.preventDefault();
});