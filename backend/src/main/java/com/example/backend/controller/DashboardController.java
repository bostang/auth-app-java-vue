package com.example.backend.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

// import org.springframework.beans.factory.annotation.Value; // untuk mengambil nilai dari application.properties

@RestController
@CrossOrigin(origins = "${app.frontend.url}") // Use the frontend URL from application.properties
@RequestMapping("/api/dashboard")
public class DashboardController {

    @GetMapping
    @PreAuthorize("isAuthenticated()") // Ensures user is authenticated
    public ResponseEntity<Map<String, String>> getDashboardData(Principal principal) {
        Map<String, String> data = new HashMap<>();
        data.put("message", "Welcome to your protected dashboard, " + principal.getName() + "!");
        data.put("data", "This is sensitive information.");
        return ResponseEntity.ok(data);
    }
}