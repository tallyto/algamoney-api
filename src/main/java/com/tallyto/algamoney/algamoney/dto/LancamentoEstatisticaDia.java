package com.tallyto.algamoney.algamoney.dto;

import com.tallyto.algamoney.algamoney.model.TipoLancamento;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDate;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class LancamentoEstatisticaDia {

    private TipoLancamento tipoLancamento;

    private LocalDate dia;

    private BigDecimal total;
}
