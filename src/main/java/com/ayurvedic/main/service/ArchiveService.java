package com.ayurvedic.main.service;

import com.ayurvedic.main.entity.Submission;

import com.ayurvedic.main.repository.SubmissionRepository;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import java.time.LocalDate;

import java.util.*;

import java.util.stream.Collectors;

@Service

public class ArchiveService {

    @Autowired

    private SubmissionRepository submissionRepository;

    /**
     * 
     * Builds a nested structure:
     * 
     * Map<Year, Map<Volume, Map<Issue, List<Submission>>>>
     * 
     * Years sorted DESC, volumes & issues ASC.
     * 
     */

    public Map<Integer, Map<String, Map<String, List<Submission>>>> getArchiveData() {

        // Get all UNDER_PUBLISHED submissions (only these show in archives)

        List<Submission> published = submissionRepository

                .findByStatusOrderByUpdatedAtDesc(Submission.Status.UNDER_PUBLISHED);

        Map<Integer, Map<String, Map<String, List<Submission>>>> archive = new TreeMap<>(Comparator.reverseOrder());

        for (Submission s : published) {

            LocalDate pubDate = s.getPublicationDate();

            if (pubDate == null)
                continue; // skip incomplete data

            if (s.getVolume() == null)
                continue;

            if (s.getIssue() == null)
                continue;

            int year = pubDate.getYear();

            String volume = s.getVolume();

            String issue = s.getIssue();
            
            // If Issue 4 is published in Jan/Feb/March, show it in the previous year
            if (issue != null) {
                String i = issue.trim();
                if ((i.equalsIgnoreCase("Issue 4") || i.equalsIgnoreCase("Issue 04")) 
                        && pubDate.getMonthValue() <= 3) {
                    year = year - 1;
                }
            }

            archive

                    .computeIfAbsent(year, y -> new TreeMap<>(Comparator.naturalOrder())) // volumes sorted ASC

                    .computeIfAbsent(volume, v -> new TreeMap<>(Comparator.naturalOrder())) // issues sorted ASC

                    .computeIfAbsent(issue, i -> new ArrayList<>())

                    .add(s);

        }

        // Optional: sort articles by title inside each issue

        for (Map<String, Map<String, List<Submission>>> volumeMap : archive.values()) {

            for (Map<String, List<Submission>> issueMap : volumeMap.values()) {

                for (Map.Entry<String, List<Submission>> entry : issueMap.entrySet()) {

                    List<Submission> list = entry.getValue();

                    list.sort(Comparator.comparing(Submission::getTitle, String.CASE_INSENSITIVE_ORDER));

                }

            }

        }

        return archive;

    }

}
