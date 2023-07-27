package com.tallyto.algamoney.algamoney.repository.pessoa;

import com.tallyto.algamoney.algamoney.model.Pessoa;
import com.tallyto.algamoney.algamoney.repository.pessoa.filter.PessoaFilter;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import org.apache.commons.lang3.StringUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class PessoaRepositoryImpl implements PessoaRepositoryQuery {
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Page<Pessoa> filtrar(PessoaFilter filter, Pageable pageable) {
        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Pessoa> criteriaQuery = builder.createQuery(Pessoa.class);
        Root<Pessoa> root = criteriaQuery.from(Pessoa.class);

        // Cria as restrições
        Predicate[] predicates = criarRestricoes(filter, builder, root);
        criteriaQuery.where(predicates);

        // Adicionar ordenação pela data de última modificação
        if (pageable.getSort().isUnsorted()) {
            criteriaQuery.orderBy(builder.desc(root.get("ativo")));
        } else {
            Sort.Order sortOrder = pageable.getSort().get().findFirst().get();
            String property = sortOrder.getProperty();
            Sort.Direction direction = sortOrder.getDirection();
            if (direction == Sort.Direction.DESC) {
                criteriaQuery.orderBy(builder.desc(root.get(property)));
            } else {
                criteriaQuery.orderBy(builder.asc(root.get(property)));
            }
        }


        TypedQuery<Pessoa> query = entityManager.createQuery(criteriaQuery);
        adicionarRestricoesDePaginacao(query, pageable);


        return new PageImpl<>(query.getResultList(), pageable, total(filter));
    }

    private Predicate[] criarRestricoes(PessoaFilter filter, CriteriaBuilder builder, Root<Pessoa> root) {
        List<Predicate> predicates = new ArrayList<>();

        if (!StringUtils.isEmpty(filter.getNome())) {
            predicates.add(builder.like(builder.lower(root.get("nome")),
                    "%" + filter.getNome().toLowerCase() + "%"));
        }

        if (!StringUtils.isEmpty(filter.getCidade())) {
            predicates.add(builder.like(builder.lower(root.get("cidade")),
                    "%" + filter.getCidade().toLowerCase() + "%"));
        }

        if (!StringUtils.isEmpty(filter.getEstado())) {
            predicates.add(builder.like(builder.lower(root.get("estado")),
                    "%" + filter.getEstado().toLowerCase() + "%"));
        }

        if (filter.getAtivo() != null) {
            predicates.add(builder.equal(root.get("ativo"), filter.getAtivo()));
        }

        return predicates.toArray(new Predicate[0]);
    }

    private void adicionarRestricoesDePaginacao(TypedQuery<Pessoa> query, Pageable pageable) {
        int paginaAtual = pageable.getPageNumber();
        int totalDeRegistrosPorPagina = pageable.getPageSize();
        int primeiroRegistroDaPagina = paginaAtual * totalDeRegistrosPorPagina;
        query.setFirstResult(primeiroRegistroDaPagina);
        query.setMaxResults(totalDeRegistrosPorPagina);
    }

    private Long total(PessoaFilter filter) {
        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Long> criteria = builder.createQuery(Long.class);
        Root<Pessoa> root = criteria.from(Pessoa.class);

        Predicate[] predicates = criarRestricoes(filter, builder, root);

        criteria.where(predicates);

        criteria.select(builder.count(root));

        return entityManager.createQuery(criteria).getSingleResult();
    }

}
