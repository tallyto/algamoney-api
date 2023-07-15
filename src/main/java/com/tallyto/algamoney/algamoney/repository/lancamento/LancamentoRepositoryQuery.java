package com.tallyto.algamoney.algamoney.repository.lancamento;

import com.tallyto.algamoney.algamoney.model.Lancamento;
import com.tallyto.algamoney.algamoney.repository.filter.LancamentoFilter;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface LancamentoRepositoryQuery {
    public Page<Lancamento> filtrar(LancamentoFilter filter, Pageable pageable);
}
