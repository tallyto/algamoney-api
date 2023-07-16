CREATE TABLE pessoa (
                        codigo BIGSERIAL PRIMARY KEY,
                        nome VARCHAR(50) NOT NULL,
                        ativo BOOLEAN NOT NULL,
                        logradouro VARCHAR(255),
                        numero VARCHAR(255),
                        complemento VARCHAR(255),
                        bairro VARCHAR(255),
                        cep VARCHAR(255)
);
