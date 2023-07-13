package com.tallyto.algamoney.algamoney.model;

import jakarta.persistence.Embeddable;
import lombok.Getter;
import lombok.Setter;

@Embeddable
@Getter
@Setter
public class Endereco {
    public String logradouro;
    public String numero;
    public String complemento;
    public String bairro;
    public String cep;
}
