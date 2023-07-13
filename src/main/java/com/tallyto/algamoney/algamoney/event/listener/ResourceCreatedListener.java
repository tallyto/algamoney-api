package com.tallyto.algamoney.algamoney.event.listener;

import com.tallyto.algamoney.algamoney.event.ResourceCreatedEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

@Component
public class ResourceCreatedListener implements ApplicationListener<ResourceCreatedEvent> {
    @Override
    public void onApplicationEvent(ResourceCreatedEvent event) {
        var response = event.getResponse();
        var code = event.getCode();
        var uri = ServletUriComponentsBuilder.fromCurrentRequestUri().path("/{codigo}")
                .buildAndExpand(code).toUri();
        response.setHeader("Location", uri.toASCIIString());
    }
}
