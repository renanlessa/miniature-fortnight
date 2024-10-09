package dev.flix.repository;

import dev.flix.entity.StreamService;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StreamServiceRepository extends JpaRepository<StreamService, Long> {
}
