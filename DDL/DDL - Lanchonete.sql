-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22/10/2026 às 15:24
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
-- Banco de dados: `lanchonete`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria`
--

CREATE TABLE `categoria` (
  `Id_Categoria` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Descricao` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categoria`
--

INSERT INTO `categoria` (`Id_Categoria`, `Nome`, `Descricao`) VALUES
(1, 'Lanches', 'Hambúrgueres e sanduíches'),
(2, 'Bebidas', 'Refrigerantes e sucos'),
(3, 'Porções', 'Porções e acompanhamentos'),
(4, 'Sobremesas', 'Doces e sobremesas');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `Id_Cliente` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `CPF` varchar(14) NOT NULL,
  `Telefone` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Endereco` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`Id_Cliente`, `Nome`, `CPF`, `Telefone`, `Email`, `Endereco`) VALUES
(1, 'Maria Silva', '12345678901', '11995636521', 'maria@email.com', 'Rua das Flores, 123'),
(2, 'João Santos', '23456789012', '11987654321', 'joao@email.com', 'Rua Central, 45'),
(3, 'Ana Oliveira', '34567890123', '11976543210', 'ana@email.com', 'Avenida Brasil, 200');

-- --------------------------------------------------------

--
-- Estrutura para tabela `faturamento`
--

