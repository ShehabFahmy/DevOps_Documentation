## Kubernetes Namespace
- A mechanism for isolating resources into groups within the same kubernetes cluster.
- Names of resources need to be unique within a namespace, but not across namespaces.
- Use namespaces in environments with multiple teams and many users in each team.
### Default Namespaces
1. `default`: the namespace where your resources are created in the beginning if you don't specify any namespace while creating your cluster.
2. `kube-public`
3. `kube-system`
4. `kube-node-lease`
### Commands
- Create a namespaces:
```sh
kubectl create namespace <ns-name>
```
- Show Pods in a specific namespace:
```sh
kubectl get pods --namespace=<ns-name>   # -n
```
- Delete a namespace:
```sh
kubectl delete namespace <ns-name>
```
- Get more information about a namespace:
```sh
kubectl describe namespace <ns-name>
```
- Change the default namespace to a specific namespace:
```sh
kubectl config set-context --current --namespace=<ns-name>
```
---
