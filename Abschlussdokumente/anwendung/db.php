<?php
	$db = mysqli_connect('localhost','root','','cardshop');

	if($db->connect_error) {
		die("Connection failed: " . $db->connect_error);
	}
	
	
	if(isset($_POST['login'])){
		$username = $_POST['benutzername'];
		$password = $_POST['psw'];
		
		$sql = "SELECT password FROM person Where username = '". $username ."'";
		$result = mysqli_query($db,$sql);
		$res = $result->fetch_assoc();
		if($res['password'] == $password and !empty($password)){
			session_start();
			$_SESSION['username'] = $username;
			header('location: index.php');
		}else{
			$error = "Benutzername oder Password Falsch";
		}
	}
	if(isset($_POST['register'])){
		
		$username = $_POST['benutzername'];
		$password1 = $_POST['password1'];
		$password2 = $_POST['password2'];
		$street = $_POST['street'];
		$zip = $_POST['zip'];
		$city = $_POST['city'];
		$email_id = $_POST['email'] ;
		$first_name = $_POST['vorname'];
		$last_name = $_POST['nachname'];
		
		$error = [];
		
		if(empty($username) or empty($password1) or empty($email_id) or empty($first_name) or empty($last_name) or empty($city) or empty($street) or empty($zip)){
			array_push($error,"Bitte füllen Sie alle Felder aus");
		}
		if($password1 != $password2){
			array_push($error,"Passwort muss übereinstimmen");
		}

		if(empty($error)){
			
			$sql = "INSERT INTO Person (first_name,last_name,email_id,username,password,city,zip,street)
			VALUES ('". $first_name ."','". $last_name ."','". $email_id ."','". $username ."','". $password1 ."','". $city ."' ,'". $zip ."','". $street ."')";
			$result = $db->query($sql);
			header('location: index.php');
		}
		
		
	}
?>
