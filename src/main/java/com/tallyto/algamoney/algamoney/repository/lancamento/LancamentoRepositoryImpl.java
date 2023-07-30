package com.tallyto.algamoney.algamoney.repository.lancamento;

import com.tallyto.algamoney.algamoney.dto.LancamentoEstatisticaCategoria;
import com.tallyto.algamoney.algamoney.dto.LancamentoEstatisticaDia;
import com.tallyto.algamoney.algamoney.model.Lancamento;
import com.tallyto.algamoney.algamoney.repository.lancamento.filter.LancamentoFilter;
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
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Repository
public class LancamentoRepositoryImpl implements LancamentoRepositoryQuery {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Page<Lancamento> filtrar(LancamentoFilter filter, Pageable pageable) {
        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Lancamento> criteriaQuery = builder.createQuery(Lancamento.class);
        Root<Lancamento> root = criteriaQuery.from(Lancamento.class);

        // Cria as restrições
        Predicate[] predicates = criarRestricoes(filter, builder, root);
        criteriaQuery.where(predicates);

        TypedQuery<Lancamento> query = entityManager.createQuery(criteriaQuery);
        adicionarRestricoesDePaginacao(query, pageable);


        return new PageImpl<>(query.getResultList(), pageable, total(filter));
    }

    @Override
    public List<LancamentoEstatisticaCategoria> porCategoria(LocalDate mesReferencia) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();

        CriteriaQuery<LancamentoEstatisticaCategoria> criteriaQuery = criteriaBuilder
                .createQuery(LancamentoEstatisticaCategoria.class);

        Root<Lancamento> root = criteriaQuery.from(Lancamento.class);

        criteriaQuery.select(criteriaBuilder.construct(LancamentoEstatisticaCategoria.class,
                root.get("categoria"), criteriaBuilder.sum(root.get("valor"))));

        LocalDate primeiroDia = mesReferencia.withDayOfMonth(1);
        LocalDate ultimoDia = mesReferencia.withDayOfMonth(mesReferencia.lengthOfMonth());

        criteriaQuery.where(criteriaBuilder.greaterThanOrEqualTo(root.get("dataVencimento"), primeiroDia),
                criteriaBuilder.lessThanOrEqualTo(root.get("dataVencimento"), ultimoDia));

        criteriaQuery.groupBy(root.get("categoria"));

        TypedQuery<LancamentoEstatisticaCategoria> typedQuery = entityManager.createQuery(criteriaQuery);

        return typedQuery.getResultList();
    }

    @Override
    public List<LancamentoEstatisticaDia> porDia(LocalDate mesReferencia) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();

        CriteriaQuery<LancamentoEstatisticaDia> criteriaQuery = criteriaBuilder
                .createQuery(LancamentoEstatisticaDia.class);

        Root<Lancamento> root = criteriaQuery.from(Lancamento.class);

        criteriaQuery.select(criteriaBuilder.construct(LancamentoEstatisticaDia.class,
                root.get("tipo"), root.get("dataVencimento"), criteriaBuilder.sum(root.get("valor"))));

        LocalDate primeiroDia = mesReferencia.withDayOfMonth(1);

        LocalDate ultimoDia = mesReferencia.withDayOfMonth(mesReferencia.lengthOfMonth());

        criteriaQuery.where(criteriaBuilder.greaterThanOrEqualTo(root.get("dataVencimento"), primeiroDia),
                criteriaBuilder.lessThanOrEqualTo(root.get("dataVencimento"), ultimoDia));

        criteriaQuery.groupBy(root.get("tipo"),root.get("dataVencimento"));

        TypedQuery<LancamentoEstatisticaDia> typedQuery = entityManager.createQuery(criteriaQuery);

        return typedQuery.getResultList();
    }

    private Predicate[] criarRestricoes(LancamentoFilter filter, CriteriaBuilder builder, Root<Lancamento> root) {
        List<Predicate> predicates = new ArrayList<>();

        if (!StringUtils.isEmpty(filter.getDescricao())) {
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

    private void adicionarRestricoesDePaginacao(TypedQuery<Lancamento> query, Pageable pageable) {
        int paginaAtual = pageable.getPageNumber();
        int totalDeRegistrosPorPagina = pageable.getPageSize();
        int primeiroRegistroDaPagina = paginaAtual * totalDeRegistrosPorPagina;
        query.setFirstResult(primeiroRegistroDaPagina);
        query.setMaxResults(totalDeRegistrosPorPagina);
    }

    private Long total(LancamentoFilter filter) {
        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Long> criteria = builder.createQuery(Long.class);
        Root<Lancamento> root = criteria.from(Lancamento.class);

        Predicate[] predicates = criarRestricoes(filter, builder, root);

        criteria.where(predicates);

        criteria.select(builder.count(root));

        return entityManager.createQuery(criteria).getSingleResult();
    }

}
