package com.ayurvedic.main.repository;

import com.ayurvedic.main.entity.PageContent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface PageContentRepository extends JpaRepository<PageContent, Long> {

    // Find all content for a specific page ordered by display order
    List<PageContent> findByPageNameOrderByDisplayOrderAsc(String pageName);

    // Find all content for a specific page (legacy - for service compatibility)
    List<PageContent> findByPageNameOrderBySectionKeyAsc(String pageName);

    // Find specific section content
    Optional<PageContent> findByPageNameAndSectionKey(String pageName, String sectionKey);

    // Check if content exists
    boolean existsByPageNameAndSectionKey(String pageName, String sectionKey);
}

