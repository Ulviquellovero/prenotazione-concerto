<?php
    session_start();
    if(isset($_GET["idData"]))
        $_SESSION["idData"] = $_GET["idData"];
?>

<html>
    <head>
        <link rel="stylesheet" href="css/lista_biglietti_style.css">
    </head>

    <body>
        <button id="btnIndietro" onclick="btnIndietro()">Indietro</button>
        <div id="caricamento"></div>
        <div id='listaPrenotazioni'>
            
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
                    html = html + "<h1 id='nomeBand'>"+ j.Result[0].band + "</h1>";
                    var partiData = j.Result[0].data.split("-");
                    var anno = partiData[0];
                    var mese = partiData[1];
                    var giorno = partiData[2];
                    var dataOutput = giorno + "/" + mese + "/" + anno;
                    html = html + "<h2 id='infoConc'>Concerto in data " + dataOutput + " a " + j.Result[0].luogo + "</h2>";
                    for( i=0; i < j.Result.length; i++)
                    {
                        html = html + "<div class='contenitorePosto'>";
                        html = html + "<div class='contenitoreScrittaBtn'>";
                        html = html + "<h2 class='scrittaNPosto'>Posto n: " + j.Result[i].nPosto + "</h2>";
                        if(j.Result[i].prenotato == 0)
                            html = html + "<button onclick='prenotaPost(this.id)' class='btnPrenota' id='"+j.Result[i].idDato+"'>Prenota</button>";
                        else
                            html = html + "<button class='btnPrenotato'>Prenotato</button>";
                        html = html + "</div>";
                        html = html + "</div>";
                    }
                    var divLista = document.getElementById("listaPrenotazioni");
                    html = html.replace(/'/g, '"');
                    if(divLista.innerHTML != html)
                        divLista.innerHTML = html;
                    indicatoreCaricamento.style.display = "none";
                }
                //xhttp.open("POST", "http://192.168.8.103/quintaf/ulivi/prenotazione-concerto/vis_biglietti.php", true);
                xhttp.open("POST", "vis_biglietti.php", true);
                xhttp.send();
            }

            function prenotaPost(idPosto)
            {
                const xhttp = new XMLHttpRequest();
                xhttp.onload = function() {
                    var res = xhttp.responseText;
                    var j = JSON.parse(res);
                    if (j.prenotato) {
                        var btnCliccato = document.getElementById(idPosto);
                        btnCliccato.classList.remove("btnPrenota");
                        btnCliccato.classList.add("btnPrenotato");
                        btnCliccato.textContent = "Prenotato";
                    } else {
                        alert("Non puoi prenotare piu' di un biglietto! I posti sono limitati!");
                    }
                }
                //xhttp.open("POST", "http://192.168.8.103/quintaf/ulivi/prenotazione-concerto/prenota.php?idPosto="+idPosto, true);
                xhttp.open("POST", "prenota.php?idPosto="+idPosto, true);
                xhttp.send();
            }

            function btnIndietro()
            {
                window.history.back();
            }
        </script>
    </body>
</html>