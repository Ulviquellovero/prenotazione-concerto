<?php
	require_once("var_conn.php");
	header("Access-Control-Allow-Origin: *");
	header("Access-Control-Allow-Headers: *");  
    $idBand = $_SESSION["idBand"];
    $sql = "SELECT td.id, td.data, td.luogo, tb.nome FROM tdata td JOIN tband tb ON td.band = tb.id WHERE band = $idBand";
    $res = mysqli_query($con,$sql);
    $i = 0;
    while($array = mysqli_fetch_array($res)) {
        $row = array(
                    "id" => $array['id'],
                    "data" => $array['data'],
                    "luogo" => $array['luogo'],
                    "band" => $array['nome'],
                    );
        $resArr[$i] = $row;
        $i++;
    }
    $risFin = array(
                "Result" => $resArr,
                );
    echo json_encode($risFin);
?>