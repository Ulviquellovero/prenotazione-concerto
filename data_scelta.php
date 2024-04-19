<?php
    require_once("var_conn.php");
	header("Access-Control-Allow-Origin: *");
	header("Access-Control-Allow-Headers: *");
    if(isset($_GET["idData"]))
        $_SESSION["idData"] = $_GET["idData"];
    header("Location: lista_biglietti.html");
?>