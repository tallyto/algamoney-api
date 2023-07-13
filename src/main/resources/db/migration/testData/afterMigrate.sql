set foreign_key_checks = 0;

delete from categoria;
delete from pessoa;

set foreign_key_checks = 1;

alter table categoria auto_increment = 1;
alter table pessoa auto_increment = 1;

INSERT INTO categoria (nome) VALUES ('Eletrônicos');
INSERT INTO categoria (nome) VALUES ('Moda');
INSERT INTO categoria (nome) VALUES ('Decoração');
INSERT INTO categoria (nome) VALUES ('Esportes');
INSERT INTO categoria (nome) VALUES ('Beleza');
INSERT INTO categoria (nome) VALUES ('Alimentos');
INSERT INTO categoria (nome) VALUES ('Livros');
INSERT INTO categoria (nome) VALUES ('Viagens');

INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep)
VALUES ('João', 1, 'Rua A', '123', 'Apto 1', 'Centro', '12345-678');

INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep)
VALUES ('Maria', 1, 'Rua B', '456', NULL, 'Vila Nova', '98765-432');

INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep)
VALUES ('Pedro', 0, 'Rua C', '789', 'Casa 2', 'Jardim', '54321-876');

INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep)
VALUES ('Ana', 1, 'Rua D', '321', NULL, 'Liberdade', '67890-123');

INSERT INTO pessoa (nome, ativo, logradouro, numero, complemento, bairro, cep)
VALUES ('Carlos', 0, 'Rua E', '654', 'Sala 3', 'Industrial', '21098-765');
