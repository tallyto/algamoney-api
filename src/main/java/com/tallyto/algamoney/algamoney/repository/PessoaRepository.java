package com.tallyto.algamoney.algamoney.repository;

import com.tallyto.algamoney.algamoney.model.Pessoa;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PessoaRepository extends JpaRepository<Pessoa, Long> {
}
