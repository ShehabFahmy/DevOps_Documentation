## Kubernetes Service
An abstract way to expose an application, running on a set of Pods, as a network service to other applications or to the external world.
- Aims to solve connectivity issues.
- Services have fixed IP addresses (this solves the changing IP address of a Pod when it fails or when creating a new one).
### Service Types
1. `ClusterIP`: Default Service in Kubernetes, if no Service type was specified. Used for internal networking between your workloads (communication within the cluster not outside).
2. `NodePort`: For external networking.
3. `LoadBalancer`
### Commands
- Create a Service (`ClusterIP` by default) for a Deployment:
```sh
kubectl expose deployment <deploy-name> --port=5000 --target-port=80
```
- Create a Service of type `NodePort`:
```sh
kubectl expose deployment <deploy-name> --type=NodePort --port=2000 --target-port=80 --name=<svc-name>
```
- List the Services:
```sh
kubectl get svc
```
- Get more information about a Service:
```sh
kubectl describe svc <svc-name>
```
- Delete a Service:
```sh
kubectl delete svc <svc-name>
```
### How Services Work
1. Creating a Deployment of a ReplicaSet that contains 2 Pods with port = 80:
```sh
kubectl create deployment xDeploy --image=nginx --replicas=2 --port=80
```
2. Create a Service (`ClusterIP` by default) for the created Deployment:
```sh
kubectl expose deployment xDeploy --port=2000 --target-port=80
```
Now, a static IP address with port = 2000 is created for the Service from which we can access the application, and each Pod has an `End Point` (IP address and port of the Pod) where the Service can communicate with.
- List End Points
```sh
kubectl get ep
```
---
## YAML File
- `ClusterIP`:
```yaml
apiVersion: v1
kind: Service
metadata:
  name: dolfined-svc
spec:
  type: ClusterIP
  selector:
    env: prod
  ports:
    - port: 5000
      targetPort: 80
```
- `NodePort` (`nodePort` must be between 30000 and 32767):
```yaml
apiVersion: v1
kind: Service
metadata:
  name: dolfined-svc
spec:
  type: NodePort
  selector:
    env: prod
  ports:
    - port: 5000
      targetPort: 80
      nodePort: 30000
```
---