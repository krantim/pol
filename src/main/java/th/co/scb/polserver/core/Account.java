package th.co.scb.polserver.core;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * Created by bon on 4/8/2015 AD.
 */
public class Account {
    private String name;
    private String accountType;
    private String accountNumber;

    public Account() {

    }

    public Account(String name, String accountType, String accountNumber) {
        this.name = name;
        this.accountType = accountType;
        this.accountNumber = accountNumber;
    }

    @JsonProperty
    public String getName() {
        return name;
    }

    @JsonProperty
    public String getAccountType() {
        return accountType;
    }

    @JsonProperty
    public String getAccountNumber() {
        return accountNumber;
    }
}
