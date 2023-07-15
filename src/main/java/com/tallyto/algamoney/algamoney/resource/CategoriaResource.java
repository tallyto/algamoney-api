package com.tallyto.algamoney.algamoney.resource;

import com.tallyto.algamoney.algamoney.event.ResourceCreatedEvent;
import com.tallyto.algamoney.algamoney.model.Categoria;
import com.tallyto.algamoney.algamoney.repository.CategoriaRepository;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/categorias")
public class CategoriaResource {
    private final CategoriaRepository categoriaRepository;

    @Autowired
    private ApplicationEventPublisher publisher;

    public CategoriaResource(CategoriaRepository categoriaRepository) {
        this.categoriaRepository = categoriaRepository;
    }

    @GetMapping
    public List<Categoria> listar() {
        return categoriaRepository.findAll();
    }

    @GetMapping("/{codigo}")
    public ResponseEntity<Optional<Categoria>> buscarPeloCodigo(@PathVariable Long codigo) {
        var categoria = this.categoriaRepository.findById(codigo);
        return categoria.isPresent() ? ResponseEntity.ok(categoria) : ResponseEntity.notFound().build();
    }

    @PostMapping
    public ResponseEntity<Categoria> criar(@Valid @RequestBody Categoria categoria, HttpServletResponse response) {
        var categoriaSalva = this.categoriaRepository.save(categoria);
        publisher.publishEvent(new ResourceCreatedEvent(this, response, categoria.getCodigo()));
        return ResponseEntity.status(HttpStatus.CREATED).body(categoriaSalva);
    }
}
