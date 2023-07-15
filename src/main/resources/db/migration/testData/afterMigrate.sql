set foreign_key_checks = 0;

delete from categoria;
delete from pessoa;
delete from lancamento;

set foreign_key_checks = 1;

alter table categoria auto_increment = 1;
alter table pessoa auto_increment = 1;
alter table lancamento auto_increment = 1;

INSERT INTO categoria (codigo, nome) VALUES (1,'Eletrônicos');
INSERT INTO categoria (codigo, nome) VALUES (2,'Moda');
INSERT INTO categoria (codigo, nome) VALUES (3,'Decoração');
INSERT INTO categoria (codigo, nome) VALUES (4,'Esportes');
INSERT INTO categoria (codigo, nome) VALUES (5,'Beleza');
INSERT INTO categoria (codigo, nome) VALUES (6,'Alimentos');
INSERT INTO categoria (codigo, nome) VALUES (7,'Livros');
INSERT INTO categoria (codigo, nome) VALUES (8,'Viagens');

INSERT INTO pessoa (codigo, nome, ativo, logradouro, numero, complemento, bairro, cep)
VALUES (1,'João', 1, 'Rua A', '123', 'Apto 1', 'Centro', '12345-678');

INSERT INTO pessoa (codigo, nome, ativo, logradouro, numero, complemento, bairro, cep)
VALUES (2,'Maria', 1, 'Rua B', '456', NULL, 'Vila Nova', '98765-432');

INSERT INTO pessoa (codigo, nome, ativo, logradouro, numero, complemento, bairro, cep)
VALUES (3,'Pedro', 0, 'Rua C', '789', 'Casa 2', 'Jardim', '54321-876');

INSERT INTO pessoa (codigo, nome, ativo, logradouro, numero, complemento, bairro, cep)
VALUES (4,'Ana', 1, 'Rua D', '321', NULL, 'Liberdade', '67890-123');

INSERT INTO pessoa (codigo, nome, ativo, logradouro, numero, complemento, bairro, cep)
VALUES (5,'Carlos', 0, 'Rua E', '654', 'Sala 3', 'Industrial', '21098-765');


# Lancamentos

INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa)
VALUES (1, 'Pagamento de aluguel', '2023-07-13', NULL, 1000.00, NULL, 'DESPESA', 1, 1);

INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa)
VALUES (2, 'Salário mensal', '2023-07-15', '2023-07-15', 2500.00, 'Recebido', 'RECEITA', 2, 2);

INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa)
VALUES (3, 'Compra de material de escritório', '2023-07-10', '2023-07-10', 150.50, 'Reembolso pendente', 'DESPESA', 1, 3);

INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa)
VALUES (4, 'Reembolso de despesas de viagem', '2023-07-20', NULL, 300.00, NULL, 'RECEITA', 2, 3);

INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa)
VALUES (5, 'Pagamento de empréstimo', '2023-07-18', NULL, 500.00, NULL, 'DESPESA', 3, 4);

INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa)
VALUES (6, 'Reembolso de despesas de viagem', '2023-07-22', NULL, 200.00, NULL, 'RECEITA', 7, 5);

INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa)
VALUES (7, 'Pagamento de conta de luz', '2023-07-14', '2023-07-14', 120.00, NULL, 'DESPESA', 6, 1);

INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa)
VALUES (8, 'Venda de livro usado', '2023-07-16', '2023-07-16', 50.00, NULL, 'RECEITA', 7, 2);

INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa)
VALUES (9, 'Pagamento de empréstimo', '2023-07-19', NULL, 800.00, 'Parcela 2', 'DESPESA', 3, 4);

INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa)
VALUES (10, 'Compra de roupas', '2023-07-17', '2023-07-17', 300.00, NULL, 'DESPESA', 2, 2);

INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa)
VALUES (11, 'Pagamento de mensalidade de academia', '2023-07-20', '2023-07-20', 80.00, NULL, 'DESPESA', 4, 3);

INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa)
VALUES (12, 'Venda de eletrônicos usados', '2023-07-18', NULL, 500.00, 'Itens vendidos no Mercado Livre', 'RECEITA', 1, 1);

INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa)
VALUES (13, 'Pagamento de impostos', '2023-07-23', NULL, 400.00, 'Impostos municipais', 'DESPESA', 3, 5);

INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa)
VALUES (14, 'Recebimento de aluguel', '2023-07-24', '2023-07-24', 800.00, NULL, 'RECEITA', 1, 4);

INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa)
VALUES (15, 'Compra de decoração para casa', '2023-07-15', '2023-07-15', 150.00, 'Itens comprados em uma loja de decoração', 'DESPESA', 3, 3);

INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa)
VALUES (16, 'Pagamento de mensalidade de TV a cabo', '2023-07-21', '2023-07-21', 90.00, NULL, 'DESPESA', 7, 2);

INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa)
VALUES (17, 'Recebimento de reembolso médico', '2023-07-25', NULL, 200.00, 'Reembolso de consulta médica', 'RECEITA', 5, 3);

INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa)
VALUES (18, 'Compra de alimentos', '2023-07-14', '2023-07-14', 80.00, NULL, 'DESPESA', 6, 1);

INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa)
VALUES (19, 'Pagamento de mensalidade de academia', '2023-07-19', '2023-07-19', 100.00, NULL, 'DESPESA', 4, 4);

INSERT INTO lancamento (codigo, descricao, data_vencimento, data_pagamento, valor, observacao, tipo, codigo_categoria, codigo_pessoa)
VALUES (20, 'Venda de produtos de beleza', '2023-07-22', NULL, 120.00, 'Produtos vendidos através de um canal online', 'RECEITA', 5, 5);
