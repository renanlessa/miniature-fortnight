package dev.flix.repository;

import dev.flix.entity.Movie;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MovieRespository extends JpaRepository<Movie, Long> {
}
