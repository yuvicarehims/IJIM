package com.ayurvedic.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.ayurvedic.main.entity.Issue;

public interface IssueRepository extends JpaRepository<Issue, Long> {
    boolean existsByName(String name);
    Issue findByName(String name);
}
