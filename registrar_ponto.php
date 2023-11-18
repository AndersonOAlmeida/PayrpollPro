<?php

    session_start(); // iniciar a sessao

    ob_start(); // limpar o buffer

    //definir um fuso padrao
    date_default_timezone_set('America/Sao_Paulo');

    //gerar com php o horario atual
    $horario_atual = date("H:i:s");
    //var_dump($horario_atual);

    //gerar data com php no formato que deve ser salvo no bd
    $data_entrada = date('Y/m/d');

    //incluir a conexao com o banco de dados
    include_once "conexao.php";

    // ID do usuario fixo para poder testar
    $id_usuario = 1;
    
    //Recuperar o ultimo ponto do usuario
    $query_ponto = "SELECT id AS id_ponto, saida_intervalo, retorno_intervalo, saida FROM ponto WHERE usuario_id =:usuario_id ORDER BY id DESC LIMIT 1";

    //preparar a query
    $result_ponto = $conn->prepare($query_ponto);

    //substituir o link da query pelo valor
    $result_ponto->bindParam(':usuario_id', $id_usuario);

    //Executar a query
    $result_ponto->execute();

    // verificar se encontrou algumk registro no banco de dados
    if(($result_ponto) and ($result_ponto->rowCount() != 0)){
        $row_ponto = $result_ponto->fetch(PDO::FETCH_ASSOC);
        //var_dump($row_ponto);

        //extrair para imprimir atraves do nome da chave no array
        extract($row_ponto);

        //verificar se o usuario ja bateu o ponto de saida de intervalo
        if(($saida_intervalo == "") or ($saida_intervalo == null)){
            //coluna que deve receber o valor
            $col_tipo_registro = "saida_intervalo";

            //tipo de registro
            $tipo_registro = "editar";

            //texto parcial que vai ser apresentado
            $text_tipo_registro = "saida intervalo";
        }

        //verificar se o usuario ja bateu o ponto de retorno de intervalo
        elseif(($retorno_intervalo == "") or ($retorno_intervalo == null)){
            //coluna que deve receber o valor
            $col_tipo_registro = "retorno_intervalo";

            //tipo de registro
            $tipo_registro = "editar";

            //texto parcial que vai ser apresentado
            $text_tipo_registro = "retorno do intervalo";
        } elseif(($saida == "") or ($saida == null)){
            //coluna que deve receber o valor
            $col_tipo_registro = "saida";

            //tipo de registro
            $tipo_registro = "editar";

            //texto parcial que vai ser apresentado
            $text_tipo_registro = "saida";
        } else {
            $tipo_registro = "entrada";

            //texto parcial que vai ser apresentado
            $text_tipo_registro = "entrada";
        }
    } else {
        $tipo_registro = "entrada";

        //texto parcial que vai ser apresentado
        $text_tipo_registro = "entrada";
    }

    //verificar o tipo de registro, novo ponto ou editar
    switch($tipo_registro){

        //caso seja editar
        case "editar":

            //query para editar no banco de dados
            $query_horario = "UPDATE ponto SET $col_tipo_registro =:horario_atual WHERE id=:id LIMIT 1";

            //preparar a query
            $cad_horario = $conn->prepare($query_horario);

            //substituir o link da query pelo valor
            $cad_horario->bindParam(':horario_atual', $horario_atual);
            $cad_horario->bindParam(':id', $id_ponto);
        break; 
    default:
        $query_horario = "INSERT INTO ponto (data_entrada, entrada, usuario_id) VALUES (:data_entrada, :entrada, :usuario_id)";

        $cad_horario = $conn->prepare($query_horario);

        $cad_horario->bindParam(':data_entrada', $data_entrada);
        $cad_horario->bindParam(':entrada', $horario_atual);
        $cad_horario->bindParam(':usuario_id', $id_usuario);

    break;
    }

    // executar a query
    $cad_horario->execute();

    //acessa o if quando cadastrar com sucesso
    if($cad_horario->rowCount()) {
        $_SESSION['msg'] = "<p style='color:green;'>Horario de $text_tipo_registro cadastrado com sucesso!</p><br>";
        header("Location: regponto.php");
    } else {
        $_SESSION['msg'] = "<p style='color: red;'>Horario de $text_tipo_registro não cadastrado com sucesso!</p><br>";
        header("Location: regponto.php");
    }

