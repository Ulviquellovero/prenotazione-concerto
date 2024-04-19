<?php
    session_start();
    if(isset($_GET["idBand"]))
        $_SESSION["idBand"] = $_GET["idBand"];
?>

<html>
    <head>
        <link rel="stylesheet" href="css/lista_biglietti_style.css">
    </head>

    <body>
        <h1 id="titoloPagina">Date </h1>
        <div id="caricamento"></div>
        <div id='listaBand'>
            
        </div>

        <script>

            var indicatoreCaricamento = document.getElementById("caricamento");
            indicatoreCaricamento.style.display = "block";
            var intervallo = setInterval(creaTabella, 1000);
            function creaTabella()
            {
                const xhttp = new XMLHttpRequest();
                xhttp.onload = function() {
                    var res = xhttp.responseText;
                    var j = JSON.parse(res);
                    var html = "";
                    html = html +  "<h2>Date Disponibili per:" + j.Result[i].band + "</h2>";
                    for( i=0; i < j.Result.length; i++)
                    {
                        html = html + "<div onClick='dataScelta(" + j.Result[i].id + ")'class='contenitoreBand'>";
                        html = html + "<div class='contenitoreScritta'>";
                        var partiData = j.Result[i].data.split("-");
                        var anno = partiData[0];
                        var mese = partiData[1];
                        var giorno = partiData[2];
                        var dataOutput = giorno + "/" + mese + "/" + anno;
                        html = html + "<h2 class='scrittaBand'>" + dataOutput + " - " + j.Result[i].luogo + "</h2>";
                        html = html + "</div>";
                        html = html + "</div>";
                    }
                    var divLista = document.getElementById("listaBand");
                    html = html.replace(/'/g, '"');
                    if(divLista.innerHTML != html)
                        divLista.innerHTML = html;
                    indicatoreCaricamento.style.display = "none";
                }
                //xhttp.open("POST", "http://192.168.8.103/quintaf/ulivi/prenotazione-concerto/vis_band.php", true);
                xhttp.open("POST", "vis_date.php", true);
                xhttp.send();
            }

            function dataScelta(id)
            {
                window.location = "lista_date.php?idBand="+id;
            }

        </script>
    </body>
</html>