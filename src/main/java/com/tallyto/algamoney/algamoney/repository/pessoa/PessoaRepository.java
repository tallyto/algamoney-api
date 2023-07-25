package com.tallyto.algamoney.algamoney.repository.pessoa;

import com.tallyto.algamoney.algamoney.model.Pessoa;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PessoaRepository extends JpaRepository<Pessoa, Long>, PessoaRepositoryQuery {
}
