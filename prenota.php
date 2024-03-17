<?php
	require_once("var_conn.php");
    if(isset($_REQUEST['idPosto']))
    {
        $idPosto = $_REQUEST['idPosto'];
        $sql = "UPDATE tprenotazione SET prenotato = 1 WHERE id = $idPosto";
        mysqli_query($con,$sql);
    }
?>