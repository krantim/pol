package com.scb.pol.resources;

import com.scb.pol.core.Account;
import com.scb.pol.core.AccountStatus;
import com.scb.pol.core.AccountType;
import com.scb.pol.core.User;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import java.util.Arrays;

@Path("/login")
@Produces(MediaType.APPLICATION_JSON)
public class UserResource {

    @GET
    public User login(@QueryParam("username") String userName) {
        Account[] accounts = new Account[]{
                new Account("active account", 123, AccountStatus.ACTIVE, AccountType.SAVINGS),
                new Account("frozen account", 234, AccountStatus.FROZEN, AccountType.SAVINGS),
                new Account("dormant account", 345, AccountStatus.DORMANT, AccountType.SAVINGS),
                new Account("closed account", 456, AccountStatus.CLOSED, AccountType.SAVINGS),
                new Account("credit card account", 567, AccountStatus.ACTIVE, AccountType.CREDIT_CARD)
        };

        return new User(userName, Arrays.asList(accounts));
    }

}
