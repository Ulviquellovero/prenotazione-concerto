<?php
	require_once("var_conn.php");
	header("Access-Control-Allow-Origin: *");
	header("Access-Control-Allow-Headers: *");
	$sql = "SELECT * FROM tprenotazione";
	$res = mysqli_query($con,$sql);
	$i = 0;
	while($array = mysqli_fetch_array($res)) {
		$row = array(
					"idDato" => $array['id'],
					"prenotato" => $array['prenotato'],
					);
		$resArr[$i] = $row;
		$i++;
	}
	$risFin = array(
				"Result" => $resArr,
				);
	echo json_encode($risFin);
?>