package com.ayurvedic.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.ayurvedic.main.entity.ArticleType;

public interface ArticleTypeRepository extends JpaRepository<ArticleType, Long> {
    boolean existsByName(String name);
    ArticleType findByName(String name);
}
