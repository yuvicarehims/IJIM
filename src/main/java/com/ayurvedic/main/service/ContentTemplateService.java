package com.ayurvedic.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ayurvedic.main.entity.ContentTemplate;
import com.ayurvedic.main.repository.ContentTemplateRepository;

@Service
public class ContentTemplateService {
	
	@Autowired
	private ContentTemplateRepository contentTemplateRepository;

	public List<ContentTemplate> getTemplateContent(String page) {
	
		
		return contentTemplateRepository.findAll();
	}

}
