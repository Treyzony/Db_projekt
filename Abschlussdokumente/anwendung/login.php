<?php 
	session_start();
	include("db.php");
?>
 
 <form action="login.php" method="POST">
  User name:<br>
  <input type="text" name="benutzername"><br>
  User password:<br>
  <input type="password" name="psw">
  <br>
  <input type="submit" name="login" value="Einloggen">
  <a href="register.php">Registrieren</a>
  <?php
	if(isset($_POST['login'])){
		echo "<br>";
		echo $error;
	}
  ?>
  
  
  
</form> 