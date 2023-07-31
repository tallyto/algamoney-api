-- Desabilitar verificação de chaves estrangeiras
SET CONSTRAINTS ALL DEFERRED;

-- Limpar dados das tabelas
DELETE
FROM lancamento;
DELETE
FROM pessoa;
DELETE
FROM categoria;

-- Habilitar verificação de chaves estrangeiras
SET CONSTRAINTS ALL IMMEDIATE;

-- Reiniciar sequências das tabelas
ALTER
SEQUENCE categoria_codigo_seq RESTART WITH 1;
ALTER
SEQUENCE pessoa_codigo_seq RESTART WITH 1;
ALTER
SEQUENCE lancamento_codigo_seq RESTART WITH 1;

-- Inserir registros nas tabelas

-- Categoria
INSERT INTO categoria (nome)
VALUES ('Eletrônicos');
INSERT INTO categoria (nome)
VALUES ('Moda');
INSERT INTO categoria (nome)
VALUES ('Decoração');
INSERT INTO categoria (nome)
VALUES ('Esportes');
INSERT INTO categoria (nome)
VALUES ('Beleza');
INSERT INTO categoria (nome)
VALUES ('Alimentos');
INSERT INTO categoria (nome)
VALUES ('Livros');
INSERT INTO categoria (nome)
VALUES ('Viagens');

-- Script 1
INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep, cidade, estado)
VALUES ('João', TRUE, 'Rua A', '123', 'Apto 1', 'Centro', '12345-678', 'São Paulo', 'SP');

-- Script 2
INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep, cidade, estado)
VALUES ('Maria', TRUE, 'Rua B', '456', NULL, 'Vila Nova', '98765-432', 'Rio de Janeiro', 'RJ');

-- Script 3
INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep, cidade, estado)
VALUES ('Pedro', FALSE, 'Rua C', '789', 'Casa 2', 'Jardim', '54321-876', 'Belo Horizonte', 'MG');

-- Script 4
INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep, cidade, estado)
VALUES ('Ana', TRUE, 'Rua D', '321', NULL, 'Liberdade', '67890-123', 'Curitiba', 'PR');

-- Script 5
INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep, cidade, estado)
VALUES ('Carlos', FALSE, 'Rua E', '654', 'Sala 3', 'Industrial', '21098-765', 'Porto Alegre', 'RS');

-- Script 6
INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep, cidade, estado)
VALUES ('Julia', TRUE, 'Rua F', '987', NULL, 'Centro', '13579-246', 'Salvador', 'BA');

-- Script 7
INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep, cidade, estado)
VALUES ('Lucas', TRUE, 'Rua G', '753', 'Apto 5', 'Vila Nova', '97531-864', 'Recife', 'PE');

-- Script 8
INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep, cidade, estado)
VALUES ('Mariana', FALSE, 'Rua H', '159', 'Casa 10', 'Liberdade', '26479-358', 'Fortaleza', 'CE');

-- Script 9
INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep, cidade, estado)
VALUES ('Rafael', TRUE, 'Rua I', '246', NULL, 'Industrial', '78945-123', 'Brasília', 'DF');

-- Script 10
INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep, cidade, estado)
VALUES ('Sophia', TRUE, 'Rua J', '987', 'Apto 20', 'Centro', '65432-987', 'Manaus', 'AM');

-- Registro 11
INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep, cidade, estado)
VALUES ('Fernanda', TRUE, 'Rua K', '789', NULL, 'Vila Nova', '45678-123', 'Porto Velho', 'RO');

-- Registro 12
INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep, cidade, estado)
VALUES ('Gabriel', FALSE, 'Rua L', '321', 'Casa 5', 'Centro', '98765-432', 'Florianópolis', 'SC');

-- Registro 13
INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep, cidade, estado)
VALUES ('Isabela', TRUE, 'Rua M', '654', NULL, 'Liberdade', '54321-876', 'Goiânia', 'GO');

-- Registro 14
INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep, cidade, estado)
VALUES ('Leonardo', TRUE, 'Rua N', '987', 'Apto 10', 'Jardim', '21098-765', 'São Luís', 'MA');

-- Registro 15
INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep, cidade, estado)
VALUES ('Luiza', FALSE, 'Rua O', '159', 'Sala 2', 'Industrial', '67890-123', 'Belém', 'PA');

