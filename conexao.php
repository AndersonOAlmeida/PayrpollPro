<?php
    //inicio da conexao com banco de dados utilizando PDO
    $host = "localhost";
    $user = "root";
    $pass = "";
    $dbname = "payrollpro";
    $port = 3306;

    try {
        //conexao com a porta
        //$conn = new PDO("mysql:host=$host; port=$port;dbname=" . $dbname, $user, $pass);

        //Conexao sem a porta
        $conn = new PDO("mysql:host=$host;dbname=" . $dbname, $user, $pass);
        // echo "conexão com o banco de dados realizado com sucesso.";
    } catch (PDOExceprion $err) {
        echo "Erro: Conexão com o banco de dados não realizado com sucesso. Erro gerado" . $err->gtMessage();
    }
    //Fim da conexão com o banco de dados utilizando PDO
?>