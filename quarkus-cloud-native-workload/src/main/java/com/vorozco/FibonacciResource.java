package com.vorozco;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.QueryParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import java.util.ArrayList;
import java.util.List;

@Path("/fibonacci")
public class FibonacciResource {
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<Long> getFibonacci(@QueryParam("fibo") Integer fibo) {
        int iterations = (fibo != null && fibo > 0) ? fibo : 5;
        List<Long> sequence = new ArrayList<>();
        for (int i = 0; i < iterations; i++) {
            sequence.add(fibonacci(i));
        }
        return sequence;
    }

    private long fibonacci(int n) {
        if (n <= 1) return n;
        return fibonacci(n - 1) + fibonacci(n - 2);
    }
}
