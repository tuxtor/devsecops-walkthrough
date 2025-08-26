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
        String saludo = doSpotBugsDemo();
        return "Hello from Quarkus REST";
    }

    private String doSpotBugsDemo(){
        String saludo2 = "Saludo 2";
        return "SpotBugs demo";
    }
}
