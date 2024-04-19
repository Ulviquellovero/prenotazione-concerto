<?php require_once("variabili_connessione.php"); ?>
<html>
    <head>
        <link rel="stylesheet" href="css/login_style.css">
    </head>

    <body>
        <?php require_once("header.html"); ?>
        <div id="container">
            <span id='testoGuida'>Inserisci username e password per accedere</span>
            <form method="POST" action="auth.php">
                <input id="username" type="text" name="username">
                <input id="password" type="password" name="password">
                <input id="submit" type="submit">
            </form>
            <?php
                if(isset($_GET['error']))
                    echo "<span id='erroreCredenziali'>Credenziali errate</span>";
            ?>
        </div>

        <p id="testo">Sito sviluppato da Samuel Ulivi<br>Email: ulivi.samuel@volta.ts.it</p>
    </body>
</html>