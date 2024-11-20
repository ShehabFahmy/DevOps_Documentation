## Imperative: using a command
Example: Start a new Pod in a specific namespace:
```sh
kubectl run <pod-name> --image=<image-name> -n <namespace-name>
```
## Declarative: using a YAML file
- Consists of:
	- `apiVersion`:
		- `v1`: Pod, Service and Namespace
		- `apps/v1`: Deployment and ReplicaSet
		- `networking.k8s.io/v1`: Ingress
		- `storage.k8s.io/v1`: StorageClass
	- `kind`
	- `metadata`
	- `spec`
- Example: `Pod.yaml`
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
  - name: nginx
    image: nginx
    ports:
    - containerPort: 80
```
`matchLabels` must be the same as `labels`, to tell the ReplicaSet which Pods it manages.
`template` is the `Pod.yaml` starting from `metadata`.
- ==To create a YAML template== for a Deployment using `kubectl`:
```sh
kubectl create deploy <deploy-name> --image=nginx --replicas=3 --dry-run=client -o yaml
```
`--dry-run=client` tells `kubectl` not to create a new instance.

---