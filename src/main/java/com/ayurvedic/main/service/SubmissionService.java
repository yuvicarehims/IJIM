package com.ayurvedic.main.service;


import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ayurvedic.main.entity.PublishedArticle;
import com.ayurvedic.main.entity.Submission;
import com.ayurvedic.main.entity.Submission.Status;
import com.ayurvedic.main.entity.User;
import com.ayurvedic.main.repository.SubmissionRepository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;


@Service
public class SubmissionService {

	@Autowired
	private SubmissionRepository submissionRepository;
	
	@PersistenceContext
	private EntityManager entityManager;
	
	@Autowired
	private org.springframework.jdbc.core.JdbcTemplate jdbcTemplate;

	public List<Submission> getUserSubmissions(User author) {
		return submissionRepository.findByAuthorOrderBySubmittedAtDesc(author);
	}

	public List<Submission> getAllSubmissions() {
		// Sort by ID in descending order (newest first: ..., 3, 2, 1) at database level
		return submissionRepository.findAllByOrderByIdDesc();
	}


	// ✅ NEW: Get published submissions for current issues page (only UNDER_PUBLISHED)
	public List<Submission> getPublishedSubmissions() {
		try {
			// Try with Enum first - only get UNDER_PUBLISHED articles
			return submissionRepository.findByStatusOrderByUpdatedAtDesc(Submission.Status.UNDER_PUBLISHED);
		} catch (Exception e) {
			// Fallback: get all and filter - only UNDER_PUBLISHED
			return submissionRepository.findAll().stream()
					.filter(sub -> sub.getStatus() != null && "UNDER_PUBLISHED".equals(sub.getStatus().name()))
					.sorted((s1, s2) -> s2.getUpdatedAt().compareTo(s1.getUpdatedAt()))
					.collect(Collectors.toList());
		}
	}

	// ✅ NEW: Get published submissions for current quarter (articles from specific Volume/Issue)
	public List<Submission> getPublishedSubmissionsForCurrentQuarter() {
		// Use the same logic as display info to ensure consistency
		java.util.Map<String, Object> info = getCurrentQuarterInfo();
		int displayIssue = (int) info.get("displayIssue");
		int displayVolumeNum = (int) info.get("displayVolume");
		
		String targetVolume = "Volume " + displayVolumeNum;
		String targetIssue = "Issue " + displayIssue;
		String targetIssueAlt = "Issue " + String.format("%02d", displayIssue); // handles "Issue 01", "Issue 04" etc.
		
		// Filter articles by UNDER_PUBLISHED status AND matching Volume/Issue
		return submissionRepository.findByStatusOrderByUpdatedAtDesc(Submission.Status.UNDER_PUBLISHED).stream()
				.filter(sub -> {
					String vol = sub.getVolume();
					String iss = sub.getIssue();
					
					if (vol == null || iss == null) return false;
					
					boolean volumeMatch = vol.trim().equalsIgnoreCase(targetVolume);
					boolean issueMatch = iss.trim().equalsIgnoreCase(targetIssue) || iss.trim().equalsIgnoreCase(targetIssueAlt);
					
					return volumeMatch && issueMatch;
				})
				.sorted((s1, s2) -> {
					// Sort by publication date DESC
					if (s1.getPublicationDate() == null || s2.getPublicationDate() == null) {
						return s2.getUpdatedAt().compareTo(s1.getUpdatedAt());
					}
					return s2.getPublicationDate().compareTo(s1.getPublicationDate());
				})
				.collect(Collectors.toList());
	}
	
