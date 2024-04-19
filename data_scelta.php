<?php
    session_start();
    if(isset($_GET["idData"]))
        $_SESSION["idData"] = $_GET["idData"];
    header("Location: lista_biglietti.html");
?>