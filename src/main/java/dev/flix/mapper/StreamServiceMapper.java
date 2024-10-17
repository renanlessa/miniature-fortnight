package dev.flix.mapper;

import dev.flix.controller.request.StreamServiceRequest;
import dev.flix.controller.response.StreamServiceResponse;
import dev.flix.entity.StreamService;
import lombok.experimental.UtilityClass;

@UtilityClass
public class StreamServiceMapper {

    public static StreamService toStreamService(StreamServiceRequest request) {
        return StreamService
                .builder()
                .name(request.name())
                .build();
    }

    public static StreamServiceResponse toStreamServiceResponse(StreamService entity) {
        return StreamServiceResponse
                .builder()
                .id(entity.getId())
                .name(entity.getName())
                .build();
    }
}
