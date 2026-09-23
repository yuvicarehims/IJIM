package com.ayurvedic.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.ayurvedic.main.entity.Volume;

public interface VolumeRepository extends JpaRepository<Volume, Long> {
    boolean existsByName(String name);
    Volume findByName(String name);
}
