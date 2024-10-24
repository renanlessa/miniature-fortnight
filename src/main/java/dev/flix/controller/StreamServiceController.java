package dev.flix.controller;

import dev.flix.controller.request.StreamServiceRequest;
import dev.flix.controller.response.StreamServiceResponse;
import dev.flix.entity.StreamService;
import dev.flix.mapper.StreamServiceMapper;
import dev.flix.service.StreamServiceService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/flix/stream-service")
@RequiredArgsConstructor
public class StreamServiceController {

    private final StreamServiceService service;

    @PostMapping
    public ResponseEntity<StreamServiceResponse> createCategory(@Valid @RequestBody StreamServiceRequest request) {
        StreamService streamService = StreamServiceMapper.toStreamService(request);
        StreamService savedStreamService = service.save(streamService);
        return ResponseEntity.status(HttpStatus.CREATED).body(StreamServiceMapper.toStreamServiceResponse(savedStreamService));
    }

    @GetMapping
    public ResponseEntity<List<StreamServiceResponse>> findAll() {
        List<StreamServiceResponse> services = service.findAll().stream()
                .map(StreamServiceMapper::toStreamServiceResponse)
                .toList();

        return ResponseEntity.ok(services);
    }

    @GetMapping("/{id}")
    public ResponseEntity<StreamServiceResponse> find(@PathVariable Long id) {
        return service.findById(id)
                .map(streamService -> ResponseEntity.ok(StreamServiceMapper.toStreamServiceResponse(streamService)))
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        try {
            service.deleteById(id);
        } catch (DataIntegrityViolationException e) {
            return ResponseEntity.status(HttpStatus.UNPROCESSABLE_ENTITY).build();
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
        return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
    }

}
