function isValid() {
  let body = document.getElementById("comment_body").value;
  let erorrs = document.getElementById("errors")
  
  if (body == null || body.length < 10) {
    errors.innerHTML = "Комментарий должен содержать не менее 10 символов!";
    return false;
  }

}
let button = document.getElementById("send_comment")

button.addEventListener('click', (event) => {
    if (isValid() == false)
      event.preventDefault();
});