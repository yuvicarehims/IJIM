package com.ayurvedic.main.controller;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ayurvedic.main.entity.User;
import com.ayurvedic.main.repository.UserRepository;

@Controller
public class AdminRegistrationController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @RequestMapping(value = "/admin/register", method = RequestMethod.GET)
    public String showAdminRegistrationForm() {
        return "admin-register";
    }
    @RequestMapping(value = "/admin/register", method = RequestMethod.POST)
    public String registerAdmin(
            @RequestParam String email,
            @RequestParam String password,
            @RequestParam String fullName,
            @RequestParam String mobileNumber,
            Model model) {

        try {
            // Check if user already exists
            if (userRepository.findByEmail(email) != null) {
                model.addAttribute("error", "Admin with this email already exists!");
                return "admin-login";
            }

            // Create new admin user
            User admin = new User();
            admin.setEmail(email);
            admin.setPassword(passwordEncoder.encode(password)); // Proper BCrypt encoding
            admin.setFullName(fullName);
            admin.setRole("ADMIN");
            admin.setMobileNumber(mobileNumber);
            admin.setInstituteName(null); // Removed from form
            admin.setAddress(null); // Removed from form
            admin.setCreatedAt(LocalDateTime.now());

            userRepository.save(admin);

            model.addAttribute("success", "Admin user created successfully! You can now login.");
            return "admin-login";

        } catch (Exception e) {
            model.addAttribute("error", "Error creating admin user: " + e.getMessage());
            return "admin-login";
        }
    }
}