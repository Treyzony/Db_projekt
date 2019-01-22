<?php
	session_start();
	session_unset();
	session_destroy();
	$logout = 1;
	header('location: index.php');
?>