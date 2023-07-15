package com.tallyto.algamoney.algamoney.repository.lancamento;

import com.tallyto.algamoney.algamoney.model.Lancamento;
import com.tallyto.algamoney.algamoney.repository.filter.LancamentoFilter;

import java.util.List;

public interface LancamentoRepositoryQuery {
    public List<Lancamento> filtrar (LancamentoFilter filter);
}
