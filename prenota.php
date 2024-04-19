<?php
	require_once("var_conn.php");
    header("Access-Control-Allow-Origin: *");
	header("Access-Control-Allow-Headers: *");
    if(isset($_SESSION['idUtente']))
    {
        $autenticato = true;
        $idUtente = $_SESSION['idUtente'];
        $idData =  $_SESSION["idData"];
        $sql = "SELECT * FROM tprenotazione WHERE idUtente = '$idUtente' AND data = $idData";
        $res = mysqli_query($con, $sql);
        $prenotato = false;
        if(mysqli_num_rows($res) == 0)
        {
            if(isset($_REQUEST['idPosto']))
            {
                $idPosto = $_REQUEST['idPosto'];
                $sql = "UPDATE tprenotazione SET prenotato = 1, idUtente = '$idUtente' WHERE id = $idPosto";
                mysqli_query($con,$sql);
                $prenotato = true;
            }
        }
        else
            $prenotato = false; 
    }
    else
    {
        $prenotato   = false;
        $autenticato = false;
    }
    $res = array(
        'prenotato' => $prenotato,
        'autenticato' => $autenticato,
    ); 
    echo json_encode($res);
?>