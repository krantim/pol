package com.scb.pol.core;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

public class User {
    public User() {
        // Jackson deserialization
    }

    public User(String userId, List<Account> accounts) {
        this.userId = userId;
        this.accounts = accounts;
    }

    public String userId;

    public List<Account> accounts;

    @JsonProperty
    public String getUserId() {
        return userId;
    }

    @JsonProperty
    public List<Account> getAccounts() {
        return accounts;
    }
}
