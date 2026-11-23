package com.ayurvedic.main.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ayurvedic.main.entity.PdfDocument;

public interface PdfDocumentRepository extends JpaRepository<PdfDocument, Long>{
	
	List<PdfDocument> findByVolume(String volume);

	List<PdfDocument> findByVolumeAndIssue(String volume, String issue);

	@Query("SELECT DISTINCT p.issue FROM PdfDocument p WHERE p.volume = :volume AND p.issue IS NOT NULL ORDER BY p.issue")
	List<String> findDistinctIssuesByVolume(@Param("volume") String volume);

}
