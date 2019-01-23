<?php
	session_start();
	if(isset($logout)){
		echo "Sie haben sich ausgeloggt!<br>";
		unset($logout);
	}
	
	if(isset($_SESSION['username'])){
		$user = $_SESSION['username'];
		echo "Sie sind eingeloggt als " . $user . "!<br>";
		echo "<a href='logout.php'>Ausloggen</a>";
	}else{
		echo '<a href="login.php">Einloggen</a>';
		echo ' <br> ';
		echo '<a href="register.php">Registrieren</a>';
	}
		echo "<br><a href='search.php'>Suche</a>"

?>