package dev.flix.controller.request;

import jakarta.validation.constraints.NotEmpty;

public record StreamServiceRequest(@NotEmpty(message = "Nome do serviço de streaming é obrigatório.") String name) {
}
