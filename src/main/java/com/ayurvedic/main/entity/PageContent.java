package com.ayurvedic.main.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "page_content")
public class PageContent {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "page_name", nullable = false, length = 50)
    private String pageName;  // "home", "about"

    @Column(name = "section_key", nullable = false, length = 100)
    private String sectionKey;  // "hero_title", "hero_description", "about_content"

    @Column(name = "section_label", length = 200)
    private String sectionLabel;  // Human readable label for admin: "Hero Title", "About Section"

    @Column(name = "content", columnDefinition = "TEXT")
    private String content;  // The actual editable content

    @Column(name = "image_path", length = 500)
    private String imagePath;  // Path to uploaded image file

    @Column(name = "display_order")
    private Integer displayOrder = 0;  // Order to display in admin panel

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    @PrePersist
    @PreUpdate
    public void updateTimestamp() {
        this.updatedAt = LocalDateTime.now();
    }

    // Constructors
    public PageContent() {}

    public PageContent(String pageName, String sectionKey, String sectionLabel, String content) {
        this.pageName = pageName;
        this.sectionKey = sectionKey;
        this.sectionLabel = sectionLabel;
        this.content = content;
        this.displayOrder = 0;
    }

    public PageContent(String pageName, String sectionKey, String sectionLabel, String content, Integer displayOrder) {
        this.pageName = pageName;
        this.sectionKey = sectionKey;
        this.sectionLabel = sectionLabel;
        this.content = content;
        this.displayOrder = displayOrder;
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPageName() {
        return pageName;
    }

    public void setPageName(String pageName) {
        this.pageName = pageName;
    }

    public String getSectionKey() {
        return sectionKey;
    }

    public void setSectionKey(String sectionKey) {
        this.sectionKey = sectionKey;
    }

    public String getSectionLabel() {
        return sectionLabel;
    }

    public void setSectionLabel(String sectionLabel) {
        this.sectionLabel = sectionLabel;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Integer getDisplayOrder() {
        return displayOrder;
    }

    public void setDisplayOrder(Integer displayOrder) {
        this.displayOrder = displayOrder;
    }
}