CREATE TABLE `faturamento` (
  `Id_Faturamento` int(11) NOT NULL,
  `Periodo` varchar(30) NOT NULL,
  `Gasto` decimal(10,2) NOT NULL DEFAULT 0.00,
  `Despesa_Total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `Receita_Total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `Data_Faturamento` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `faturamento`
--

INSERT INTO `faturamento` (`Id_Faturamento`, `Periodo`, `Gasto`, `Despesa_Total`, `Receita_Total`, `Data_Faturamento`) VALUES
(1, '2026-10-22', 150.00, 80.00, 81.80, '2026-10-22 23:00:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `Id_Funcionario` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `CPF` varchar(14) NOT NULL,
  `Telefone` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `funcionario`
--

INSERT INTO `funcionario` (`Id_Funcionario`, `Nome`, `CPF`, `Telefone`, `Email`) VALUES
(1, 'Carlos Souza', '45678901234', '11981234567', 'carlos@email.com'),
(2, 'Fernanda Lima', '56789012345', '11982345678', 'fernanda@email.com');

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_faturamento`
--

CREATE TABLE `item_faturamento` (
  `Id_Faturamento` int(11) NOT NULL,
  `Id_Venda` int(11) NOT NULL,
  `Preco_Unitario` decimal(10,2) NOT NULL,
  `Quantidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `item_faturamento`
--

INSERT INTO `item_faturamento` (`Id_Faturamento`, `Id_Venda`, `Preco_Unitario`, `Quantidade`) VALUES
(1, 1, 18.90, 2),
(1, 2, 22.90, 1),
(1, 3, 10.00, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_pedido`
--

CREATE TABLE `item_pedido` (
  `Id_Pedido` int(11) NOT NULL,
  `Id_Venda` int(11) NOT NULL,
  `Quantidade` int(11) NOT NULL,
  `Preco_Unitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `item_pedido`
--

INSERT INTO `item_pedido` (`Id_Pedido`, `Id_Venda`, `Quantidade`, `Preco_Unitario`) VALUES
(1, 1, 2, 18.90),
(2, 2, 1, 22.90),
(3, 3, 2, 10.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_produto`
--

CREATE TABLE `item_produto` (
  `Id_Pedido` int(11) NOT NULL,
  `Id_Produto` int(11) NOT NULL,
  `Quantidade` int(11) NOT NULL,
  `Preco_Unitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `item_produto`
--

INSERT INTO `item_produto` (`Id_Pedido`, `Id_Produto`, `Quantidade`, `Preco_Unitario`) VALUES
(1, 1, 1, 18.90),
(1, 4, 1, 6.00),
(2, 2, 1, 22.90),
(3, 3, 2, 10.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE `pedido` (
  `Id_Pedido` int(11) NOT NULL,
  `Id_Cliente` int(11) NOT NULL,
  `Id_Funcionario` int(11) NOT NULL,
  `Data` datetime NOT NULL DEFAULT current_timestamp(),
  `Forma_Pagamento` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedido`
--

INSERT INTO `pedido` (`Id_Pedido`, `Id_Cliente`, `Id_Funcionario`, `Data`, `Forma_Pagamento`) VALUES
(1, 1, 1, '2026-10-22 10:30:00', 'Pix'),
(2, 2, 2, '2026-10-22 11:15:00', 'Dinheiro'),
(3, 3, 1, '2026-10-22 12:00:00', 'Cartão');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `Id_Produto` int(11) NOT NULL,
  `Id_Categoria` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Descricao` varchar(150) DEFAULT NULL,
  `Preco` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`Id_Produto`, `Id_Categoria`, `Nome`, `Descricao`, `Preco`) VALUES
(1, 1, 'X-Burguer', 'Hambúrguer com queijo', 18.90),
(2, 1, 'X-Salada', 'Hambúrguer com queijo, alface e tomate', 22.90),
(3, 1, 'Misto Quente', 'Pão, presunto e queijo', 10.00),
(4, 2, 'Coca-Cola Lata', 'Refrigerante lata 350 ml', 6.00),
(5, 2, 'Suco de Laranja', 'Suco de laranja 300 ml', 8.00),
(6, 3, 'Batata Frita', 'Porção de batata frita', 15.00),
(7, 4, 'Brigadeiro', 'Brigadeiro tradicional', 4.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `venda`
--

CREATE TABLE `venda` (
  `Id_Venda` int(11) NOT NULL,
  `Id_Pedido` int(11) NOT NULL,
  `Data_Venda` datetime NOT NULL DEFAULT current_timestamp(),
  `Descricao` varchar(200) DEFAULT NULL,
  `Forma_Pagamento` varchar(30) DEFAULT NULL,
  `Data_Geracao` datetime DEFAULT NULL,
  `Status_Venda` varchar(30) NOT NULL DEFAULT 'Concluida',
  `Observacao` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `venda`
--

INSERT INTO `venda` (`Id_Venda`, `Id_Pedido`, `Data_Venda`, `Descricao`, `Forma_Pagamento`, `Data_Geracao`, `Status_Venda`, `Observacao`) VALUES
(1, 1, '2026-10-22 10:30:00', 'Venda do pedido 1', 'Pix', '2026-10-22 10:30:00', 'Concluida', 'Pagamento confirmado'),
(2, 2, '2026-10-22 11:15:00', 'Venda do pedido 2', 'Dinheiro', '2026-10-22 11:15:00', 'Concluida', 'Pagamento confirmado'),
(3, 3, '2026-10-22 12:00:00', 'Venda do pedido 3', 'Cartão', '2026-10-22 12:00:00', 'Concluida', 'Pagamento confirmado');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`Id_Categoria`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Id_Cliente`);

--
-- Índices de tabela `faturamento`
--
ALTER TABLE `faturamento`
  ADD PRIMARY KEY (`Id_Faturamento`);

--
-- Índices de tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`Id_Funcionario`);

--
-- Índices de tabela `item_faturamento`
--
ALTER TABLE `item_faturamento`
  ADD PRIMARY KEY (`Id_Faturamento`,`Id_Venda`),
  ADD KEY `fk_itemfaturamento_venda` (`Id_Venda`);

--
-- Índices de tabela `item_pedido`
--
ALTER TABLE `item_pedido`
  ADD PRIMARY KEY (`Id_Pedido`,`Id_Venda`),
  ADD KEY `fk_itempedido_venda` (`Id_Venda`);

--
-- Índices de tabela `item_produto`
--
ALTER TABLE `item_produto`
  ADD PRIMARY KEY (`Id_Pedido`,`Id_Produto`),
  ADD KEY `fk_itemproduto_produto` (`Id_Produto`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`Id_Pedido`),
  ADD KEY `fk_pedido_cliente` (`Id_Cliente`),
  ADD KEY `fk_pedido_funcionario` (`Id_Funcionario`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`Id_Produto`),
  ADD KEY `fk_produto_categoria` (`Id_Categoria`);

--
-- Índices de tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`Id_Venda`),
  ADD KEY `fk_venda_pedido` (`Id_Pedido`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `Id_Categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `Id_Cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `faturamento`
--
ALTER TABLE `faturamento`
  MODIFY `Id_Faturamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `Id_Funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `Id_Pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `Id_Produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `Id_Venda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `item_faturamento`
--
ALTER TABLE `item_faturamento`
  ADD CONSTRAINT `fk_itemfaturamento_faturamento` FOREIGN KEY (`Id_Faturamento`) REFERENCES `faturamento` (`Id_Faturamento`),
  ADD CONSTRAINT `fk_itemfaturamento_venda` FOREIGN KEY (`Id_Venda`) REFERENCES `venda` (`Id_Venda`);

--
-- Restrições para tabelas `item_pedido`
--
ALTER TABLE `item_pedido`
  ADD CONSTRAINT `fk_itempedido_pedido` FOREIGN KEY (`Id_Pedido`) REFERENCES `pedido` (`Id_Pedido`),
  ADD CONSTRAINT `fk_itempedido_venda` FOREIGN KEY (`Id_Venda`) REFERENCES `venda` (`Id_Venda`);

--
-- Restrições para tabelas `item_produto`
--
ALTER TABLE `item_produto`
  ADD CONSTRAINT `fk_itemproduto_pedido` FOREIGN KEY (`Id_Pedido`) REFERENCES `pedido` (`Id_Pedido`),
  ADD CONSTRAINT `fk_itemproduto_produto` FOREIGN KEY (`Id_Produto`) REFERENCES `produto` (`Id_Produto`);

--
-- Restrições para tabelas `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`Id_Cliente`) REFERENCES `cliente` (`Id_Cliente`),
  ADD CONSTRAINT `fk_pedido_funcionario` FOREIGN KEY (`Id_Funcionario`) REFERENCES `funcionario` (`Id_Funcionario`);

--
-- Restrições para tabelas `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `fk_produto_categoria` FOREIGN KEY (`Id_Categoria`) REFERENCES `categoria` (`Id_Categoria`);

--
-- Restrições para tabelas `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `fk_venda_pedido` FOREIGN KEY (`Id_Pedido`) REFERENCES `pedido` (`Id_Pedido`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
