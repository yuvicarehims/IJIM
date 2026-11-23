package com.ayurvedic.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ayurvedic.main.entity.UrlData;

public interface UrlRepository extends JpaRepository<UrlData, Long>{

}
