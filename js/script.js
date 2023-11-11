// Simulando uma lista de registros de ponto
let registrosPonto = [];
  
function baterPonto() {
  const agora = new Date();
  const horaAtual = agora.getHours();
  const minutoAtual = agora.getMinutes();

  const registro = {
    hora: horaAtual,
    minuto: minutoAtual,
    data: agora.toLocaleDateString(),
  };

  registrosPonto.push(registro);

  exibirRegistrosPonto();
}

function exibirRegistrosPonto() {
  const outputDiv = document.getElementById("output");
  outputDiv.innerHTML = "<h3>Registros de Ponto:</h3>";

  registrosPonto.forEach(registro => {
    const horaFormatada = formatoHora(registro.hora, registro.minuto);
    const linha = `${registro.data} - ${horaFormatada}<br>`;
    outputDiv.innerHTML += linha;
  });
}

function formatoHora(hora, minuto) {
  return `${hora.toString().padStart(2, '0')}:${minuto.toString().padStart(2, '0')}`;
}