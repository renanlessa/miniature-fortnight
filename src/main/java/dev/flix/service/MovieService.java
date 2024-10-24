package dev.flix.service;

import dev.flix.entity.Category;
import dev.flix.entity.Movie;
import dev.flix.entity.StreamService;
import dev.flix.repository.MovieRespository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class MovieService {

    private final MovieRespository movieRespository;
    private final CategoryService categoryService;
    private final StreamServiceService streamServiceService;

    public List<Movie> findAll() {
        return movieRespository.findAll();
    }

    public Optional<Movie> findById(Long id) {
        return movieRespository.findById(id);
    }

    public List<Movie> findByCategory(Long categoryId) {
        return movieRespository.findMovieByCategories(List.of(Category.builder().id(categoryId).build()));
    }

    public Movie save(Movie newMovie) {
        newMovie.setCategories(findCategories(newMovie.getCategories()));
        newMovie.setServices(findServices(newMovie.getServices()));
        return movieRespository.save(newMovie);
    }

    public Optional<Movie> update(Movie updateMovie) {
        Optional<Movie> optMovie = findById(updateMovie.getId());
        if (optMovie.isPresent()) {
            Movie movie = optMovie.get();
            movie.setName(updateMovie.getName());
            movie.setDescription(updateMovie.getDescription());
            movie.setRating(updateMovie.getRating());
            movie.setReleaseDate(updateMovie.getReleaseDate());

            movie.getCategories().clear();
            movie.getCategories().addAll(findCategories(updateMovie.getCategories()));

            movie.getServices().clear();
            movie.getServices().addAll(findServices(updateMovie.getServices()));

            return Optional.of(movieRespository.save(movie));
        }
        return Optional.empty();
    }

    public void deleteById(Long id) {
        movieRespository.deleteById(id);
    }

    private List<Category> findCategories(List<Category> categories) {
        List<Category> categoriesList = new ArrayList<>();
        categories.forEach(category -> {
            Optional<Category> optCategory = categoryService.findById(category.getId());
            optCategory.ifPresent(categoriesList::add);
        });
        return categoriesList;
    }

    private List<StreamService> findServices(List<StreamService> services) {
        List<StreamService> servicesList = new ArrayList<>();
        services.forEach(service -> {
            Optional<StreamService> optStreamService = streamServiceService.findById(service.getId());
            optStreamService.ifPresent(servicesList::add);
        });
        return servicesList;
    }
}
