package com.tallyto.algamoney.algamoney.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "lancamento")
@Getter
@Setter
public class Lancamento {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "codigo")
    private Long codigo;

    @Column(name = "descricao", nullable = false)
    private String descricao;

    @Column(name = "data_vencimento", nullable = false)
    private Date dataVencimento;

    @Column(name = "data_pagamento")
    private Date dataPagamento;

    @Column(name = "valor", nullable = false)
    private BigDecimal valor;

    @Column(name = "observacao")
    private String observacao;

    @Column(name = "tipo", nullable = false)
    @Enumerated(EnumType.STRING)
    private TipoLancamento tipo;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "codigo_categoria", nullable = false)
    private Categoria categoria;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "codigo_pessoa", nullable = false)
    private Pessoa pessoa;

    // construtores, getters e setters

}
