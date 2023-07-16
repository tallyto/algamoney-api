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

-- Pessoa
INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep)
VALUES ('João', TRUE, 'Rua A', '123', 'Apto 1', 'Centro', '12345-678');

INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep)
VALUES ('Maria', TRUE, 'Rua B', '456', NULL, 'Vila Nova', '98765-432');

INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep)
VALUES ('Pedro', FALSE, 'Rua C', '789', 'Casa 2', 'Jardim', '54321-876');

INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep)
VALUES ('Ana', TRUE, 'Rua D', '321', NULL, 'Liberdade', '67890-123');

INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep)
VALUES ('Carlos', FALSE, 'Rua E', '654', 'Sala 3', 'Industrial', '21098-765');

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
