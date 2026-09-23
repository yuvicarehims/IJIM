package com.ayurvedic.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import java.util.stream.Collectors;

import com.ayurvedic.main.entity.ArticleType;
import com.ayurvedic.main.entity.Issue;
import com.ayurvedic.main.entity.Volume;
import com.ayurvedic.main.repository.ArticleTypeRepository;
import com.ayurvedic.main.repository.IssueRepository;
import com.ayurvedic.main.repository.VolumeRepository;

@Service
public class MasterDataService {

    @Autowired private ArticleTypeRepository articleTypeRepo;
    @Autowired private VolumeRepository volumeRepo;
    @Autowired private IssueRepository issueRepo;
    
    // ====================================================================
    // ⬇️ Public Getters (Changed to return List<String> for Controller compatibility)
    // ====================================================================

    // Article Types
    public List<String> getAllArticleTypes() {
        return articleTypeRepo.findAll().stream()
                .map(ArticleType::getName) // Map entity to just the name string
                .collect(Collectors.toList());
    }

    // Volumes
    public List<String> getAllVolumes() {
        return volumeRepo.findAll().stream()
                .map(Volume::getName) // Map entity to just the name string
                .collect(Collectors.toList());
    }

    // Issues
    public List<String> getAllIssues() {
        return issueRepo.findAll().stream()
                .map(Issue::getName) // Map entity to just the name string
                .collect(Collectors.toList());
    }
    
    // ====================================================================
    // 💾 Private Adders (Your original methods, used internally)
    // ====================================================================

    @Transactional
    private void addArticleType(String name) {
        // Ensure name is not null/empty and cleaned
        String cleanName = name.trim();
        if (!cleanName.isEmpty() && !articleTypeRepo.existsByName(cleanName)) {
            ArticleType at = new ArticleType();
            at.setName(cleanName);
            articleTypeRepo.save(at);
        }
    }

    @Transactional
    private void addVolume(String name) {
        String cleanName = name.trim();
        if (!cleanName.isEmpty() && !volumeRepo.existsByName(cleanName)) {
            Volume vol = new Volume();
            vol.setName(cleanName);
            volumeRepo.save(vol);
        }
    }

    @Transactional
    private void addIssue(String name) {
        String cleanName = name.trim();
        if (!cleanName.isEmpty() && !issueRepo.existsByName(cleanName)) {
            Issue i = new Issue();
            i.setName(cleanName);
            issueRepo.save(i);
        }
    }
    
    // ====================================================================
    // ✅ NEW: Centralized Save Method (as requested)
    // ====================================================================

    /**
     * Saves a new master data option (Article Type, Volume, or Issue) 
     * based on the provided type string.
     * * @param type The category ("articleType", "volume", or "issue").
     * @param value The actual value to save (e.g., "Review Article", "Volume 5").
     * @return true if saving was successful or the value already exists, false otherwise.
     */
    public boolean saveOptionToDatabase(String type, String value) {
        if (value == null || value.trim().isEmpty()) {
            System.err.println("❌ Master data save failed: Value is empty.");
            return false;
        }

        // Normalize type input for dispatching
        String normalizedType = type != null ? type.toLowerCase().trim() : "";
        String cleanValue = value.trim();

        try {
            switch (normalizedType) {
                case "articletype":
                    addArticleType(cleanValue);
                    break;
                case "volume":
                    addVolume(cleanValue);
                    break;
                case "issue":
                    addIssue(cleanValue);
                    break;
                default:
                    System.err.println("❌ Master data save failed: Unknown type '" + type + "'.");
                    return false;
            }
            return true;
        } catch (Exception e) {
            System.err.println("❌ Error saving master data (" + type + " / " + value + "): " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

}