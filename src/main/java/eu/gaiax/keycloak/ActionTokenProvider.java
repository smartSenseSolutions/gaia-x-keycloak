package eu.gaiax.keycloak;

import org.jboss.resteasy.annotations.cache.NoCache;
import org.keycloak.common.util.Time;
import org.keycloak.models.KeycloakContext;
import org.keycloak.models.KeycloakSession;
import org.keycloak.services.managers.AppAuthManager;
import org.keycloak.services.managers.AuthenticationManager;
import org.keycloak.services.resource.RealmResourceProvider;
import org.keycloak.sessions.AuthenticationSessionModel;

import javax.ws.rs.NotAuthorizedException;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriInfo;

public class ActionTokenProvider implements RealmResourceProvider {

    private KeycloakSession session;

    @Context
    UriInfo uriInfo;

    public ActionTokenProvider(KeycloakSession session) {
        this.session = session;
    }

    @Override
    public Object getResource() {
        return this;
    }

    @Override
    public void close() {
        // Nothing to close
    }

    @POST
    @NoCache
    @Produces(MediaType.APPLICATION_JSON)
    @Path("webauthn-actions-token")
    public Response getActionToken(TokenRequest input, @Context UriInfo uriInfo) {

        KeycloakContext context = session.getContext();

        int validityInSecs = context.getRealm().getActionTokenGeneratedByUserLifespan() + 300;
        int absoluteExpirationInSecs = Time.currentTime() + validityInSecs;
        final AuthenticationSessionModel authSession = context.getAuthenticationSession();
        final String clientId = "account";

        // Create a token used to return back to the current authentication flow
        String token = new ApplicationCustomActionToken(
          input.userId(),
          input.email(),
          input.redirectUrl(),
          absoluteExpirationInSecs,
          clientId,
          input.rqac()
        ).serialize(
          session,
          context.getRealm(),
          uriInfo
        );

        System.out.println("Ok" + input.userId());
        return Response.ok(token).build();
    }

    private AuthenticationManager.AuthResult checkAuth() {
        AuthenticationManager.AuthResult authResult = new AppAuthManager.BearerTokenAuthenticator(session).authenticate();
        if (authResult == null) {
            throw new NotAuthorizedException("InvalidToken");
        }
        return authResult;
    }

}