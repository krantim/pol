package th.co.scb.polserver.easynet;

import com.fasterxml.jackson.annotation.JsonProperty;

public class EasyNetAccount {
    private String balanceDetail;

    public EasyNetAccount() {

    }

    public EasyNetAccount(String balanceDetail) {
        this.balanceDetail = balanceDetail;
    }

    @JsonProperty
    public String getBalanceDetail() {
        return balanceDetail;
    }
}
