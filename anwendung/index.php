<?php

	
	if(isset($_SESSION['login'])){
		$user = $_SESSION['username'];
		echo "Sie sind eingeloggt als " . $user . "!";
	}else{
		echo '<a href="login.php">Einloggen</a>';
		echo ' <br> ';
		echo '<a href="register.php">Registrieren</a>';
	}

?>