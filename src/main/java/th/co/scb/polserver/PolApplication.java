package th.co.scb.polserver;

import io.dropwizard.Application;
import io.dropwizard.setup.Environment;
import th.co.scb.polserver.resources.AccountResources;
import th.co.scb.polserver.resources.RootResources;

/**
 * Created by bon on 4/8/2015 AD.
 */
public class PolApplication extends Application<PolConfiguration> {
    @Override
    public void run(PolConfiguration configuration, Environment environment) throws Exception {
        final RootResources resources = new RootResources();
        final AccountResources accountResources = new AccountResources();

        environment.jersey().register(resources);
        environment.jersey().register(accountResources);
    }

    public static void main(String[] args) throws Exception {
        new PolApplication().run(args);
    }
}
