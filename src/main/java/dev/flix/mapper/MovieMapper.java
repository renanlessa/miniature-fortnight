package dev.flix.mapper;

import dev.flix.controller.request.MovieRequest;
import dev.flix.controller.response.CategoryResponse;
import dev.flix.controller.response.MovieResponse;
import dev.flix.controller.response.StreamServiceResponse;
import dev.flix.entity.Category;
import dev.flix.entity.Movie;
import dev.flix.entity.StreamService;
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

        List<StreamServiceResponse> services = movie.getServices()
                .stream()
                .map(streamService -> StreamServiceResponse.builder()
                        .id(streamService.getId())
                        .name(streamService.getName())
                        .build())
                .toList();

        return MovieResponse.builder()
                .id(movie.getId())
                .title(movie.getName())
                .description(movie.getDescription())
                .rating(movie.getRating())
                .releaseDate(movie.getReleaseDate())
                .categories(categories)
                .services(services)
                .build();
    }

    public static Movie toMovie(MovieRequest request) {
        List<Category> categories = request.categories()
                .stream()
                .map(categoryId -> Category.builder().id(categoryId).build())
                .toList();

        List<StreamService> services = request.services()
                .stream()
                .map(streamServiceId -> StreamService.builder().id(streamServiceId).build())
                .toList();

        return Movie.builder()
                .id(request.id())
                .name(request.title())
                .description(request.description())
                .rating(request.rating())
                .releaseDate(request.releaseDate())
                .categories(categories)
                .services(services)
                .build();
    }

}
