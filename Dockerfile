FROM quay.io/keycloak/keycloak:22.0.0
COPY ./themes/gaiax/ /opt/keycloak/themes/gaiax/
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start"]
EXPOSE 8080


# to run this in local
# docker build -t keycloak .
# docker run -p 8080:8080 --env KEYCLOAK_ADMIN_PASSWORD=admin --env KEYCLOAK_ADMIN=admin --env KEYCLOAK_NAME=localhost keycloak
# docker logs -f local_keycloak
