package com.example.demo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String username;
    private String email;
    private String password;
	
    public User() {}

    public User(String name, String username, String email, String password) {
	this.name = name;
        this.username = username;
        this.email = email;
        this.password = password;
    }

    // getters and setters
}

