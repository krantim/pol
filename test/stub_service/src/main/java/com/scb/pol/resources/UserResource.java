package com.scb.pol.resources;

import com.scb.pol.core.User;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

@Path("/login")
@Produces(MediaType.APPLICATION_JSON)
public class UserResource {

    @GET
    public User login(@QueryParam("username") String userName) {
        return new User(userName, "123", "2"); //user with one account that is a savings account
    }

}
