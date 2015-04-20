package com.scb.pol.core;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

public class User {
    public User() {
        // Jackson deserialization
    }

    public User(String userId, String accounts, String accountType) {
        this.userId = userId;
        this.accounts = accounts;
        this.accountType = accountType;
    }

    private String userId;
    private String accounts;
    private String accountType;

    @JsonProperty
    public String getUserId() {
        return userId;
    }

    @JsonProperty
    public String getAccounts() {
        return accounts;
    }

    @JsonProperty
    public String getAccountType() {
        return accountType;
    }
}
