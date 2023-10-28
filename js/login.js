document.getElementById("loginForm").addEventListener("submit", function(event) {
    event.preventDefault();
    const CPF = document.getElementById("CPF").value;
    const password = document.getElementById("password").value;

    if (CPF === "000.000.000-00" && password === "admin") {
        // Redirecionar para a tela do menu inicial
        window.location.href = "regponto.html";
    } else {
        alert("Credenciais inválidas. Tente novamente.");
    }
});