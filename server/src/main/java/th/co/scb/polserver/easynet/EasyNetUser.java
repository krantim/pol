package th.co.scb.polserver.easynet;

import com.fasterxml.jackson.annotation.JsonProperty;

public class EasyNetUser {

    private String userId;
    private String accounts;
    private String accountType;

    public EasyNetUser() {

    }

    public EasyNetUser(String userId, String accounts, String accountType) {
        this.userId = userId;
        this.accounts = accounts;
        this.accountType = accountType;
    }

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
