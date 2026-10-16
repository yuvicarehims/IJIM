package com.ayurvedic.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ayurvedic.main.entity.PdfDocument;

public interface PdfDocumentRepository extends JpaRepository<PdfDocument, Long>{

}
