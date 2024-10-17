package dev.flix.controller.response;

import lombok.Builder;

@Builder
public record StreamServiceResponse(Long id, String name) {
}
