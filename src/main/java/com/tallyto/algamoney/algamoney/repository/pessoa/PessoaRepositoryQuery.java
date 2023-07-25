package com.tallyto.algamoney.algamoney.repository.pessoa;

import com.tallyto.algamoney.algamoney.model.Pessoa;
import com.tallyto.algamoney.algamoney.repository.pessoa.filter.PessoaFilter;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface PessoaRepositoryQuery {
    public Page<Pessoa> filtrar(PessoaFilter filter, Pageable pageable);
}