-- Registro 16
INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep, cidade, estado)
VALUES ('Matheus', TRUE, 'Rua P', '753', NULL, 'Vila Nova', '54321-987', 'Natal', 'RN');

-- Registro 17
INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep, cidade, estado)
VALUES ('Beatriz', TRUE, 'Rua Q', '987', 'Apto 15', 'Centro', '98765-432', 'Aracaju', 'SE');

-- Registro 18
INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep, cidade, estado)
VALUES ('Arthur', FALSE, 'Rua R', '321', 'Casa 7', 'Liberdade', '23456-789', 'Cuiabá', 'MT');

-- Registro 19
INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep, cidade, estado)
VALUES ('Lara', TRUE, 'Rua S', '654', NULL, 'Jardim', '67890-543', 'João Pessoa', 'PB');

-- Registro 20
INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep, cidade, estado)
VALUES ('Enzo', TRUE, 'Rua T', '987', 'Apto 8', 'Centro', '54321-987', 'Teresina', 'PI');

-- Registro 21
INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep, cidade, estado)
VALUES ('Sophie', FALSE, 'Rua U', '159', 'Casa 3', 'Vila Nova', '87654-321', 'Boa Vista', 'RR');

-- Registro 22
INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep, cidade, estado)
VALUES ('Davi', TRUE, 'Rua V', '753', NULL, 'Industrial', '76543-210', 'Palmas', 'TO');

-- Registro 23
INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep, cidade, estado)
VALUES ('Valentina', TRUE, 'Rua W', '987', 'Apto 12', 'Liberdade', '98765-321', 'Rio Branco', 'AC');

-- Registro 24
INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep, cidade, estado)
VALUES ('Benjamin', FALSE, 'Rua X', '321', 'Casa 9', 'Centro', '12345-987', 'Macapá', 'AP');

-- Registro 25
INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep, cidade, estado)
VALUES ('Alice', TRUE, 'Rua Y', '654', NULL, 'Vila Nova', '54321-678', 'Campo Grande', 'MS');

-- Registro 26
INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep, cidade, estado)
VALUES ('Bernardo', TRUE, 'Rua Z', '987', 'Apto 7', 'Industrial', '87654-321', 'Porto Alegre', 'RS');

-- Registro 27
INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep, cidade, estado)
VALUES ('Laura', FALSE, 'Rua 1', '159', 'Casa 4', 'Liberdade', '54321-765', 'Salvador', 'BA');

-- Registro 28
INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep, cidade, estado)
VALUES ('Davi Lucas', TRUE, 'Rua 2', '753', NULL, 'Jardim', '98765-210', 'Recife', 'PE');

-- Registro 29
INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep, cidade, estado)
VALUES ('Helena', TRUE, 'Rua 3', '987', 'Apto 9', 'Centro', '76543-987', 'Fortaleza', 'CE');

-- Registro 30
INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep, cidade, estado)
VALUES ('Pedro Henrique', FALSE, 'Rua 4', '321', 'Casa 8', 'Vila Nova', '67890-543', 'Brasília', 'DF');

