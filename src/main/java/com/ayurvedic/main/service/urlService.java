package com.ayurvedic.main.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ayurvedic.main.entity.UrlData;
import com.ayurvedic.main.repository.UrlRepository;


@Service
public class urlService {
	
	@Autowired
	private UrlRepository urlRepository;

	public Optional<UrlData> getUrlData() {
		// TODO Auto-generated method stub
		 return urlRepository.findById(1L);
	}

}
