## Docker Compose
"microservices". A simple example might be an app with the following seven services:
- Web front-end
- Ordering
- Catalog
- Back-end database
- Logging
- Authentication
- Authorization
**Docker Compose** lets you describe an entire app in a single declarative configuration file, and deploy it with a single command.
- Installing Docker Compose:
```sh
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.29.1/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
```
- Build the App:
```sh
docker-compose up
```
To start the App in the background, use the `-d` flag or `&`:
```sh
docker-compose up -d   # docker-compose up &
```
`docker-compose up` expects the name of the Compose file to be `docker-compose.yml`.
Or use the `-f` flag to specify a different compose file name:
```sh
docker-compose -f new-compose.yml up
```
- Stop and remove all containers in an app:
```sh
docker-compose down
```
- Stop the app without deleting its resources:
```sh
docker-compose stop
```
- Delete a stopped Compose app:
```sh
docker-compose rm
```
- Restart the app:
```sh
docker-compose restart
```