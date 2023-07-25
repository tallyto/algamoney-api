package com.tallyto.algamoney.algamoney.service;

import com.tallyto.algamoney.algamoney.exception.PessoaInexistenteOuInativaException;
import com.tallyto.algamoney.algamoney.model.Lancamento;
import com.tallyto.algamoney.algamoney.model.Pessoa;
import com.tallyto.algamoney.algamoney.repository.lancamento.LancamentoRepository;
import com.tallyto.algamoney.algamoney.repository.pessoa.PessoaRepository;
import com.tallyto.algamoney.algamoney.repository.lancamento.filter.LancamentoFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class LancamentoService {

    private final LancamentoRepository lancamentoRepository;

    @Autowired
    private PessoaRepository pessoaRepository;

    @Autowired
    public LancamentoService(LancamentoRepository lancamentoRepository) {
        this.lancamentoRepository = lancamentoRepository;
    }

    public Page<Lancamento> filtrar(LancamentoFilter filter, Pageable pageable) {

        return lancamentoRepository.filtrar(filter, pageable);
    }

    public Lancamento buscarLancamentoPorCodigo(Long codigo) {
        return lancamentoRepository.findById(codigo).orElse(null);
    }

    public Lancamento criarLancamento(Lancamento lancamento) {
        Pessoa pessoa = pessoaRepository.findById(lancamento.getPessoa().getCodigo()).orElse(null);
        if (pessoa == null || pessoa.isInativo()) {
            throw new PessoaInexistenteOuInativaException();
        }
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
