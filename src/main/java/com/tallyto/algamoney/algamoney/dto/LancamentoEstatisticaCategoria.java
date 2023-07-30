package com.tallyto.algamoney.algamoney.dto;

import com.tallyto.algamoney.algamoney.model.Categoria;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;


@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class LancamentoEstatisticaCategoria {

    private Categoria categoria;

    private BigDecimal total;


}
