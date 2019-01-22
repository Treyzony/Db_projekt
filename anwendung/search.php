<?php
	session_start();
	include("db.php");
?>
<form action="search.php" method="POST">
<input type="text" name="search"><input type="submit" name="such" value="suchen"><br>
<input type="radio" name="stype" value="title" checked> Title<br>
<input type="radio" name="stype" value="flavor"> Flavor Text<br>
<br>
<br>
<input type="radio" name="color" value="R">Rot<br>
<input type="radio" name="color" value="G">Grün<br>
<input type="radio" name="color" value="B">Schwarz<br>
<input type="radio" name="color" value="W">Weiß<br>
<input type="radio" name="color" value="U">Blau<br>
</form>


<?php
	if(isset($_POST['search'])){
		$searchQ =$_POST['search'];
		if($_POST['stype'] == 'title'){
			if(isset($_POST['color'])){
				$color = $_POST['color'];
				$sql = "SELECT * FROM Cardinfo WHERE Cardinfo.name LIKE '%".$searchQ."%' AND Cardinfo.card_color = '".$color."'";
			}else{
				$sql = "SELECT * FROM Cardinfo WHERE Cardinfo.name LIKE '%".$searchQ."%'";
			}
		}
		else{
			if(isset($_POST['color'])){
				$color = $_POST['color'];
				$sql = "SELECT * FROM Cardinfo WHERE Cardinfo.rules LIKE '%".$searchQ."%' AND Cardinfo.card_color = '".$color."'";
			}else{
				$sql = "SELECT * FROM Cardinfo WHERE Cardinfo.rules LIKE '%".$searchQ."%'";
			}
		}
		
		
		$sql = "SELECT * FROM card WHERE";
		$results = $db->query($sql);
		
			if(!empty($results)){
				if($results->num_rows > 0) {
						$amount = $results->num_rows;
						 echo "<table><tr><th>Name</th><th>Rarity</th></tr>";
						 while($row = $results->fetch_assoc()) {
							 
							echo "<tr><td> <a href=result.php?article='".$row['id']."'>$ ".$row["name"]." </a> </td><td>".$row["rarity"]."</td></tr>";
					}
					echo "</table>";
				}
			}
			else{
					$amount = 0;
			}
			
				echo $amount." Ergebnisse";
		
	}


?>

