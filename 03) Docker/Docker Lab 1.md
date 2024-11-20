1. How do you run a Node.js application using Docker, using the official Node.js image?
```sh
docker run node
```
2. What command would you use to mount a local directory into a Node.js Docker container?
```sh
docker run -v /path/on/host:/path/in/container node
```
3. What is the command to copy files from your local machine into a running Python Docker container and vice versa?
```sh
docker cp path/in/host container_name:path/in/container
```
4. How can you execute a Python script inside a running Docker container?
```sh

```
5. How do you start a Nginx Docker container and expose it on port 80?
```sh
docker run -p 80:80 nginx:alpine
```
6. What command can you use to inspect the Nginx container's logs?
```sh
docker logs nginx_container
```
7. How can you list all Docker images on your system?
```sh
docker images   # docker image ls
```
8. What is the purpose of the docker `ps` command, and how can you see all containers, including stopped ones?
	To list the running containers only, while `docker ps -a` shows all containers.
9. How can you stop a running Docker container gracefully?
```sh
docker stop <container_id/name>
```
10. What command would you use to remove all stopped containers from your system?
```sh
docker container prune
```
This command will prompt you for confirmation before removing the stopped containers. If you want to remove them without a confirmation prompt, you can add the `-f` flag.
or
```sh
docker rm $(docker ps -a -f status=exited -q)
```
`-q`: for containers IDs
11. How can you view detailed information about a Docker image, including its layers?
```sh
docker image inspect <image>
```
12. What is the difference between a Docker image and a Docker container, and how do you create a container from an image?
Docker Image is the template from which we can create many containers.
```sh
docker run <image>
```