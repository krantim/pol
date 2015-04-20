package th.co.scb.polserver.configuration;

import com.fasterxml.jackson.annotation.JsonProperty;

public class EasyNetEndpoints {
    private String accountUrl;

    public EasyNetEndpoints() {
        /* Needed for Jackson library */
    }

    public EasyNetEndpoints(String accountUrl) {
        this.accountUrl = accountUrl;
    }

    @JsonProperty
    public String getAccountUrl() {
        return accountUrl;
    }
}
