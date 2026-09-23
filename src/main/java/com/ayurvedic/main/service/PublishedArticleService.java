package com.ayurvedic.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ayurvedic.main.entity.PublishedArticle;
import com.ayurvedic.main.repository.PublishedArticleRepository;



@Service
public class PublishedArticleService {
@Autowired
    private  PublishedArticleRepository repository;

    public PublishedArticle getById(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Article not found"));
    }
}
