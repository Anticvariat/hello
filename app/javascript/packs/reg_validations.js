function isValid() {
  let email = document.getElementById("email").value;
  let password = document.getElementById("password").value;
  let password_confirm = document.getElementById("password_confirm").value;
  let first_name = document.getElementById("first_name").value;
  let last_name = document.getElementById("last_name").value;

  if (email=="" || password=="" || password_confirm=="" || first_name=="" || last_name=="")
    {
      document.getElementById("error_explanation").innerHTML = "Заполните все поля!";
      return false;
    }

  if (password != password_confirm) {
    document.getElementById("error_explanation").innerHTML = "Пароли не совпадают!";
    return false;
  }
  else 
    {  
      if (password.length >= 6)
        return true;
      else
      {
        document.getElementById("error_explanation").innerHTML = "Минимальная длина пароля 6 символов!";
        return false; 
      }
    }

}

document.addEventListener('submit', (event) => {
    if (isValid() == false)
      event.preventDefault();
});