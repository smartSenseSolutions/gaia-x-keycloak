package eu.gaiax.keycloak;

import java.util.List;

public record TokenRequest(String userId, String email, List<String> rqac, String redirectUrl) {
}
