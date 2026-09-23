package com.ayurvedic.main.controller;
 
import java.util.List;
import java.util.Map;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
 
import com.ayurvedic.main.entity.Submission;
import com.ayurvedic.main.service.ArchiveService;
import com.ayurvedic.main.service.SubmissionService;
 
@Controller
public class ArchiveController {
 
    @Autowired
    private ArchiveService archiveService;
 
    @Autowired
    private SubmissionService submissionService;
 
 
    /**
     * ARCHIVES PAGE
     * Shows: Years → Volume → Issues (accordion)
     */
    
    @RequestMapping(value = "/archives", method = RequestMethod.GET)
    public String showArchive(Model model) {
 
        // Map<Integer, Map<String, Map<String, List<Submission>>>>
        Map<Integer, Map<String, Map<String, List<Submission>>>> archiveData =
                archiveService.getArchiveData();
 
        model.addAttribute("archiveData", archiveData);
 
        return "archive";   // archive.jsp
    }
 
 
 
    /**
     * ISSUE DETAILS PAGE
     * URL example:
     *  /archives/issue?year=2025&volume=Volume 4&issue=Issue 01
     */
    
    @RequestMapping(value = "/archives/issue", method = RequestMethod.GET)
    public String viewIssueDetails(
            @RequestParam int year,
            @RequestParam String volume,
            @RequestParam String issue,
            Model model) {
 
        // Fetch all PUBLISHED submissions for this specific Issue
        List<Submission> articles =
                submissionService.findByYearVolumeIssue(year, volume, issue);
 
        model.addAttribute("year", year);
        model.addAttribute("volume", volume);
        model.addAttribute("issue", issue);
        model.addAttribute("publishedArticles", articles);
 
        return "issue-details";   // issue-details.jsp
    }
 
}