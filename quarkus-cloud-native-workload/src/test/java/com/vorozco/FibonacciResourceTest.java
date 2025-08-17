package com.vorozco;

import io.quarkus.test.junit.QuarkusTest;
import org.junit.jupiter.api.Test;

import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.*;

@QuarkusTest
public class FibonacciResourceTest {

    @Test
    public void testFibonacciEndpointFibo2() {
        given()
            .queryParam("fibo", 2)
            .when().get("/fibonacci")
            .then()
            .statusCode(200)
            .body("size()", is(2))
            .body("[0]", is(0))
            .body("[1]", is(1));
    }
}

