package com.tallyto.algamoney.algamoney.dto;

import com.tallyto.algamoney.algamoney.model.Pessoa;
import com.tallyto.algamoney.algamoney.model.TipoLancamento;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class LancamentoEstatisticaPessoa {

    private TipoLancamento tipo;

    private Pessoa pessoa;

    private BigDecimal total;

}
