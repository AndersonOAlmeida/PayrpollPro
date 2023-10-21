function calcularDataFerias() {
    const tempoRegistro = parseInt(document.getElementById("tempoRegistro").value);
    const dataAtual = new Date();
    
    // Lógica fictícia para cálculo da data de início das férias (exemplo simples)
    const dataInicioFerias = new Date();
    dataInicioFerias.setFullYear(dataAtual.getFullYear() + 1); // Próximo ano
    dataInicioFerias.setMonth(0); // Janeiro (0-indexed)
    dataInicioFerias.setDate(1); // Primeiro dia do mês

    // Adiciona o tempo de registro à data de início das férias
    dataInicioFerias.setFullYear(dataInicioFerias.getFullYear() + tempoRegistro);

    const resultado = `
        <h2>Data de Início das Férias</h2>
        <p>Tempo de Registro na Empresa: ${tempoRegistro} anos</p>
        <p>Data de Início das Férias: ${dataInicioFerias.toLocaleDateString()}</p>
    `;

    document.getElementById("resultado").innerHTML = resultado;
}