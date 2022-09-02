function isValid() {
  let body = document.getElementById("comment_body").value;

  if (body == "")
    {
      document.getElementById("error_explanation").innerHTML = "Заполните все поля!";
      return false;
    }

  if (body.length < 10) {
    document.getElementById("error_explanation").innerHTML = "Комментарий должен содержать не менее 10 символов!";
    return false;
  }

}

document.addEventListener('submit', (event) => {
    if (isValid() == false)
      event.preventDefault();
});