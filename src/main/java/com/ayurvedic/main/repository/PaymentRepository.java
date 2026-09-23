package com.ayurvedic.main.repository;

import com.ayurvedic.main.entity.Payment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface PaymentRepository extends JpaRepository<Payment, Long> {
    
    Optional<Payment> findByRazorpayOrderId(String razorpayOrderId);
    
    Optional<Payment> findByRazorpayPaymentId(String razorpayPaymentId);
    
    List<Payment> findByAuthorEmailOrderByCreatedAtDesc(String authorEmail);
    
    List<Payment> findByStatusOrderByCreatedAtDesc(String status);
    
    List<Payment> findByAuthorEmailAndStatusOrderByCreatedAtDesc(String authorEmail, String status);
}