package th.co.scb.polserver;

import com.fasterxml.jackson.annotation.JsonProperty;
import io.dropwizard.Configuration;
import io.dropwizard.client.HttpClientConfiguration;
import th.co.scb.polserver.configuration.EasyNetEndpoints;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

/**
 * Created by bon on 4/8/2015 AD.
 */
public class PolConfiguration extends Configuration {

    @Valid
    @NotNull
    @JsonProperty("httpClient")
    private HttpClientConfiguration httpClient = new HttpClientConfiguration();

    @NotNull
    private String easyNetHost;

    @JsonProperty("httpClient")
    public HttpClientConfiguration getHttpClientConfiguration() {
        return httpClient;
    }

    @JsonProperty("easyNetHost")
    public String getEasyNetHost() {
        return easyNetHost;
    }

    @Valid
    @NotNull
    private EasyNetEndpoints easyNetEndpoints;

    @JsonProperty("easyNetEndpoints")
    public EasyNetEndpoints getEasyNetEndpoints() {
        return easyNetEndpoints;
    }

}
