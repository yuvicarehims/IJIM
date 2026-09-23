package com.ayurvedic.main.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ayurvedic.main.entity.TemplateData;

@Repository
public interface TemplateDataRepository extends JpaRepository<TemplateData, Long>{
	
	Optional<TemplateData> findByTemplateId(Long id);
	  boolean existsByTemplate_Id(Long templateId);
	  Optional<TemplateData> findByTemplate_Id(Long id);
}
