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
