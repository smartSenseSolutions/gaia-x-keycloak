FROM quay.io/keycloak/keycloak:22.0.0
ADD build/libs/gaia-x-keycloak-1.0-SNAPSHOT.jar /opt/keycloak/providers/
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]
EXPOSE 8080


# to run this in local
# docker run -p 8080:8080 --env KEYCLOAK_ADMIN_PASSWORD=admin --env KEYCLOAK_ADMIN=admin keycloak
