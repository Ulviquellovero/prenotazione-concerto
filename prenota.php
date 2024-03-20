<?php
	require_once("var_conn.php");
    $idSessione = session_id();
    $sql = "SELECT * FROM tprenotazione WHERE idSessioneUtente = '$idSessione'";
    $res = mysqli_query($con, $sql);
    if(mysqli_num_rows($res) == 0)
    {
        if(isset($_REQUEST['idPosto']))
        {
            $idPosto = $_REQUEST['idPosto'];
            $sql = "UPDATE tprenotazione SET prenotato = 1, idSessioneUtente = '$idSessione' WHERE id = $idPosto";
            mysqli_query($con,$sql);
        }
    }
?>