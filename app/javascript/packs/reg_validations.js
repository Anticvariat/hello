function myFunction() {
  let pas = document.getElementById("password").value;
  let pasconf = document.getElementById("password_confirm").value;
  if (pas != pasconf) {
    alert( "Пароли не совпадают!" );
    return false;
  }
  else 
    {  
      if (pas.length >= 6)
        return true;
      else
      {

    alert( "Минимальная длина пароля 6 символов!" );
        return false; 
      }
    }

}


document.addEventListener('submit', (event) => {
    if (myFunction() == false)
      event.preventDefault();
});