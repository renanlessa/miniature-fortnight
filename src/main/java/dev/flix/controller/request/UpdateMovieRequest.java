package dev.flix.controller.request;

import java.util.List;

public record UpdateMovieRequest(Long id, String name, String description, List<Long> categories) {
}
