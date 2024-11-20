## Docker Images
- List all images:
```sh
docker images
```
or
```sh
docker image ls
```
- Pull the `ubuntu:latest` image (official image from docker hub):
```sh
docker pull ubuntu:latest
```
- Pull an image from unofficial repository:
```sh
docker image pull <username>/<image>:<tag>
```
- Remove an image:
```sh
docker rmi <image_id>
```
---
## Docker Containers
- List running containers:
```sh
docker ps
```
- List all containers (including stopped ones):
```sh
docker ps -a
```
- Launch a container from an image:
```sh
docker run ubuntu:latest
```
you can also give it a name:
```sh
docker run --name first-container ubuntu
```
or launch it in detached mode (run it in the background):
```sh
docker run -d <container_id/name>
```
- Stop a running container:
```sh
docker stop <container_id/name>
```
- Start a stopped container:
```sh
docker start <container_id/name>
```
- Remove a stopped container:
```sh
docker rm <container_id/name>
```
- Remove a running container:
```sh
docker rm -f <container_id/name>
```
- Show containers logs:
```sh
docker logs <container_id/name>
```
- Enter interactive mode of a running container and use bash shell:
```sh
docker exec -it <container_id/name> bash
```
- Enter running container without any command:
```sh
docker attach <container_id/name>
```
***Note***: `docker attach` works only with the main process of the container. It will not give you an interactive shell if the main process is not interactive.
- Exit a container without terminating it:
	`Ctrl-PQ`
- Show running processes in a container:
```sh
docker top <container_id/name>
```
- Copy file/s from the host to a container:
```sh
docker cp path/in/host container_name:path/in/container
```
---
For more information: https://github.com/ahmedsami76/AraBigData/blob/main/Docker.ipynb