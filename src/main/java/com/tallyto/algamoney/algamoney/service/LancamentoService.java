package com.tallyto.algamoney.algamoney.service;

import com.tallyto.algamoney.algamoney.model.Lancamento;
import com.tallyto.algamoney.algamoney.repository.LancamentoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LancamentoService {

    private final LancamentoRepository lancamentoRepository;

    @Autowired
    public LancamentoService(LancamentoRepository lancamentoRepository) {
        this.lancamentoRepository = lancamentoRepository;
    }

    public List<Lancamento> listarLancamentos() {
        return lancamentoRepository.findAll();
    }

    public Lancamento buscarLancamentoPorCodigo(Long codigo) {
        return lancamentoRepository.findById(codigo).orElse(null);
    }

    public Lancamento criarLancamento(Lancamento lancamento) {
        return lancamentoRepository.save(lancamento);
    }

    public Lancamento atualizarLancamento(Lancamento lancamento) {
        return lancamentoRepository.save(lancamento);
    }

    public boolean deletarLancamento(Long codigo) {
        if (lancamentoRepository.existsById(codigo)) {
            lancamentoRepository.deleteById(codigo);
            return true;
        }
        return false;
    }
}
