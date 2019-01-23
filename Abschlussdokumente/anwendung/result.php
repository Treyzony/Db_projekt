<?php
	session_start();
	include("db.php");

$cid = $_POST['article']
$sql = "SELECT * FROM Cardinfo WHERE Cardinfo.card_id = '".$cid."'";
$result = mysqli_query($db,$sql);
$res = $result->fetch_assoc();

$cardname = $res['name'];
$cardmana = $res['converted_mana_cost'];
$cardtyp = $res['typename'];
$cardsubtyp = $res['subtypename'];
$cardpower = $res['powercnt'];
$cardtough = $res['toughness'];
$cardrule = $res['rules'];
$cardrar = $res['rarity'];
$cardcol = $res['card_color'];
$cardlang = $res['card_language'];
$cardartist = $res['artistname'];


echo "<table>";
echo "<tr><td>Name:</td><th>$res['.$.']</td></td></tr>";
echo "<tr><td>Konervtierten Manakosten:</td><th>$cardmana</td></td></tr>";
echo "<tr><td>Typname:</td><th>$cardtyp</td></td></tr>";
echo "<tr><td>Sub-Typename:</td><th>$cardsubtyp</td></td></tr>";
echo "<tr><td>Power:</td><th>$power</td></td></tr>";
echo "<tr><td>Härte:</td><th>$tough</td></td></tr>";
echo "<tr><td>Regeln:</td><th>$cardrule</td></td></tr>";
echo "<tr><td>Rarität:</td><th>$cardrar</td></td></tr>";
echo "<tr><td>Farbe:</td><th>$cardcol[</td></td></tr>";
echo "<tr><td>Sprache:</td><th>$cardlang</td></td></tr>";
echo "<tr><td>Maler:</td><th>$cardartist</td></td></tr>";
echo "</table>";

?>