package com.tallyto.algamoney.algamoney.dto;

import com.tallyto.algamoney.algamoney.model.TipoLancamento;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.time.LocalDate;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class LancamentoEstatisticaDia {

    private TipoLancamento tipoLancamento;
    private Timestamp dia;
    private BigDecimal total;

    public LancamentoEstatisticaDia(TipoLancamento tipoLancamento, BigDecimal total) {
        this.tipoLancamento = tipoLancamento;
        this.total = total;
    }

    // Getters e setters (se necessário)...
}
