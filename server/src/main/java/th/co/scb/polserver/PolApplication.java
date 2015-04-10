package th.co.scb.polserver;

import io.dropwizard.Application;
import io.dropwizard.client.HttpClientBuilder;
import io.dropwizard.setup.Environment;
import org.apache.http.client.HttpClient;
import th.co.scb.polserver.client.POLClient;
import th.co.scb.polserver.resources.AccountResources;
import th.co.scb.polserver.resources.RootResources;

import javax.security.auth.login.Configuration;

/**
 * Created by bon on 4/8/2015 AD.
 */
public class PolApplication extends Application<PolConfiguration> {
    @Override
    public void run(PolConfiguration configuration, Environment environment) throws Exception {
        POLClient client = registerPOLClient(configuration, environment);

        final RootResources resources = new RootResources();
        final AccountResources accountResources = new AccountResources(client);

        environment.jersey().register(resources);
        environment.jersey().register(accountResources);


    }

    private POLClient registerPOLClient(PolConfiguration configuration, Environment environment) {
        final HttpClient httpClient = new HttpClientBuilder(environment).using(configuration.getHttpClientConfiguration())
                .build("httpClient");
        POLClient client = new POLClient(httpClient);
        environment.jersey().register(client);
        return client;
    }

    public static void main(String[] args) throws Exception {
        new PolApplication().run(args);
    }
}
