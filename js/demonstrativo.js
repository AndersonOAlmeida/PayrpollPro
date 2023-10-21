function calcularFerias() {
    const nome = document.getElementById("nome").value;
    const inicio = new Date(document.getElementById("inicio").value);
    const fim = new Date(document.getElementById("fim").value);

    const diffTime = Math.abs(fim - inicio);
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));

    const resultado = `
        <h2>Demonstrativo de Férias</h2>
        <p>Nome: ${nome}</p>
        <p>Data de Início: ${inicio.toLocaleDateString()}</p>
        <p>Data de Término: ${fim.toLocaleDateString()}</p>
        <p>Duração das Férias: ${diffDays} dias</p>
    `;

    document.getElementById("resultado").innerHTML = resultado;
}