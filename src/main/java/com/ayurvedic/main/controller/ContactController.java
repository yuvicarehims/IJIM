package com.ayurvedic.main.controller;

import java.time.ZonedDateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ayurvedic.main.entity.ContactEnquiry;
import com.ayurvedic.main.repository.ContactEnquiryRepository;
import com.ayurvedic.main.service.EmailService;

@Controller
public class ContactController {

    @Autowired
    private EmailService emailService;
    
    @Autowired
    private ContactEnquiryRepository contactEnquiryRepository;

    @RequestMapping(value = "/contactCreate", method = RequestMethod.POST)
    public String handleContactForm(
            @RequestParam("form_name") String name,
            @RequestParam("form_email") String email,
            @RequestParam("form_phone") String phone,
            @RequestParam(value = "form_subject", required = false) String subject,
            @RequestParam("form_message") String message) {

        System.out.println("📧 Contact form submitted:");
        System.out.println("Name: " + name);
        System.out.println("Email: " + email);
        System.out.println("Phone: " + phone);
        System.out.println("Subject: " + subject);
        System.out.println("Message: " + message);

        try {
            // Set default subject if empty
            if (subject == null || subject.trim().isEmpty()) {
                subject = "Contact Form Submission from " + name;
            }
            
            // Save contact enquiry to database
            ContactEnquiry enquiry = new ContactEnquiry();
            enquiry.setName(name);
            enquiry.setEmail(email);
            enquiry.setPhone(phone);
            enquiry.setSubject(subject);
            enquiry.setMessage(message);
            enquiry.setCreatedAt(ZonedDateTime.now());
            enquiry.setIsRead(false);
            
            contactEnquiryRepository.save(enquiry);
            System.out.println("✅ Contact enquiry saved to database");
            
            // Send email notification to admin
            emailService.sendContactNotificationToAdmin(name, email, phone, subject, message);
            
            System.out.println("✅ Contact form processed successfully!");
            return "redirect:/contact?success=true";
            
        } catch (Exception e) {
            System.out.println("❌ Error processing contact form: " + e.getMessage());
            e.printStackTrace();
            return "redirect:/contact?error=true";
        }
    }
}