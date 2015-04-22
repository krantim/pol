package th.co.scb.polserver.health;

import com.codahale.metrics.health.HealthCheck;

public class PolHealthCheck extends HealthCheck {

    @Override
    protected Result check() throws Exception {
        return Result.healthy();
    }
}
