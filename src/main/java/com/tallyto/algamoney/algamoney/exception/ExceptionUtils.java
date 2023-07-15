package com.tallyto.algamoney.algamoney.exception;

import lombok.Getter;
import lombok.ToString;

public class ExceptionUtils {
    @Getter
    @ToString
    public static class HandlerExceptionMessage {
        String userMessage;
        String devMessage;

        public HandlerExceptionMessage(String userMessage, String devMessage) {
            this.userMessage = userMessage;
            this.devMessage = devMessage;
        }
    }
}
