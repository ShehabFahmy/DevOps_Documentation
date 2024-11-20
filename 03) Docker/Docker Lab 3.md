## Problem 1
- Create your own `nginx` docker image based on `ubuntu` (NEVER USE `FROM nginx`).
- Install `nginx`
- index.html one as file
- Expose
- Start
- Port mapping
```Dockerfile
FROM ubuntu:latest

WORKDIR /usr/share/nginx/html

RUN apt update
RUN apt install nginx -y

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]
```
```sh
docker build -t nginx-scratch .
docker run -d -p 8000:80 --name nginx nginx-scratch
```
---
## Problem 2
- Create `react` app docker container (using `Dockerfile`).
```Dockerfile

```
---
## Problem 3
Create flask app to count number of visits to browser:
1. Create new directory called `flask` then add `app.py` and `requirements.txt` files.
2. Create `Dockerfile` for the python app
3. Create `docker-compose` for the app and use `Redis` as temp DB.
- `app.py`:
```python
from flask import Flask
import redis

app = Flask(__name__)
cache = redis.Redis(host='redis', port=6379)

@app.route('/')
def hello():
    count = cache.incr('hits')
    return f'Hello! This page has been visited {count} times.'

if __name__ == '__main__':
    app.run()
```
- `Dockerfile`:
```Dockerfile
FROM python:latest

WORKDIR /usr/src/app

COPY . .

RUN pip install -r requirements.txt

EXPOSE 5000

ENV FLASK_APP=app.py

CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
```
### Solution 1: Flask-app Container Linked with Redis Container
```sh
docker build -t flask-app .
docker run -d --name redis -p 6379:6379 redis
docker run -d --name flask -p 5000:5000 --link redis:redis flask-app
```
#### Testing Connectivity to Redis inside Flask Container
```sh
docker exec -it flask /bin/bash
apt-get update
apt-get install redis-tools
redis-cli -h redis -p 6379 ping   # You should get 'PONG'
```
### Solution 2: Docker-Compose
- `docker-compose.yml`:
```yaml
version: '1'
services:
  web:
    build: .
    ports:
      - "5000:5000"
    depends_on:
      - redis
    networks:
      - flask-app-network
  redis:
    image: "redis:latest"
    networks:
      - flask-app-network
networks:
  flask-app-network:
```
```sh
docker compose up &
```