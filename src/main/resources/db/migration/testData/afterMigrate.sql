set foreign_key_checks = 0;

delete from categoria;

set foreign_key_checks = 1;

alter table categoria auto_increment = 1;

INSERT INTO categoria (nome) VALUES ('Eletrônicos');
INSERT INTO categoria (nome) VALUES ('Moda');
INSERT INTO categoria (nome) VALUES ('Decoração');
INSERT INTO categoria (nome) VALUES ('Esportes');
INSERT INTO categoria (nome) VALUES ('Beleza');
INSERT INTO categoria (nome) VALUES ('Alimentos');
INSERT INTO categoria (nome) VALUES ('Livros');
INSERT INTO categoria (nome) VALUES ('Viagens');
