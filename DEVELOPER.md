# Gaia-X Keycloak App

## Development

### Run in Local

```bash
docker-compose up
```

### CSS Changes
  Go to themes/gaiax/login/resources/styles/ directory via terminal and use below command for the convert scss to css file. We have to add code in .scss file do not touch .css file

  ```bash
node-sass styles.scss styles.css --watch
```