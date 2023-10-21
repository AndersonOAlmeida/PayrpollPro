function calcularHoras() {
    const entrada = document.getElementById('entrada').value;
    const saida = document.getElementById('saida').value;

    const entradaHora = new Date(`2000-01-01T${entrada}`);
    const saidaHora = new Date(`2000-01-01T${saida}`);

    const diffMillis = saidaHora - entradaHora;
    const diffHours = diffMillis / 1000 / 60 / 60;

    document.getElementById('totalHoras').textContent = diffHours.toFixed(2);
}