package eu.gaiax.keycloak;

import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.core.UriInfo;
import org.jboss.resteasy.annotations.cache.NoCache;
import org.keycloak.common.util.Time;
import org.keycloak.models.KeycloakContext;
import org.keycloak.models.KeycloakSession;
import org.keycloak.services.resource.RealmResourceProvider;
import org.keycloak.sessions.AuthenticationSessionModel;

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

        int validityInSecs = context.getRealm().getActionTokenGeneratedByUserLifespan() + input.getLifespan();
        int absoluteExpirationInSecs = Time.currentTime() + validityInSecs;
        final AuthenticationSessionModel authSession = context.getAuthenticationSession();
        final String clientId = "account";

        // Create a token used to return back to the current authentication flow
        String token = new ApplicationCustomActionToken(
          input.getUserId(),
          input.getEmail(),
          input.getRedirectUri(),
          absoluteExpirationInSecs,
          clientId,
          input.getRqac()
        ).serialize(
          session,
          context.getRealm(),
          uriInfo
        );

        return Response.ok(new TokenResponse(token)).build();
    }
}