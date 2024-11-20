## Container Interaction with its Host
### Port Mapping
Allows you to access a container's network services from your host machine. When you run a container, you can specify which ports on the host machine should be forwarded to which ports in the container.
```sh
docker run -p <host_port>:<container_port> <image>
```
#### Web Server Example
1. `docker run -d --name webserver -p 80:80 nginx:latest`
2. open browser [http://localhost:80](http://localhost:80)
3. stop the container
4. open browser again and refresh
5. start the container
6. open browser again and refresh
---
### Volume Mapping
Allows you to share files between your host machine and a Docker container. This is useful for persisting data or sharing configurations and code.
```sh
docker run -v <host_path>:<container_path> <image>
```
##### Port Mapping, Volume Mapping, and Environment Variable
- Container for **nginx** web server:
```sh
docker run -d --name nginx-container -p 80:80 -v /path/to/nginx/config:/etc/nginx -v /path/to/nginx/html:/usr/share/nginx/html -e MY_ENV_VARIABLE=my_value -e ANOTHER_ENV_VARIABLE=another_value nginx:alpine
```