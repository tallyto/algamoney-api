package com.tallyto.algamoney.algamoney.repository.lancamento;

import com.mysql.cj.util.StringUtils;
import com.tallyto.algamoney.algamoney.model.Lancamento;
import com.tallyto.algamoney.algamoney.repository.filter.LancamentoFilter;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class LancamentoRepositoryImpl implements LancamentoRepositoryQuery {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Lancamento> filtrar(LancamentoFilter filter) {
        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Lancamento> criteriaQuery = builder.createQuery(Lancamento.class);
        Root<Lancamento> root = criteriaQuery.from(Lancamento.class);

        // Cria as restrições
        Predicate[] predicates = criarRestricoes(filter, builder, root);
        criteriaQuery.where(predicates);

        TypedQuery<Lancamento> query = entityManager.createQuery(criteriaQuery);

        return query.getResultList();
    }

    private Predicate[] criarRestricoes(LancamentoFilter filter, CriteriaBuilder builder, Root<Lancamento> root) {
        List<Predicate> predicates = new ArrayList<>();

        if (!StringUtils.isNullOrEmpty(filter.getDescricao())) {
            predicates.add(builder.like(builder.lower(root.get("descricao")),
                    "%" + filter.getDescricao().toLowerCase() + "%"));
        }

        if (filter.getDataDeVencimentoDe() != null) {
            predicates.add(builder.greaterThanOrEqualTo(root.get("dataVencimento"), filter.getDataDeVencimentoDe()));
        }

        if (filter.getDataDeVencimentoAte() != null) {
            predicates.add(builder.lessThanOrEqualTo(root.get("dataVencimento"), filter.getDataDeVencimentoAte()));
        }

        return predicates.toArray(new Predicate[0]);
    }
}
