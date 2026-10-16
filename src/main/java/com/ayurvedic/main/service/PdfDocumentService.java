package com.ayurvedic.main.service;


	
	
	
	import java.util.List;

import org.springframework.stereotype.Service;

import com.ayurvedic.main.entity.PdfDocument;
import com.ayurvedic.main.repository.PdfDocumentRepository;

	@Service
	public class PdfDocumentService {

	    private final PdfDocumentRepository repository;

	    public PdfDocumentService(PdfDocumentRepository repository) {
	        this.repository = repository;
	    }

	    // Saari PDFs fetch karne ke liye
	    public List<PdfDocument> getAllPdfs() {
	        return repository.findAll();
	    }

	    // ID se PDF record fetch karne ke liye
	    public PdfDocument getPdfById(Long id) {
	        return repository.findById(id)
	                .orElseThrow(() ->
	                    new RuntimeException("PDF not found with ID: " + id));
	    }
	}


