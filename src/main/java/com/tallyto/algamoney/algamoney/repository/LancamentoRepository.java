package com.tallyto.algamoney.algamoney.repository;

import com.tallyto.algamoney.algamoney.model.Lancamento;
import com.tallyto.algamoney.algamoney.repository.lancamento.LancamentoRepositoryQuery;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LancamentoRepository extends JpaRepository<Lancamento, Long>, LancamentoRepositoryQuery {
}
