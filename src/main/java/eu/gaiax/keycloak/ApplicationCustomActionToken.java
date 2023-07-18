package eu.gaiax.keycloak;

import com.fasterxml.jackson.annotation.JsonProperty;
import org.keycloak.authentication.actiontoken.DefaultActionToken;

import java.util.ArrayList;
import java.util.List;

public class ApplicationCustomActionToken extends DefaultActionToken {

    public static final String TOKEN_TYPE = "execute-actions";

    public static final String JSON_FIELD_REQUIRED_ACTIONS = "rqac";

    public static final String JSON_FIELD_REDIRECT_URL = "reduri";

    @JsonProperty(value = JSON_FIELD_REQUIRED_ACTIONS)
    private List<String> rqac;

    @JsonProperty(value = JSON_FIELD_REDIRECT_URL)
    private String redirectUrl;

    public ApplicationCustomActionToken(String userId, String email, String redirectUrl, int absoluteExpirationInSecs, String authenticationSessionId, List<String> rqac) {
        super(userId, TOKEN_TYPE, absoluteExpirationInSecs, null, authenticationSessionId);
        this.rqac = new ArrayList<>(rqac);
        super.setEmail(email);
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

    public String getRedirectUrl() {
        return redirectUrl;
    }

    public void setRedirectUrl(String redirectUrl) {
        this.redirectUrl = redirectUrl;
    }
}
