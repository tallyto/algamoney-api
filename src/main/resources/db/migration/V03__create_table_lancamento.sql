create table lancamento(
    codigo bigint primary key auto_increment,
    descricao varchar(50) not null,
    data_vencimento DATE not null,
    data_pagamento DATE,
    valor decimal(10,2) not null,
    observacao varchar(100),
    tipo varchar(20) not null,
    codigo_categoria bigint not null,
    codigo_pessoa bigint not null,
    foreign key (codigo_categoria) references categoria(codigo),
    foreign key (codigo_pessoa) references pessoa(codigo)
);