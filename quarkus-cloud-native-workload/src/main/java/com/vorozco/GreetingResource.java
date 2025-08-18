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

        String doubleBug = doSpotBugsDemo();
        return "Hello from Quarkus REST";

    }

    private String doSpotBugsDemo(){
        // SpotBugs: DLS_DEAD_LOCAL_STORE - The value assigned to 'result' is never read
        // Removed dead assignment to 'result'
        return "SpotBugs demo";
    }
}
