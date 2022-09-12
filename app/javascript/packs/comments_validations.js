function isValid() {
  let body = document.getElementById("comment_body").value;
  let erorrs = document.getElementById("errors")
  
  if (body == null || body.length < 5) {
    errors.innerHTML = "Комментарий должен содержать не менее 5 символов!";
    return false;
  }
  else if (body.length > 80) {
    errors.innerHTML = "Комментарий должен содержать не более 80 символов!";
    return false;
  }

}
let button = document.getElementById("send_comment")

if (button)
{
  button.addEventListener('click', (event) => {
    if (isValid() == false)
      event.preventDefault();
  });
}

