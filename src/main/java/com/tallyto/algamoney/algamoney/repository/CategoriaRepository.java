package com.tallyto.algamoney.algamoney.repository;

import com.tallyto.algamoney.algamoney.model.Categoria;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoriaRepository extends JpaRepository<Categoria, Long> {
}