-- Lancamentos
INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Pagamento de aluguel', '2023-07-13', NULL, 1000.00, NULL, 'DESPESA', 1, 1);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Salário mensal', '2023-07-15', '2023-07-15', 2500.00, 'Recebido', 'RECEITA', 2, 2);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Compra de material de escritório', '2023-07-10', '2023-07-10', 150.50, 'Reembolso pendente', 'DESPESA', 1, 3);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Reembolso de despesas de viagem', '2023-07-20', NULL, 300.00, NULL, 'RECEITA', 2, 3);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Pagamento de empréstimo', '2023-02-18', NULL, 500.00, NULL, 'DESPESA', 3, 4);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Reembolso de despesas de viagem', '2023-02-22', NULL, 200.00, NULL, 'RECEITA', 7, 5);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Pagamento de conta de luz', '2023-02-14', '2023-02-14', 120.00, NULL, 'DESPESA', 6, 1);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Venda de livro usado', '2023-02-16', '2023-02-16', 50.00, NULL, 'RECEITA', 7, 2);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Pagamento de empréstimo', '2023-02-19', NULL, 800.00, 'Parcela 2', 'DESPESA', 3, 4);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Compra de roupas', '2023-02-17', '2023-02-17', 300.00, NULL, 'DESPESA', 2, 2);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Pagamento de mensalidade de academia', '2023-07-20', '2023-07-20', 80.00, NULL, 'DESPESA', 4, 3);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Venda de eletrônicos usados', '2023-07-18', NULL, 500.00, 'Itens vendidos no Mercado Livre', 'RECEITA', 1, 1);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Pagamento de impostos', '2023-07-23', NULL, 400.00, 'Impostos municipais', 'DESPESA', 3, 5);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Recebimento de aluguel', '2023-07-24', '2023-07-24', 800.00, NULL, 'RECEITA', 1, 4);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Compra de decoração para casa', '2023-07-15', '2023-07-15', 150.00, 'Itens comprados em uma loja de decoração',
        'DESPESA', 3, 3);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Pagamento de mensalidade de TV a cabo', '2023-07-21', '2023-07-21', 90.00, NULL, 'DESPESA', 7, 2);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Recebimento de reembolso médico', '2023-07-25', NULL, 200.00, 'Reembolso de consulta médica', 'RECEITA', 5, 3);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Compra de alimentos', '2023-07-14', '2023-07-14', 80.00, NULL, 'DESPESA', 6, 1);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Pagamento de mensalidade de academia', '2023-07-19', '2023-07-19', 100.00, NULL, 'DESPESA', 4, 4);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Venda de produtos de beleza', '2023-07-22', NULL, 120.00, 'Produtos vendidos através de um canal online',
        'RECEITA', 5, 5);
INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Pagamento de aluguel', '2023-07-13', NULL, 1000.00, NULL, 'DESPESA', 1, 1);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Salário mensal', '2023-07-15', '2023-07-15', 2500.00, 'Recebido', 'RECEITA', 2, 2);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Compra de material de escritório', '2023-07-10', '2023-07-10', 150.50, 'Reembolso pendente', 'DESPESA', 1, 3);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Reembolso de despesas de viagem', '2023-07-20', NULL, 300.00, NULL, 'RECEITA', 2, 3);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Pagamento de empréstimo', '2023-07-18', NULL, 500.00, NULL, 'DESPESA', 3, 4);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Reembolso de despesas de viagem', '2023-07-22', NULL, 200.00, NULL, 'RECEITA', 7, 5);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Pagamento de conta de luz', '2023-07-14', '2023-07-14', 120.00, NULL, 'DESPESA', 6, 1);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Venda de livro usado', '2023-07-16', '2023-07-16', 50.00, NULL, 'RECEITA', 7, 2);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Pagamento de empréstimo', '2023-07-19', NULL, 800.00, 'Parcela 2', 'DESPESA', 3, 4);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Compra de roupas', '2023-07-17', '2023-07-17', 300.00, NULL, 'DESPESA', 2, 2);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Pagamento de mensalidade de academia', '2023-07-20', '2023-07-20', 80.00, NULL, 'DESPESA', 4, 3);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Venda de eletrônicos usados', '2023-07-18', NULL, 500.00, 'Itens vendidos no Mercado Livre', 'RECEITA', 1, 1);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Pagamento de impostos', '2023-07-23', NULL, 400.00, 'Impostos municipais', 'DESPESA', 3, 5);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Recebimento de aluguel', '2023-07-24', '2023-07-24', 800.00, NULL, 'RECEITA', 1, 4);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Compra de decoração para casa', '2023-07-15', '2023-07-15', 150.00, 'Itens comprados em uma loja de decoração',
        'DESPESA', 3, 3);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Pagamento de mensalidade de TV a cabo', '2023-07-21', '2023-07-21', 90.00, NULL, 'DESPESA', 7, 2);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Recebimento de reembolso médico', '2023-07-25', NULL, 200.00, 'Reembolso de consulta médica', 'RECEITA', 5, 3);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Compra de alimentos', '2023-07-14', '2023-07-14', 80.00, NULL, 'DESPESA', 6, 1);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Pagamento de mensalidade de academia', '2023-07-19', '2023-07-19', 100.00, NULL, 'DESPESA', 4, 4);

INSERT INTO lancamento (descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria,
                        codigo_pessoa)
VALUES ('Venda de produtos de beleza', '2023-07-22', NULL, 120.00, 'Produtos vendidos através de um canal online',
        'RECEITA', 5, 5);
