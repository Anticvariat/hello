function isValid() {
  let email = document.getElementById("email").value;
  let pas = document.getElementById("password").value;
  let pasconf = document.getElementById("password_confirm").value;
  let first_name = document.getElementById("first_name").value;
  let last_name = document.getElementById("last_name").value;

  if (email=="" || pas=="" || pasconf=="" || first_name=="" || last_name=="")
    {
      document.getElementById("error_message").innerHTML = "Заполните все поля!";
      return false;
    }

  if (pas != pasconf) {
    //alert( "Пароли не совпадают!" );
    document.getElementById("error_message").innerHTML = "Пароли не совпадают!";
    return false;
  }
  else 
    {  
      if (pas.length >= 6)
        return true;
      else
      {
        document.getElementById("error_message").innerHTML = "Минимальная длина пароля 6 символов!";
        //alert( "Минимальная длина пароля 6 символов!" );
        return false; 
      }
    }

}


document.addEventListener('submit', (event) => {
    if (isValid() == false)
      event.preventDefault();
});