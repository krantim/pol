package th.co.scb.polserver.core;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * Created by bon on 4/8/2015 AD.
 */
public class Account {
    public double balance;
    private String accountNumber;

    public Account() {

    }

    public Account(String accountNumber, double balance) {
        this.accountNumber = accountNumber;
        this.balance = balance;
    }

    @JsonProperty
    public String getAccountNumber() {
        return accountNumber;
    }

    @JsonProperty
    public double getBalance() {
        return balance;
    }
}
