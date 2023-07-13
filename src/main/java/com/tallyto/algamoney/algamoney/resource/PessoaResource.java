package com.tallyto.algamoney.algamoney.resource;

import com.tallyto.algamoney.algamoney.event.ResourceCreatedEvent;
import com.tallyto.algamoney.algamoney.model.Pessoa;
import com.tallyto.algamoney.algamoney.repository.PessoaRepository;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/pessoas")
public class PessoaResource {
    private final PessoaRepository pessoaRepository;

    @Autowired
    private ApplicationEventPublisher publisher;

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
    public ResponseEntity<Pessoa> criar(@Valid @RequestBody Pessoa pessoa, HttpServletResponse response) {
        var pessoaSalva = this.pessoaRepository.save(pessoa);
        publisher.publishEvent(new ResourceCreatedEvent(this, response, pessoaSalva.getCodigo()));
        return ResponseEntity.status(HttpStatus.CREATED).body(pessoaSalva);

    }
}
