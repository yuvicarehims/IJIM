package com.ayurvedic.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ayurvedic.main.entity.ContentTemplate;

@Repository
public interface ContentTemplateRepository extends JpaRepository<ContentTemplate, Long>{

}
