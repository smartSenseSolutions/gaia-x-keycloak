package eu.gaiax.keycloak;

import com.fasterxml.jackson.annotation.JsonProperty;
import org.keycloak.authentication.actiontoken.DefaultActionToken;

import java.util.ArrayList;
import java.util.List;

public class ApplicationCustomActionToken extends DefaultActionToken {

    public static final String TOKEN_TYPE = "execute-actions";

    private static final String JSON_FIELD_REQUIRED_ACTIONS = "rqac";
    private static final String JSON_FIELD_REDIRECT_URL = "reduri";

    @JsonProperty(value = JSON_FIELD_REQUIRED_ACTIONS)
    private List<String> rqac;

    @JsonProperty(value = JSON_FIELD_EMAIL)
    private String email;

    @JsonProperty(value = JSON_FIELD_REDIRECT_URL)
    private String redirectUrl;

    public ApplicationCustomActionToken(String userId, String email, String redirectUrl, int absoluteExpirationInSecs, String authenticationSessionId, List<String> rqac) {
        super(userId, TOKEN_TYPE, absoluteExpirationInSecs, null, authenticationSessionId);
        this.rqac = new ArrayList<>(rqac);
        this.email = email;
        this.redirectUrl = redirectUrl;
    }

    private ApplicationCustomActionToken() {
    }

    public List<String> getRqac() {
        return rqac;
    }

    public void setRqac(List<String> rqac) {
        this.rqac = rqac;
    }

    @Override
    public String getEmail() {
        return email;
    }

    @Override
    public void setEmail(String email) {
        this.email = email;
    }

    public String getRedirectUrl() {
        return redirectUrl;
    }

    public void setRedirectUrl(String redirectUrl) {
        this.redirectUrl = redirectUrl;
    }
}
