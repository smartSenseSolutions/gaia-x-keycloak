package eu.gaiax.keycloak;

import java.util.List;

public class TokenRequest{
    private String userId;
    private String email;
    private List<String> rqac;
    private  String redirectUri;
    private Integer lifespan;

    public TokenRequest() {
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public List<String> getRqac() {
        return rqac;
    }

    public void setRqac(List<String> rqac) {
        this.rqac = rqac;
    }

    public String getRedirectUri() {
        return redirectUri;
    }

    public void setRedirectUri(String redirectUri) {
        this.redirectUri = redirectUri;
    }

    public Integer getLifespan() {
        return lifespan;
    }

    public void setLifespan(Integer lifespan) {
        this.lifespan = lifespan;
    }
}
  

