<?php
    require_once("var_conn.php");
	header("Access-Control-Allow-Origin: *");
	header("Access-Control-Allow-Headers: *");
    if(isset($_GET["idBand"]))
        $_SESSION["idBand"] = $_GET["idBand"];
    header("Location: lista_date.html");
?>