package dev.flix.controller.request;

import java.util.List;

public record MovieRequest(Long id, String name, String description, List<Long> categories, List<Long> services) {

}
