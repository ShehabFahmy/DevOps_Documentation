```
kubectl <command> <type> <name>
```
### Command:
- Specifies the operation that you want to perform on one or more resources.
- `create`, `run`, `get`, `describe` and `delete`
### Type:
- Specifies the resource type.
- Resource types are case-insensitive.
### Name:
- Specifies the name of the resource.
- Names are case-sensitive.
---
## Kubectl Commands
- Start a new Pod:
```sh
kubectl run <pod-name> --image=<image-name>
```
- List all supported resource types:
```sh
kubectl api-resources
```
- Show commands manual:
```sh
kubectl --help   # kubectl -h
```
- Get more information about a given command:
```sh
kubectl <command> --help
```
- Show Pods in the default namespace:
```sh
kubectl get pods
```
- Show Pods in more detail:
```sh
kubectl get pods -o wide
```
- Show Pods in the YAML or JSON format:
```sh
kubectl get pods -o yaml   # json
```
- Show Pods in all namespaces:
```sh
kubectl get pods --all-namespaces   # -A
```
- Show Nodes:
```sh
kubectl get nodes
```
- Run a YAML file:
```sh
kubectl apply -f <resource>.yaml
```
- Get the documentation for any resource type:
```sh
kubectl explain <resource-type>
```
- Get inside a pod and use `bash`:
```sh
kubectl exec -it <pod-name> -- /bin/bash
```
- Edit a running pod:
```sh
kubectl edit pod <pod-name>
```
- Delete a Pod:
```sh
kubectl delete po <pod-name>
```
- Delete all Pods:
```sh
kubectl delete po --all
```
- Add a label to running Pod:
```sh
kubectl label pod <pod-name> xLabel=xValue
```
- Delete a label from a running Pod:
```sh
kubectl label pod <pod-name> xLabel-
```