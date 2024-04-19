<?php
	require_once("var_conn.php");
	header("Access-Control-Allow-Origin: *");
	header("Access-Control-Allow-Headers: *");
	$idData = $_SESSION["idData"];
	$sql = "SELECT tp.id, tp.nPosto, tp.prenotato, td.data, td.luogo, tb.nome FROM tprenotazione tp JOIN tdata td ON tp.data = td.id JOIN tband tb ON td.band = tb.id WHERE tp.data = $idData";
	$res = mysqli_query($con,$sql);
	$i = 0;
	while($array = mysqli_fetch_array($res)) {
		$row = array(
					"idDato" => $array['id'],
					"prenotato" => $array['prenotato'],
					"prenotato" => $array['prenotato'],
					"data" => $array['data'],
					"luogo" => $array['luogo'],
					"band" => $array['nome'],
					"nPosto" => $array['nPosto'],
					);
		$resArr[$i] = $row;
		$i++;
	}
	$risFin = array(
				"Result" => $resArr,
				);
	echo json_encode($risFin);
?>