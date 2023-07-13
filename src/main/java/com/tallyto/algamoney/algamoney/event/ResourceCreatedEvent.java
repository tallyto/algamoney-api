package com.tallyto.algamoney.algamoney.event;

import jakarta.servlet.http.HttpServletResponse;
import lombok.Getter;
import org.springframework.context.ApplicationEvent;

@Getter
public class ResourceCreatedEvent extends ApplicationEvent {

    private HttpServletResponse response;
    private Long code;
    public ResourceCreatedEvent(Object source, HttpServletResponse response, Long code) {
        super(source);
        this.response = response;
        this.code = code;
    }
}