	// ✅ NEW: Get current quarter information for display
	public java.util.Map<String, Object> getCurrentQuarterInfo() {
		java.time.LocalDate now = java.time.LocalDate.now();
		int currentYear = now.getYear();
		int currentMonth = now.getMonthValue();
		
		// Determine current quarter
		int currentQuarter;
		String quarterRange;
		if (currentMonth >= 1 && currentMonth <= 2) {
			currentQuarter = 1;
			quarterRange = "January - February";
		} else if (currentMonth >= 3 && currentMonth <= 4) {
			currentQuarter = 2;
			quarterRange = "March - April";
		} else if (currentMonth >= 5 && currentMonth <= 6) {
			currentQuarter = 3;
			quarterRange = "May - June";
		} else if (currentMonth >= 7 && currentMonth <= 8) {
			currentQuarter = 4;
			quarterRange = "July - August";
		} else if (currentMonth >= 9 && currentMonth <= 10) {
			currentQuarter = 5;
			quarterRange = "September - October";
		} else {
			currentQuarter = 6;
			quarterRange = "November - December";
		}
		
		// Calculate display year and issue (previous quarter)
		int displayYear;
		int displayIssue;
		
		if (currentQuarter == 1) {
			// Q1 shows Q4 of previous year
			displayYear = currentYear - 1;
			displayIssue = 4;
		} else {
			// Q2 shows Q1, Q3 shows Q2, Q4 shows Q3
			displayYear = currentYear;
			displayIssue = currentQuarter - 1;
		}
		
		// Calculate volume: Volume = displayYear - 2021
		//int displayVolume = displayYear - 2025;
		
		
		

		// Current volume (1–6)
		/* int currentVolume = (currentMonth - 1) / 2 + 1; */

		// Previous 2-month volume
	
		/*int displayVolume;

		if (currentVolume == 1) {
		    displayVolume = 6;
		    displayYear = currentYear - 1;
		} else {
		    displayVolume = currentVolume - 1;
		    displayYear = currentYear;
		}*/
		
		
		int startYear = 2026;

		int displayVolume = currentYear - startYear + 1;
		 displayYear = currentYear;

		
		java.util.Map<String, Object> info = new java.util.HashMap<>();
		info.put("quarter", currentQuarter);
		info.put("quarterRange", quarterRange);
		info.put("year", currentYear);
		info.put("displayYear", displayYear);
		info.put("displayIssue", displayIssue);
		info.put("displayVolume", displayVolume);
		info.put("displayText", quarterRange + " " + currentYear + " | Volume " + displayVolume + ", Issue " + displayIssue);
		
		return info;
	}

	public List<Submission> getSubmissionsByStatus(String status) {
		return submissionRepository.findByStatusOrderBySubmittedAtDesc(status);
	}

	public Optional<Submission> getSubmissionById(Long id) {
		return submissionRepository.findById(id);
	}

	// NEW EDIT FUNCTIONALITY METHODS
	public Submission updateSubmissionContent(Long id, String editedContent, String adminNotes, String editedBy) {
		Optional<Submission> submissionOpt = submissionRepository.findById(id);
		if (submissionOpt.isPresent()) {
			Submission submission = submissionOpt.get();

			submission.setEditedContent(editedContent);
			submission.setAdminNotes(adminNotes);
			submission.setEditedBy(editedBy);

			// 🔥 FIX: use ZonedDateTime (UTC)
			submission.setEditedAt(ZonedDateTime.now(ZoneOffset.UTC));
			submission.setUpdatedAt(ZonedDateTime.now(ZoneOffset.UTC));

			return submissionRepository.save(submission);
		}
		return null;
	}

	public Optional<Submission> getSubmissionWithContent(Long id) {
		return submissionRepository.findById(id);
	}

	public SubmissionRepository getSubmissionRepository() {
		return submissionRepository;
	}

	public void setSubmissionRepository(SubmissionRepository submissionRepository) {
		this.submissionRepository = submissionRepository;
	}

	// Delete submission
	@Transactional
	public void deleteSubmission(Long id) {
		submissionRepository.deleteById(id);
	}

	@Transactional
	public Submission saveSubmission(Submission submission) {
		return submissionRepository.saveAndFlush(submission);
	}

	// ✅ NEW: Update submission status
	@Transactional
	public void updateSubmissionStatus(Long id, Status status) {
		submissionRepository.findById(id).ifPresent(submission -> {

			submission.setStatus(status);

			// 🔥 FIX: update time should also be ZonedDateTime
			submission.setUpdatedAt(ZonedDateTime.now(ZoneOffset.UTC));

			submissionRepository.save(submission);
		});
	}
	/* ============================================================
    ISSUE DETAILS PAGE (Archive → Issue Redirection)
    ============================================================ */

