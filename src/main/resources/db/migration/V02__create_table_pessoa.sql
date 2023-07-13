CREATE TABLE pessoa
(
    codigo BIGINT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    ativo BOOL NOT NULL,
    logradouro VARCHAR(255),
    numero VARCHAR(255),
    complemento VARCHAR(255),
    bairro VARCHAR(255),
    cep VARCHAR(255)
);
