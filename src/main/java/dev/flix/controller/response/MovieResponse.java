package dev.flix.controller.response;

import lombok.Builder;

import java.util.List;

@Builder
public record MovieResponse(Long id, String name, String description, List<CategoryResponse> categories,
                            List<StreamServiceResponse> services) {
}