	/**
	 * Fetch UNDER_PUBLISHED submissions by YEAR, VOLUME, ISSUE.
	 * Matching your repository method:
	 *
	 * findByStatusAndVolumeAndIssueAndPublicationDateYear(
	 *      Status status, String volume, String issue, int year
	 * )
	 */
	public List<Submission> findByYearVolumeIssue(int year, String volume, String issue) {

		return submissionRepository
				.findByStatusAndVolumeAndIssueAndFlexibleYear(
						Status.UNDER_PUBLISHED,   // only UNDER_PUBLISHED (shows in archives)
						volume,             // stored as "Volume 4"
						issue,              // stored as "Issue 01"
						year                // stored as integer
						);
	}
	
	public List<String> getDistinctArticleTypes() {
	    return submissionRepository.findDistinctArticleTypes();
	}
 
	public List<String> getDistinctVolumes() {
	    return submissionRepository.findDistinctVolumes();
	}
 
	public List<String> getDistinctIssues() {
	    return submissionRepository.findDistinctIssues();
	}
	
	// ✅ NEW: Ensure status column is large enough (called separately to avoid transaction issues)
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public void ensureStatusColumnSize() {
		try {
			System.out.println("🔧 Attempting to ensure status column is VARCHAR(50)...");
			jdbcTemplate.execute("ALTER TABLE submissions MODIFY COLUMN status VARCHAR(50)");
			System.out.println("✅ Status column is now VARCHAR(50)");
		} catch (Exception e) {
			// Column might already be correct size, or ALTER might have failed
			System.out.println("⚠️ Status column size check: " + e.getClass().getSimpleName() + " - " + e.getMessage());
			System.out.println("⚠️ If you see 'Data truncated' errors, please run this SQL manually:");
			System.out.println("⚠️ ALTER TABLE submissions MODIFY COLUMN status VARCHAR(50);");
		}
	}
	
	// ✅ NEW: Update only status field using JdbcTemplate to completely bypass JPA
	@Transactional(propagation = Propagation.REQUIRES_NEW, isolation = Isolation.READ_COMMITTED)
	public int updateStatusOnly(Long id, Status status, java.time.ZonedDateTime updatedAt) {
		System.out.println("🔄 updateStatusOnly: Starting update for ID: " + id + ", Status: " + status);
		
		try {
			// Ensure column size first (in separate transaction)
			ensureStatusColumnSize();
			
			// Convert ZonedDateTime to Timestamp for MySQL
			java.sql.Timestamp timestamp = java.sql.Timestamp.from(updatedAt.toInstant());
			System.out.println("📅 Converted timestamp: " + timestamp);
			
			// Use JdbcTemplate to completely bypass JPA/Hibernate
			// This ensures ONLY status and updated_at are updated
			String sql = "UPDATE submissions SET status = ?, updated_at = ? WHERE id = ?";
			System.out.println("💾 Executing SQL: " + sql + " with status=" + status.name() + " (length=" + status.name().length() + "), id=" + id);
			
			int result = jdbcTemplate.update(sql, status.name(), timestamp, id);
			
			System.out.println("✅ updateStatusOnly: Successfully updated " + result + " row(s) for submission ID: " + id + " to " + status);
			return result;
		} catch (org.springframework.dao.DataIntegrityViolationException e) {
			System.out.println("❌ DataIntegrityViolationException: " + e.getMessage());
			e.printStackTrace();
			throw new RuntimeException("Database constraint violation: " + e.getMessage(), e);
		} catch (jakarta.persistence.PersistenceException e) {
			System.out.println("❌ PersistenceException: " + e.getMessage());
			e.printStackTrace();
			throw new RuntimeException("Persistence error: " + e.getMessage(), e);
		} catch (Exception e) {
			System.out.println("❌ Error in updateStatusOnly: " + e.getMessage());
			System.out.println("❌ Error class: " + e.getClass().getName());
			e.printStackTrace();
			throw new RuntimeException("Failed to update status: " + e.getMessage(), e);
		}
	}
	
	
	public Submission getById(Long id) {
        return submissionRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Submission not found"));
    }

}
