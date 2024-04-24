<?php
    require_once("var_conn.php");
	header("Access-Control-Allow-Origin: *");
	header("Access-Control-Allow-Headers: *");
    if(isset($_GET["idBand"]))
        $_SESSION["idBand"] = $_GET["idBand"];
    header("Location: http://192.168.107.96/prenotazione-concerto/lista_date.html");
?>