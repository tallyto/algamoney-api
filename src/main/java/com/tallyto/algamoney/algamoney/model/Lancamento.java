package com.tallyto.algamoney.algamoney.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
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

    @NotBlank(message = "A descrição é obrigatória.")
    @Column(name = "descricao", nullable = false)
    private String descricao;

    @NotNull(message = "A data de vencimento é obrigatória.")
    @Column(name = "data_vencimento", nullable = false)
    private Date dataVencimento;

    @Column(name = "data_pagamento")
    private Date dataPagamento;

    @NotNull(message = "O valor é obrigatório.")
    @DecimalMin(value = "0.01", message = "O valor mínimo deve ser maior que zero.")
    @Column(name = "valor", nullable = false)
    private BigDecimal valor;

    @Column(name = "observacao")
    private String observacao;

    @NotNull(message = "O tipo de lançamento é obrigatório.")
    @Column(name = "tipo", nullable = false)
    @Enumerated(EnumType.STRING)
    private TipoLancamento tipo;

    @NotNull(message = "A categoria é obrigatória.")
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "codigo_categoria", nullable = false)
    private Categoria categoria;

    @NotNull(message = "A pessoa é obrigatória.")
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "codigo_pessoa", nullable = false)
    private Pessoa pessoa;

    // construtores, getters e setters

}
