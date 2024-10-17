package dev.flix.service;

import dev.flix.entity.StreamService;
import dev.flix.repository.StreamServiceRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class StreamServiceService {

    private final StreamServiceRepository streamServiceRepository;

    public StreamService save(StreamService streamService) {
        return streamServiceRepository.save(streamService);
    }

    public Optional<StreamService> findById(Long id) {
        return streamServiceRepository.findById(id);
    }

    public List<StreamService> findAll() {
        return streamServiceRepository.findAll();
    }

    public void deleteById(Long id) {
        streamServiceRepository.deleteById(id);
    }
}
