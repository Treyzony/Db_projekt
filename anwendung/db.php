<?php
	$db = mysqli_connect('localhost','root','','cardshop');

	if($db->connect_error) {
		die("Connection failed: " . $db->connect_error);
	}
	
	
	if(isset($_POST['login'])){
		$username = $_POST['benutzername'];
		$password = $_POST['psw'];
		
		$sql = "SELECT password where username == $username";
		$result = $conn->query($sql);
		
		if($result == $password){
			
			session_start();
			$_SESSION['username'] = "$username";
			$_SESSION['login'] = "Success";
			header('location: index.php');
		}
	}
	if(isset($_POST['register'])){
		
		$username = $_POST['benutzername'];
		$password1 = $_POST['password1'];
		$password2 = $_POST['password2'];
		$street = $_POST['adresse'];
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

		if(empty($error)){
			
			$sql = "INSERT INTO Person (first_name,last_name,email_id,username,password,city,zip,street)
			VALUES ('". $first_name ."','". $last_name ."','". $email_id ."','". $username ."','". $password1 ."','". $password1 ."' ,'". $password1 ."')
			";
			$result = $conn->query($sql);
			header('location: index.php');
		}
	}
?>