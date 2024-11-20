## Problem 1
1. Run the container hello-world:
```sh
docker run hello-world
```
2. Check the container status:
```sh
docker ps -a   # Exited
```
3. Start the stopped container:
```sh
docker start <container_id/name>
```
4. Remove the container:
```sh
docker rm <container_id/name>
```
5. Remove the image:
```sh
docker rmi hello-world
```
---
## Problem 2
1. Run container `centos` or `ubuntu` in an interactive mode:
```sh
docker run -it ubuntu   # Pulls and Starts latest version/tag
```
2. Run the following command in the container `echo docker`:
```sh
echo docker
```
-> `docker`
3. Open a bash shell in the container and touch a file named hello-docker:
```sh
bash
touch hello-docker
```
4. Stop the container and remove it. Write your comment about the file hello-docker:
```sh
^PQ
docker stop <container_id/name>
docker rm <container_id/name>
```
Since there is no Volume Mapping/Mounting, any data will be erased after removing that container.

---
## Problem 3
1. Run a container `nginx` with name `nginx` and attach a volume to the container (volume for containing static html file):
```sh
docker run -d -p 8000:80 -v ~/Desktop/my-nginx:/usr/share/nginx/html --name nginx nginx:latest
```
2. Remove the container:
```sh
docker rm -f nginx
```
3. Run a new container with the following:
	- Attach the volume that was attached to the previous container
	- Map port 80 to port 9898 on your host machine
	- Access the html files from your browser
```sh
docker run -d -p 9898:80 -v ~/Desktop/my-nginx:/usr/share/nginx/html --name new-nginx nginx:latest
```
---
## Problem 4
1. Run the image `nginx` again without attaching any volumes:
```sh
docker run -d -p 8000:80 --name nginx nginx
```
2. Add html static files to the container and make sure they are accessible:
```sh
docker exec -it nginx /bin/bash
	cd /usr/share/nginx/html
	rm index.html
docker cp ~/Desktop/my-nginx/. nginx:/usr/share/nginx/html
```
3. Commit the container with image name `my-nginx`:
```sh
docker commit nginx my-nginx
```
4. Create a `Dockerfile` for `nginx` and build the image from this `Dockerfile`:
```Dockerfile
FROM nginx:latest

WORKDIR /usr/share/nginx/html

RUN rm index.html

COPY . .

EXPOSE 80

# ENTRYPOINT ["nginx", "-g", "daemon off;"]
```
```sh
docker build -t my-nginx-dokfile .
```
---
## Problem 5
1. Create a volume called `mysql_data`:
```sh
mkdir mysql-example
```
2. Deploy a MySQL database called `app-database`:
	- Use the `mysql` latest image.
	- Use the `-e` flag to set `MYSQL_ROOT_PASSWORD` to `P4sSw0rd0!`.
	- Mount the `mysql_data` volume to `/var/lib/mysql`.
	- The container should run in the background.
```sh
docker run -d --name my-sql -e MYSQL_ROOT_PASSWORD=P4sSw0rd0! -p 3306:3306 -v ~/Desktop/mysql-example:/var/lib/mysql mysql:latest
```
Now, you can connect to the database from the MySQL Workbench IDE.