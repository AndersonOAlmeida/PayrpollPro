-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23/11/2023 às 02:10
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `payrollpro`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `ponto`
--

CREATE TABLE `ponto` (
  `id` int(11) NOT NULL,
  `data_entrada` date NOT NULL,
  `entrada` time DEFAULT NULL,
  `saida_intervalo` time DEFAULT NULL,
  `retorno_intervalo` time DEFAULT NULL,
  `saida` time DEFAULT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `ponto`
--

INSERT INTO `ponto` (`id`, `data_entrada`, `entrada`, `saida_intervalo`, `retorno_intervalo`, `saida`, `usuario_id`) VALUES
(15, '2023-11-22', '21:55:30', '21:55:34', '21:55:36', '21:55:40', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tabela_ferias`
--

CREATE TABLE `tabela_ferias` (
  `idFerias` int(11) NOT NULL,
  `idFunc` int(11) NOT NULL,
  `vencimento` date NOT NULL,
  `saida` date NOT NULL,
  `retorno` date NOT NULL,
  `salario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tabela_funcionarios`
--

CREATE TABLE `tabela_funcionarios` (
  `idFunc` int(11) NOT NULL,
  `nomefunc` varchar(50) NOT NULL,
  `enderecofunc` varchar(50) NOT NULL,
  `telefonefunc` varchar(20) NOT NULL,
  `emailfunc` varchar(30) NOT NULL,
  `cargofunc` varchar(20) NOT NULL,
  `salario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(220) NOT NULL,
  `email` varchar(220) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`) VALUES
(1, 'Anderson', 'anderson@gmail.com'),
(2, 'Luan', 'luan@gmail.com');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `ponto`
--
ALTER TABLE `ponto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `tabela_ferias`
--
ALTER TABLE `tabela_ferias`
  ADD PRIMARY KEY (`idFerias`),
  ADD KEY `fk_ferias` (`idFunc`);

--
-- Índices de tabela `tabela_funcionarios`
--
ALTER TABLE `tabela_funcionarios`
  ADD PRIMARY KEY (`idFunc`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `ponto`
--
ALTER TABLE `ponto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `tabela_ferias`
--
ALTER TABLE `tabela_ferias`
  MODIFY `idFerias` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tabela_funcionarios`
--
ALTER TABLE `tabela_funcionarios`
  MODIFY `idFunc` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tabela_ferias`
--
ALTER TABLE `tabela_ferias`
  ADD CONSTRAINT `fk_ferias` FOREIGN KEY (`idFunc`) REFERENCES `tabela_funcionarios` (`idFunc`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
