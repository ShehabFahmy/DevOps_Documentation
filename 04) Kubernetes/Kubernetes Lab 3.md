1. Create a deployment called `my-first-deployment` of image `nginx:alpine` in the `default` namespace. 
```sh
kubectl create deploy my-first-deployment --image=nginx:alpine
```
2. Check to make sure the deployment is healthy.
```sh
kubectl get deploy my-first-deployment
```
3. Scale `my-first-deployment` up to run 3 replicas.
```sh
kubectl scale deploy my-first-deployment --replicas=3
```
4. Check to make sure all 3 replicas are ready.
```sh
kubectl get deploy my-first-deployment
```
5. Scale `my-first-deployment` down to run 2 replicas.
```sh
kubectl scale deploy my-first-deployment --replicas=2
```
6. Change the image `my-first-deployment` runs from `nginx:alpine` to `httpd:alpine`.
```sh
kubectl set image deploy/my-first-deployment nginx=httpd:alpine
```
or change it from the YAML file:
- you can undo the last command:
```sh
kubectl rollout undo deploy my-first-deployment
```
- access the YAML file and type your desired image:
```sh
kubectl edit deploy my-first-deployment
```
7. Delete the deployment `my-first-deployment`.
```sh
kubectl delete deploy my-first-deployment
```
---
8. Create deployment from the below YAML:
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: frontend-deployment
  namespace: default
spec:
  replicas: 4
  selector:
    matchLabels:
      name: busybox-pod
  strategy:
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
    type: RollingUpdate
  template:
    metadata:
      labels:
        name: busybox-pod
    spec:
      containers:
      - command:
        - sh
        - -c
        - echo Hello Kubernetes! && sleep 3600
        image: busybox888
        imagePullPolicy: Always
        name: busybox-container
```
9. How many ReplicaSets exist on the system now?
-> 1
10. How many Pods exist on the system now?
-> 4
11. Out of all the existing Pods, how many are ready?
-> 0
12. What is the image used to create the pods in the new deployment?
-> `busybox888`
13. Why do you think the deployment is not ready?
-> `Failed to pull image "busybox888": Error response from daemon: pull access denied for busybox888, repository does not exist or may require 'docker login': denied: requested access to the resource is denied`
---