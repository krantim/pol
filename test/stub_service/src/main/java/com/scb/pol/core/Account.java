package com.scb.pol.core;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Account {

    private String balanceDetail;

    public Account (){}

    public Account(String balanceDetail) {
        this.balanceDetail = balanceDetail;
    }

    @JsonProperty
    public String getBalanceDetail() {
        return balanceDetail;
    }
}
