## Kubernetes Deployment
One of the Kubernetes objects that is used to manage Pods via ReplicaSets in a Declarative way.
- A Deployment is a higher abstraction that manages one or more ReplicaSets.
- Features:
	- Scaling up and down of the application (same as ReplicaSet).
	- Roll out (Update) of the application (V1 to V2).
	- Rollback of the application (V2 to V1).
	- No downtime when deploying the newer version of the application.
	- Different strategies of deployment.
### Commands
- Create a new Deployment:
```sh
kubectl create deployment <deploy-name> --image=nginx --replicas=3
```
- List all Deployments:
```sh
kubectl get deployment
```
- Get more information about a Deployment:
```sh
kubectl describe deployment <deploy-name>
```
- Delete a Deployment:
```sh
kubectl delete deployment <deploy-name>
```
---
## YAML File
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: dolfined
spec:
  replicas: 3
  selector:
    matchLabels:
      env: prod
  template:
    metadata:
    labels:
      env: prod
    spec:
      containers:
      - name: nginx
        image: nginx
        ports:
          - containerPort: 80
```
---