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
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

@ControllerAdvice
public class ExceptionHandler extends ResponseEntityExceptionHandler
{
    @Autowired
    private MessageSource messageSource;
    @Override
    protected ResponseEntity<Object> handleHttpMessageNotReadable(HttpMessageNotReadableException ex, HttpHeaders headers, HttpStatusCode status, WebRequest request) {
        var mensagem = messageSource.getMessage("mensagem.invalida", null, LocaleContextHolder.getLocale());
        var devMessage = ex.getCause().getMessage();
        return handleExceptionInternal(ex, new ErroHandler(mensagem, devMessage), headers, HttpStatus.BAD_REQUEST, request);
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

