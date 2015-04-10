package th.co.scb.polserver;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * Created by bon on 4/9/2015 AD.
 */
public class StubObject {

    public String value;

    public StubObject(){}

    public StubObject(String value) {
        this.value = value;
    }

    @JsonProperty
    public String getValue() {
        return value;
    }
}
