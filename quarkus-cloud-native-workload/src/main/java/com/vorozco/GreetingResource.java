package com.vorozco;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;

@Path("/")
public class GreetingResource {

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String hello() {
        String result = doSpotBugsDemo();
        return "Hello from Quarkus REST";
    }

    private String doSpotBugsDemo(){
        String result = "SpotBugs demo";
        return "SpotBugs demo";
    }
}
