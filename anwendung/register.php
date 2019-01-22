<?php 
include("db.php")
?>
 <form action="register.php">
  Benutzername:<br>
  <input type="text" name="benutzername"><br>
  Password:<br>
  <input type="password" name="password1">
  <br>
  Password wiederholen:<br>
  <input type="password" name="password2">
  <br>
  Adresse:<br>
  <input type="password" name="adresse">
  <br>
  Email:<br>
  <input type="password" name="email">
  <br>
  Vorname:<br>
  <input type="password" name="vorname">
  <br>
  Nachname:<br>
  <input type="password" name="nachname">
  <br>
  <input type="submit"  name ="register" value="Registrieren">
</form> 

<?php

if(!empty($error)){
	do{
		echo $error;
	}while($error);
}



$username = $_POST['benutzername'];
$password1 = $_POST['password1'];
$password2 = $_POST['password2'];
$adress = $_POST['adresse'];
$email_id = $_POST['email'] ;
$first_name = $_POST['vorname'];
$last_name = $_POST['nachname'];

if(empty($username) or empty($password1) or empty($adress) or empty($email_id) or empty($first_name) or empty($last_name)){
	array_push($error,"Bitte füllen Sie alle Felder aus");
}
if($password1 != $password2){
	array_push($error,"Passwort muss übereinstimmen");
}

if(empty($error)){
	echo "<br>";
	foreach($error as $errorm):
	echo $errorm;
	endforeach
}
?>