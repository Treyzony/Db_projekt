<?php
session_start();
include("db.php")
?>
 <form action="register.php" method ="POST">
  Benutzername:<br>
  <input type="text" name="benutzername"><br>
  Password:<br>
  <input type="password" name="password1">
  <br>
  Password wiederholen:<br>
  <input type="password" name="password2">
  <br>
  Strasse:<br>
  <input type="text" name="street">
  <br>
  PLZ:<br>
  <input type="text" name="zip">
  <br>
  Stadt:<br>
  <input type="text" name="city">
  <br>
  Email:<br>
  <input type="text" name="email">
  <br>
  Vorname:<br>
  <input type="text" name="vorname">
  <br>
  Nachname:<br>
  <input type="text" name="nachname">
  <br>
  <input type="submit"  name ="register" value="Registrieren">
</form> 

<?php



if(isset($_POST["register"])){
	if(!empty($error)){
		echo "<br>";
		foreach($error as $errorm):
			echo $errorm;
		endforeach;
	}else{
		$username = $_POST['benutzername'];
		$password1 = $_POST['password1'];
		$password2 = $_POST['password2'];
		$street = $_POST['street'];
		$plz = $_POST['plz'];
		$stadt = $_POST['stadt'];
		$email_id = $_POST['email'] ;
		$first_name = $_POST['vorname'];
		$last_name = $_POST['nachname'];

		if(empty($username) or empty($password1) or empty($adress) or empty($email_id) or empty($first_name) or empty($last_name)){
			array_push($error,"Bitte füllen Sie alle Felder aus");
		}
		if($password1 != $password2){
			array_push($error,"Passwort muss übereinstimmen");
		}
	}

}
?>