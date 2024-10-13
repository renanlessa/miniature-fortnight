package dev.flix.mapper;

import dev.flix.controller.request.MovieRequest;
import dev.flix.controller.response.CategoryResponse;
import dev.flix.controller.response.MovieResponse;
import dev.flix.entity.Category;
import dev.flix.entity.Movie;
import lombok.experimental.UtilityClass;

import java.util.List;

@UtilityClass
public class MovieMapper {

    public static MovieResponse toMovieResponse(Movie movie) {
        List<CategoryResponse> categories = movie.getCategories()
                .stream()
                .map(category -> CategoryResponse.builder()
                        .id(category.getId())
                        .name(category.getName())
                        .build())
                .toList();

        return MovieResponse.builder()
                .id(movie.getId())
                .name(movie.getName())
                .description(movie.getDescription())
                .categories(categories)
                .build();
    }

    public static Movie toMovie(MovieRequest request) {
        List<Category> categories = request.categories()
                .stream()
                .map(categoryId -> Category.builder().id(categoryId).build())
                .toList();

        return Movie.builder()
                .id(request.id())
                .name(request.name())
                .description(request.description())
                .categories(categories)
                .build();
    }

}
