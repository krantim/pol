package com.scb.pol;

import io.dropwizard.Application;
import io.dropwizard.setup.Bootstrap;
import io.dropwizard.setup.Environment;

public class StubService extends Application<StubConfiguration> {


    public static void main(String[] args) throws Exception {
        new StubService().run(args);
    }

    @Override
    public void initialize(Bootstrap bootstrap) {

    }

    @Override
    public void run(StubConfiguration configuration, Environment environment) throws Exception {

    }
}
