package com.vorozco;

import io.quarkus.test.junit.QuarkusTest;
import org.junit.jupiter.api.Test;

import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.matchesPattern;
import static org.hamcrest.Matchers.anyOf;
import static org.hamcrest.Matchers.is;

@QuarkusTest
public class IpResourceTest {
    @Test
    public void testServerIpEndpoint() {
        // Regex for IPv4 and IPv6
        String ipv4Pattern = "^([0-9]{1,3}\\.){3}[0-9]{1,3}$";
        String ipv6Pattern = "^([0-9a-fA-F]{0,4}:){2,7}[0-9a-fA-F]{0,4}$";
        given()
            .when().get("/ip")
            .then()
            .statusCode(200)
            .body(anyOf(
                matchesPattern(ipv4Pattern),
                matchesPattern(ipv6Pattern),
                is("Unknown")
            ));
    }
}
