package th.co.scb.polserver.core;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * Created by bon on 4/8/2015 AD.
 */
public class Account {
    public double balance;
    private String number;

    public Account() {

    }

    public Account(String number, double balance) {
        this.number = number;
        this.balance = balance;
    }

    @JsonProperty
    public String getNumber() {
        return number;
    }

    @JsonProperty
    public double getBalance() {
        return balance;
    }
}
