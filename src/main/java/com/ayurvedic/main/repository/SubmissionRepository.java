package com.ayurvedic.main.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ayurvedic.main.entity.Submission;
import com.ayurvedic.main.entity.User;

@Repository  // ADD THIS
public interface SubmissionRepository extends JpaRepository<Submission, Long> {
    List<Submission> findByAuthorOrderBySubmittedAtDesc(User author);
    List<Submission> findByStatusOrderBySubmittedAtDesc(String status);
    List<Submission> findAllByOrderBySubmittedAtDesc();
    
    @Query("SELECT s FROM Submission s ORDER BY s.id ASC")
    List<Submission> findAllByOrderByIdAsc();
    
    @Query("SELECT s FROM Submission s ORDER BY s.id DESC")
    List<Submission> findAllByOrderByIdDesc();
 // In SubmissionRepository.java
    List<Submission> findByStatusOrderByUpdatedAtDesc(Submission.Status status);
    
 // ==========================================
    // ✔ ARCHIVE QUERIES (ADD THESE)
    // ==========================================
 
    @Query("SELECT DISTINCT YEAR(s.publicationDate) FROM Submission s WHERE s.status = 'PUBLISHED' ORDER BY YEAR(s.publicationDate) DESC")
    List<Integer> findDistinctYears();
 
    @Query("SELECT DISTINCT s.volume FROM Submission s WHERE YEAR(s.publicationDate) = :year AND s.status = 'PUBLISHED'")
    List<String> findVolumesByYear(int year);
 
    @Query("SELECT DISTINCT s.issue FROM Submission s WHERE YEAR(s.publicationDate) = :year AND s.volume = :volume AND s.status = 'PUBLISHED'")
    List<String> findIssuesByYearVolume(int year, String volume);
 
    @Query("SELECT s FROM Submission s WHERE YEAR(s.publicationDate) = :year AND s.volume = :volume AND s.issue = :issue AND s.status = 'PUBLISHED'")
    List<Submission> findArticles(int year, String volume, String issue);
    @Query("SELECT s FROM Submission s " +
	       "WHERE s.status = :status " +
	       "AND s.volume = :volume " +
	       "AND s.issue = :issue " +
	       "AND (" +
	       "    YEAR(s.publicationDate) = :year " +
	       "    OR (YEAR(s.publicationDate) = :year + 1 AND MONTH(s.publicationDate) <= 3)" +
	       ") " +
	       "ORDER BY s.id DESC")
	List<Submission> findByStatusAndVolumeAndIssueAndFlexibleYear(
	        @Param("status") Submission.Status status,
	        @Param("volume") String volume,
	        @Param("issue") String issue,
	        @Param("year") int year);

    @Query("SELECT s FROM Submission s " +
	       "WHERE s.status = :status " +
	       "AND s.volume = :volume " +
	       "AND s.issue = :issue " +
	       "AND YEAR(s.publicationDate) = :year " +
	       "ORDER BY s.id DESC")
	List<Submission> findByStatusAndVolumeAndIssueAndPublicationDateYear(
    	        @Param("status") Submission.Status status,
    	        @Param("volume") String volume,
    	        @Param("issue") String issue,
    	        @Param("year") int year);
    
     //Distinct dropdown values from existing submissions
    	    @Query("SELECT DISTINCT s.articleType FROM Submission s WHERE s.articleType IS NOT NULL AND s.articleType <> ''")
    	    List<String> findDistinctArticleTypes();
    	 
    	    @Query("SELECT DISTINCT s.volume FROM Submission s WHERE s.volume IS NOT NULL AND s.volume <> ''")
    	    List<String> findDistinctVolumes();
    	 
    	    @Query("SELECT DISTINCT s.issue FROM Submission s WHERE s.issue IS NOT NULL AND s.issue <> ''")
    	    List<String> findDistinctIssues();
    	
    	// ✅ NEW: Update only status field to avoid constraint issues - using native SQL
    	@Modifying(clearAutomatically = true, flushAutomatically = true)
    	@Query(value = "UPDATE submissions SET status = :status, updated_at = :updatedAt WHERE id = :id", nativeQuery = true)
    	int updateStatusById(@Param("id") Long id, @Param("status") String status, @Param("updatedAt") java.time.ZonedDateTime updatedAt);
    	
    	// ✅ NEW: Update article type in all submissions
    	@Modifying(clearAutomatically = true, flushAutomatically = true)
    	@Transactional
    	@Query("UPDATE Submission s SET s.articleType = :newValue WHERE s.articleType = :oldValue")
    	int updateArticleType(@Param("oldValue") String oldValue, @Param("newValue") String newValue);
    	
    	// ✅ NEW: Update volume in all submissions
    	@Modifying(clearAutomatically = true, flushAutomatically = true)
    	@Transactional
    	@Query("UPDATE Submission s SET s.volume = :newValue WHERE s.volume = :oldValue")
    	int updateVolume(@Param("oldValue") String oldValue, @Param("newValue") String newValue);
    	
    	// ✅ NEW: Update issue in all submissions
    	@Modifying(clearAutomatically = true, flushAutomatically = true)
    	@Transactional
    	@Query("UPDATE Submission s SET s.issue = :newValue WHERE s.issue = :oldValue")
    	int updateIssue(@Param("oldValue") String oldValue, @Param("newValue") String newValue);
    	
    	// ✅ NEW: Count submissions by author
    	long countByAuthor(User author);
    	
    	// ✅ NEW: Count submissions by article type
    	long countByArticleType(String articleType);
    	
    	// ✅ NEW: Count submissions by volume
    	long countByVolume(String volume);
    	
    	// ✅ NEW: Count submissions by issue
    	long countByIssue(String issue);

}