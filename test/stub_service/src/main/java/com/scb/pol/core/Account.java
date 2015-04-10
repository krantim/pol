package com.scb.pol.core;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Account {

    public AccountType type;
    public String name;
    public long number;
    public AccountStatus status;

    public Account(){
        // Jackson deserialization
    }

    public Account(String name, long number, AccountStatus status, AccountType type) {
        this.name = name;
        this.number = number;
        this.status = status;                 //In real life, status comes from another service call.
        this.type = type;
    }

    @JsonProperty
    public String getName() {
        return name;
    }

    @JsonProperty
    public long getNumber() {
        return number;
    }

    @JsonProperty
    public AccountStatus getStatus() {
        return status;
    }

    @JsonProperty
    public AccountType getType() {
        return type;
    }
}
