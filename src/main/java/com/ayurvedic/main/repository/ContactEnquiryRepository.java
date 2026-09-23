package com.ayurvedic.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.ayurvedic.main.entity.ContactEnquiry;
import java.util.List;

@Repository
public interface ContactEnquiryRepository extends JpaRepository<ContactEnquiry, Long> {
    
    List<ContactEnquiry> findAllByOrderByCreatedAtDesc();
    
    List<ContactEnquiry> findByIsReadFalseOrderByCreatedAtDesc();
    
    long countByIsReadFalse();
}

