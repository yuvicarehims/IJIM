package com.ayurvedic.main.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ayurvedic.main.entity.ContentTemplate;
import com.ayurvedic.main.entity.TemplateData;
import com.ayurvedic.main.repository.TemplateDataRepository;

@Service
public class TemplateDataService {
	
	@Autowired
	private TemplateDataRepository templateDataRepository;

	public TemplateData saveContent(TemplateData model) {
		// TODO Auto-generated method stub
		return templateDataRepository.save(model);
	}

	public Optional<TemplateData> gettempdata(Long id) {
		Optional<TemplateData> byId = templateDataRepository.findByTemplateId(id);
		return byId;
	}

	public TemplateData gettempdata11(long l) {
		Optional<TemplateData> byId = templateDataRepository.findByTemplateId(l);
		return byId.get();
	}

	public boolean templateidPresent(ContentTemplate contentTemplate) {
	System.out.println("cjkfhjfn"+contentTemplate.getId());
		return templateDataRepository.existsByTemplate_Id(contentTemplate.getId());
	}

	public TemplateData updateContent(TemplateData temp) {

		Optional<TemplateData> optionalData = templateDataRepository.findByTemplate_Id(temp.getTemplate().getId());

		 if(optionalData.isPresent()) {

		        TemplateData existing = optionalData.get();

		        existing.setContentArea(temp.getContentArea());

		        return templateDataRepository.save(existing);
		    }
		 return null;
	}

}
