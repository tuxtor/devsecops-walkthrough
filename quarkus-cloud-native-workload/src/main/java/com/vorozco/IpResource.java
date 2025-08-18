package com.vorozco;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;

import java.net.InetAddress;
import java.net.UnknownHostException;

@Path("/ip")
@Produces(MediaType.TEXT_PLAIN)
public class IpResource {
    @GET
    public String getIp() {
        try {
            return InetAddress.getLocalHost().getHostAddress();
        } catch (UnknownHostException e) {
            return "Unknown";
        }
    }
}
