package com.scb.pol.resources;

import com.scb.pol.core.Account;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

@Path("/account")
@Produces(MediaType.APPLICATION_JSON)
public class AccountResource {

    @Path("/{accountNumber}")
    @GET
    public Account login(@PathParam("accountNumber") String accountNumber) {
        return new Account(" 123;1,259,353.93;+;1,259,353.93;+;0.00;+;0.00;+;0.00;+;0.00;+;0.00;+;2,883.63;+;27/03/2015;17/09/2014;นางสาว ทดสอบ ทดสอบ;;000;;;1;101;+2,000,000.0");
    }

}
