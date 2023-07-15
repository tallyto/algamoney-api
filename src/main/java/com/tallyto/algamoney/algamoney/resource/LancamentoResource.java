package com.tallyto.algamoney.algamoney.resource;

import com.tallyto.algamoney.algamoney.event.ResourceCreatedEvent;
import com.tallyto.algamoney.algamoney.model.Lancamento;
import com.tallyto.algamoney.algamoney.service.LancamentoService;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/lancamentos")
public class LancamentoResource {

    private final LancamentoService lancamentoService;

    private final ApplicationEventPublisher publisher;
    @Autowired
    public LancamentoResource(LancamentoService lancamentoService, ApplicationEventPublisher publisher) {
        this.lancamentoService = lancamentoService;
        this.publisher = publisher;
    }

    @GetMapping
    public ResponseEntity<List<Lancamento>> listarLancamentos() {
        List<Lancamento> lancamentos = lancamentoService.listarLancamentos();
        return ResponseEntity.ok(lancamentos);
    }

    @GetMapping("/{codigo}")
    public ResponseEntity<Lancamento> buscarLancamentoPorCodigo(@PathVariable Long codigo) {
        Lancamento lancamento = lancamentoService.buscarLancamentoPorCodigo(codigo);
        if (lancamento != null) {
            return ResponseEntity.ok(lancamento);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PostMapping
    public ResponseEntity<Lancamento> criarLancamento(@RequestBody Lancamento lancamento, HttpServletResponse response) {
        Lancamento novoLancamento = lancamentoService.criarLancamento(lancamento);
        publisher.publishEvent(new ResourceCreatedEvent(this, response, lancamento.getCodigo()));
        return ResponseEntity.status(HttpStatus.CREATED).body(novoLancamento);
    }

    @PutMapping("/{codigo}")
    public ResponseEntity<Lancamento> atualizarLancamento(@PathVariable Long codigo, @RequestBody Lancamento lancamentoAtualizado) {
        Lancamento lancamento = lancamentoService.buscarLancamentoPorCodigo(codigo);
        if (lancamento != null) {
            lancamento.setDescricao(lancamentoAtualizado.getDescricao());
            lancamento.setDataVencimento(lancamentoAtualizado.getDataVencimento());
            lancamento.setDataPagamento(lancamentoAtualizado.getDataPagamento());
            lancamento.setValor(lancamentoAtualizado.getValor());
            lancamento.setObservacao(lancamentoAtualizado.getObservacao());
            lancamento.setTipo(lancamentoAtualizado.getTipo());
            lancamento.setCategoria(lancamentoAtualizado.getCategoria());
            lancamento.setPessoa(lancamentoAtualizado.getPessoa());

            return ResponseEntity.ok(lancamentoService.atualizarLancamento(lancamento));
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{codigo}")
    public ResponseEntity<Void> deletarLancamento(@PathVariable Long codigo) {
        boolean lancamentoDeletado = lancamentoService.deletarLancamento(codigo);
        if (lancamentoDeletado) {
            return ResponseEntity.noContent().build();
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}
