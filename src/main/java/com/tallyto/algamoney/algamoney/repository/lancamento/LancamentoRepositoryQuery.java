package com.tallyto.algamoney.algamoney.repository.lancamento;

import com.tallyto.algamoney.algamoney.dto.LancamentoEstatisticaCategoria;
import com.tallyto.algamoney.algamoney.dto.LancamentoEstatisticaDia;
import com.tallyto.algamoney.algamoney.dto.LancamentoEstatisticaPessoa;
import com.tallyto.algamoney.algamoney.model.Lancamento;
import com.tallyto.algamoney.algamoney.repository.lancamento.filter.LancamentoFilter;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.time.LocalDate;
import java.util.List;

public interface LancamentoRepositoryQuery {
    public Page<Lancamento> filtrar(LancamentoFilter filter, Pageable pageable);

    public List<LancamentoEstatisticaCategoria> porCategoria(LocalDate mesReferencia);
    public List<LancamentoEstatisticaDia> porDia(LocalDate mesReferencia);

    public List<LancamentoEstatisticaPessoa> porPessoa(LocalDate inicio, LocalDate fim);
}
