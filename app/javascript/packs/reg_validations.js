function isValid() {
  let email = document.getElementById("email").value;
  let password = document.getElementById("password").value;
  let password_confirm = document.getElementById("password_confirm").value;
  let first_name = document.getElementById("first_name").value;
  let last_name = document.getElementById("last_name").value;
  let alert = document.getElementById("alert")

  if (email=="" || password=="" || password_confirm=="" || first_name=="" || last_name=="")
    {
      alert.style.visibility = "visible"
      alert.innerHTML = "Заполните все поля!";
      return false;
    }

  if (password != password_confirm) {
    alert.style.visibility = "visible"
     alert.innerHTML = "Пароли не совпадают!";
    return false;
  }
  else 
    {  
      if (password.length >= 6)
        return true;
      else
      {
        alert.style.visibility = "visible"
        alert.innerHTML = "Минимальная длина пароля 6 символов!";
        return false; 
      }
    }

}

document.addEventListener('submit', (event) => {
    if (isValid() == false)
      event.preventDefault();
});