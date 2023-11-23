        //var apHorario = document.getElementById("horario");

        function atualizarHorario(){
          var data = new Date().toLocateString("pt-br", {
              timeZone: "America/Sao_Paulo"
          });
          //var formatarData = data.replace(",", " - ");
          //apHorario.innerHTML = formatarData;
          document.getElementById("horario").innerHTML = data.replace(",", " - ");
      }

      setInterval(atualizarHorario, 1000);