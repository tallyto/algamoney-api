package com.tallyto.algamoney.algamoney.service;

import com.tallyto.algamoney.algamoney.exception.PessoaInexistenteOuInativaException;
import com.tallyto.algamoney.algamoney.model.Lancamento;
import com.tallyto.algamoney.algamoney.model.Pessoa;
import com.tallyto.algamoney.algamoney.repository.LancamentoRepository;
import com.tallyto.algamoney.algamoney.repository.PessoaRepository;
import com.tallyto.algamoney.algamoney.repository.filter.LancamentoFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LancamentoService {

    private final LancamentoRepository lancamentoRepository;

    @Autowired
    private PessoaRepository pessoaRepository;

    @Autowired
    public LancamentoService(LancamentoRepository lancamentoRepository) {
        this.lancamentoRepository = lancamentoRepository;
    }

    public List<Lancamento> pesquisar(LancamentoFilter filter) {

        return lancamentoRepository.filtrar(filter);
    }

    public Lancamento buscarLancamentoPorCodigo(Long codigo) {
        return lancamentoRepository.findById(codigo).orElse(null);
    }

    public Lancamento criarLancamento(Lancamento lancamento) {
        Pessoa pessoa = pessoaRepository.findById(lancamento.getPessoa().getCodigo()).orElse(null);
        if (pessoa == null || pessoa.isInativo()){
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
