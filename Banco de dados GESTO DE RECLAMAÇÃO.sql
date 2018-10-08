-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 08-Out-2018 às 22:28
-- Versão do servidor: 10.2.16-MariaDB
-- PHP Version: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u297045192_root`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `mural`
--

CREATE TABLE `mural` (
  `id` int(11) NOT NULL,
  `titulo` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `data` date NOT NULL,
  `modificado` int(11) NOT NULL,
  `usuarios` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `mural`
--

INSERT INTO `mural` (`id`, `titulo`, `descricao`, `data`, `modificado`, `usuarios`) VALUES
(36, 'teste', 'Teste', '2018-09-14', 1, 1),
(37, 'teste ', 'Teste\nTeste1', '2018-09-14', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `reclamacoes`
--

CREATE TABLE `reclamacoes` (
  `id` int(11) NOT NULL,
  `titulo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `nivel` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `usuarios` int(11) NOT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `modificado` int(11) NOT NULL,
  `data` date NOT NULL,
  `dataAlterado` date NOT NULL,
  `usuarioInicial` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `reclamacoes`
--

INSERT INTO `reclamacoes` (`id`, `titulo`, `descricao`, `nivel`, `usuarios`, `status`, `modificado`, `data`, `dataAlterado`, `usuarioInicial`) VALUES
(26, 'Teste não urgente ', 'Teste não urgente 1/2', 'Não Urgente', 1, 'Finalizado', 1, '2018-09-19', '2018-09-19', 2),
(27, 'Teste pouco urgente', 'Teste pouco urgente\nTe', 'Pouco Urgente', 2, 'Em Aberto', 1, '2018-09-19', '2018-09-19', 2),
(28, 'Teste', 'Testess', 'Não Urgente', 2, 'Finalizado', 1, '2018-09-18', '2018-09-19', 2),
(30, '1', '1', 'Não Urgente', 2, 'Em Aberto', 1, '2018-09-19', '2018-09-19', 1),
(31, 'teste para mozao, urgente', 'Teste para mozao, urgente ', 'Urgente', 1, 'Em Aberto', 0, '2018-09-22', '2018-09-22', 1),
(32, 'bbababssb', 'ahhaalnsbana', 'Não Urgente', 1, 'Em Aberto', 0, '2018-09-24', '2018-09-24', 1),
(33, 'xablau entrou na minha casa', 'Xablau era feio que dói ', 'Pouco Urgente', 1, 'Finalizado', 1, '2018-09-26', '2018-09-26', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `senha` varchar(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `dataMod` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `nome`, `senha`, `tipo`, `dataMod`) VALUES
(1, '1', 'rafael', '1', 1, '2018-09-21'),
(2, '2', 'teste', '2', 2, '2018-09-21'),
(3, '3', 'Teste Síndico', '3', 1, '2018-09-24'),
(4, 'l', 'luís augusto', '1', 1, '2018-09-24'),
(7, 'rcs', 'rafael', '262', 2, '2018-09-21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mural`
--
ALTER TABLE `mural`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuarios` (`usuarios`);

--
-- Indexes for table `reclamacoes`
--
ALTER TABLE `reclamacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuarios` (`usuarios`),
  ADD KEY `usuarioInicial` (`usuarioInicial`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mural`
--
ALTER TABLE `mural`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `reclamacoes`
--
ALTER TABLE `reclamacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `mural`
--
ALTER TABLE `mural`
  ADD CONSTRAINT `id_mural_usuarios_fk` FOREIGN KEY (`usuarios`) REFERENCES `usuarios` (`id`);

--
-- Limitadores para a tabela `reclamacoes`
--
ALTER TABLE `reclamacoes`
  ADD CONSTRAINT `id_reclamacao_usuariosInicial_fk` FOREIGN KEY (`usuarioInicial`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `id_reclamacao_usuarios_fk` FOREIGN KEY (`usuarios`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
