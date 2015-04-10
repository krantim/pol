package th.co.scb.polserver.easynet;

import com.fasterxml.jackson.annotation.JsonProperty;

public class EasyNetUser {

    private String userId;
    private String account;
    private String accountType;

    public EasyNetUser() {

    }

    public EasyNetUser(String userId, String account, String accountType) {
        this.userId = userId;
        this.account = account;
        this.accountType = accountType;
    }

    @JsonProperty
    public String getUserId() {
        return userId;
    }

    @JsonProperty
    public String getAccount() {
        return account;
    }

    @JsonProperty
    public String getAccountType() {
        return accountType;
    }
}
