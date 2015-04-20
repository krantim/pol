package com.scb.pol.resources;

import com.scb.pol.core.Account;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

@Path("/account")
@Produces(MediaType.APPLICATION_JSON)
public class AccountResource {

    @GET
    public Account[] login(@QueryParam("accountId") String accountId) {
        return new Account[]{
                new Account(" 123;1,259,353.93;+;1,259,353.93;+;0.00;+;0.00;+;0.00;+;0.00;+;0.00;+;2,883.63;+;27/03/2015;17/09/2014;นางสาว ทดสอบ ทดสอบ;;000;;;1;101;+2,000,000.0")
        };
    }

}
