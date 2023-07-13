package com.tallyto.algamoney.algamoney.service;

import com.tallyto.algamoney.algamoney.exception.ExceptionHandler;
import com.tallyto.algamoney.algamoney.model.Pessoa;
import com.tallyto.algamoney.algamoney.repository.PessoaRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PessoaService {

    @Autowired
    private PessoaRepository pessoaRepository;

    public Pessoa atualizar(Long codigo, Pessoa pessoa) {
        Pessoa pessoaSalva = getPessoaSalva(codigo);
        BeanUtils.copyProperties(pessoa, pessoaSalva, "codigo");
        return pessoaRepository.save(pessoaSalva);
    }

    private Pessoa getPessoaSalva(Long codigo) {
        return pessoaRepository.findById(codigo).orElseThrow(() ->
                new ExceptionHandler.ResourceNotFoundException("pessoa nao encontrada"));
    }

    public void atualizarPropriedadeAtivo(Long codigo, Boolean ativo) {
        Pessoa pessoaSalva = getPessoaSalva(codigo);
        pessoaSalva.setAtivo(ativo);
        pessoaRepository.save(pessoaSalva);
    }
}
