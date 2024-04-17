<?php
	require_once("var_conn.php");
	header("Access-Control-Allow-Origin: *");
	header("Access-Control-Allow-Headers: *");
    if(isset($_GET["idBand"]))
    {
        $idBand = $_GET["idBand"];
        $sql = "SELECT * FROM tDate WHERE idBand = $idBand";
        $res = mysqli_query($con,$sql);
        $i = 0;
        while($array = mysqli_fetch_array($res)) {
            $row = array(
                        "id" => $array['id'],
                        "nome" => $array['nome'],
                        );
            $resArr[$i] = $row;
            $i++;
        }
        $risFin = array(
                    "Result" => $resArr,
                    );
        echo json_encode($risFin);
    }
?>