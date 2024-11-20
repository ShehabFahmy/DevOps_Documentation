## Kubernetes Replication
We need a controller to watch the Pod status:
- This is done by the `ReplicaSets` or `Replication Controller`.
- If the Pod fails, the controller has to create a new Pod as a replacement.
- If a new replacement Pod is created, the user will not lose access to the application.
- There are also StatefulSets (used for databases) and DaemonSets.
### Commands
- Show ReplicaSets:
```sh
kubectl get rs
```
- Get more information about a ReplicaSet:
```sh
kubectl describe rs <rs-name>
```
- Scale a ReplicaSet to 5:
```sh
kubectl scale rs <rs-name> --replicas=5
```
- Delete a ReplicaSet:
```sh
kubectl delete rs <rs-name>
```
---
## YAML File
```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      env: prod
  template:
    metadata:
      name: dolfined
      labels:
        env: prod
    spec:
      containers:
      - name: nginx
        image: nginx
```
---