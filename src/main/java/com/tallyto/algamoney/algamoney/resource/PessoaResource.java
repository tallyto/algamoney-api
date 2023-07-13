package com.tallyto.algamoney.algamoney.resource;

import com.tallyto.algamoney.algamoney.model.Pessoa;
import com.tallyto.algamoney.algamoney.repository.PessoaRepository;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/pessoas")
public class PessoaResource {
    private final PessoaRepository pessoaRepository;

    public PessoaResource(PessoaRepository pessoaRepository) {
        this.pessoaRepository = pessoaRepository;
    }

    @GetMapping
    public List<Pessoa> listar(){
        return pessoaRepository.findAll();
    }

    @GetMapping("/{codigo}")
    public ResponseEntity<Optional<Pessoa>> buscarPeloCodigo(@PathVariable Long codigo){
        var pessoa = this.pessoaRepository.findById(codigo);
        return pessoa.isPresent() ? ResponseEntity.ok(pessoa) : ResponseEntity.notFound().build();
    }

    @PostMapping
    public ResponseEntity<Pessoa> criar(@Valid @RequestBody Pessoa pessoa) {
        var pessoaSalva = this.pessoaRepository.save(pessoa);
        var uri = ServletUriComponentsBuilder.fromCurrentRequestUri().path("/{codigo}")
                .buildAndExpand(pessoaSalva.getCodigo()).toUri();
        return ResponseEntity.created(uri).body(pessoaSalva);

    }
}
