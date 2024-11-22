-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18/11/2024 às 14:28
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sistema_atendimento`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `historico_atendimentos`
--

CREATE TABLE `historico_atendimentos` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `data_registro` date NOT NULL,
  `data_retorno` date DEFAULT NULL,
  `descricao` text NOT NULL,
  `comentarios` text DEFAULT NULL,
  `pagamento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `historico_atendimentos`
--

INSERT INTO `historico_atendimentos` (`id`, `usuario_id`, `data_registro`, `data_retorno`, `descricao`, `comentarios`, `pagamento`) VALUES
(1, 6, '2024-11-18', '2077-05-01', 'insano', 'muito bom profissional slk', 'Boleto Bancário'),
(2, 6, '2024-11-18', '2077-05-01', 'insano', 'muito bom profissional slk', 'Boleto Bancário');

-- --------------------------------------------------------

--
-- Estrutura para tabela `informacoes`
--

CREATE TABLE `informacoes` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nome_usuario` varchar(50) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `cpf_cnpj` varchar(20) DEFAULT NULL,
  `whatsapp` varchar(15) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `nome_usuario`, `senha`, `cpf_cnpj`, `whatsapp`, `telefone`, `endereco`, `data_nascimento`) VALUES
(1, 'Carlos Eduardo', 'nicolast@engeseg.com.br', '', '$2y$10$tWPQH2PFvk3T7I93XyWGOe8Sq6mEUzLrVYmWiP9tPFzseekLujbr6', NULL, NULL, NULL, NULL, NULL),
(6, 'carlito', 'carlin@gmail.com', '', '$2y$10$gI98p2hge2jbjkI5UA9Sz.65..rSx4P1kIr26YmK5VWh2CFTmcGdm', '96217013339', '(61) 98262-1867', '(61) 2819-3800', 'Rua 19, Nº374, Parque Alvorada III', '1996-07-10'),
(8, 'Francisco Henrique', 'chicomoedas@gmail.com', '', '$2y$10$2h/hOnOL.SMJPtFL9Y436.yP7.nh.EukqtMaDabsk4FOLBVoM.yia', NULL, NULL, NULL, NULL, NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `historico_atendimentos`
--
ALTER TABLE `historico_atendimentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `informacoes`
--
ALTER TABLE `informacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `historico_atendimentos`
--
ALTER TABLE `historico_atendimentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `informacoes`
--
ALTER TABLE `informacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `historico_atendimentos`
--
ALTER TABLE `historico_atendimentos`
  ADD CONSTRAINT `historico_atendimentos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `informacoes`
--
ALTER TABLE `informacoes`
  ADD CONSTRAINT `informacoes_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
