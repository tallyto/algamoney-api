package com.tallyto.algamoney.algamoney.repository.pessoa.filter;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PessoaFilter {
    private String nome;
    private String cidade;
    private String estado;
    private Boolean ativo;
}
