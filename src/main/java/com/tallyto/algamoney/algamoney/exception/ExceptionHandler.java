package com.tallyto.algamoney.algamoney.exception;

import lombok.Getter;
import lombok.ToString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import java.util.ArrayList;
import java.util.List;

@ControllerAdvice
public class ExceptionHandler extends ResponseEntityExceptionHandler {
    @Autowired
    private MessageSource messageSource;

    @Override
    protected ResponseEntity<Object> handleHttpMessageNotReadable(HttpMessageNotReadableException ex, HttpHeaders headers, HttpStatusCode status, WebRequest request) {
        var mensagem = messageSource.getMessage("mensagem.invalida", null, LocaleContextHolder.getLocale());
        var devMessage = ex.getCause() != null ? ex.getCause().toString() : ex.toString();
        var erros = List.of(new ErroHandler(mensagem, devMessage));
        return handleExceptionInternal(ex, erros, headers, HttpStatus.BAD_REQUEST, request);
    }

    @Override
    protected ResponseEntity<Object> handleMethodArgumentNotValid(MethodArgumentNotValidException ex, HttpHeaders headers, HttpStatusCode status, WebRequest request) {
        var erros = criarListaDeErros(ex.getBindingResult());
        return handleExceptionInternal(ex, erros, headers, HttpStatus.BAD_REQUEST, request);
    }

    @ResponseStatus(HttpStatus.NOT_FOUND)
    public static class ResourceNotFoundException extends RuntimeException {
        public ResourceNotFoundException(String message) {
            super(message);
        }
    }

    private List<ErroHandler> criarListaDeErros(BindingResult bindingResult) {
        var erros = new ArrayList<ErroHandler>();
        for (FieldError fieldError : bindingResult.getFieldErrors()) {
            var mensagemUsuario = messageSource.getMessage(fieldError, LocaleContextHolder.getLocale());
            var mensagemDesenvolvedor = fieldError.toString();
            erros.add(new ErroHandler(mensagemUsuario, mensagemDesenvolvedor));
        }
        return erros;
    }

    @Getter
    @ToString
    public static class ErroHandler {
        String userMessage;
        String devMessage;

        public ErroHandler(String userMessage, String devMessage) {
            this.userMessage = userMessage;
            this.devMessage = devMessage;
        }
    }


}

