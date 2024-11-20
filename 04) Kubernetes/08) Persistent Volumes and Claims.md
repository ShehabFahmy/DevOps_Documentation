## Persistent Volume (PV)
- It is a piece of storage in a cluster that an administrator has provisioned.
- It is a resource in the cluster, just as a node is a cluster resource.
- It is a volume plug-in that has a life cycle independent of any individual pod that uses the persistent volume.
### YAML File
```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-storage
spec:
  storageClassName: ""
  capacity:
    storage: 2Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: "/data/my-pv"
```
### Access Modes
- `ReadWriteOnce (RWO)`: Allows only a single node to access the volume in read-write mode. Furthermore, all pods in that single node can read and write to such volumes.
- `ReadWriteMany (RWX)`: Multiple nodes can read and write to the volume.
- `ReadOnlyMany (ROX)`: The volume will be in a read-only mode and accessible by multiple nodes.
- `ReadWriteOncePod (RWOP)`: Only a single Pod can gain access to the volume.
---
## Persistent Volume Claim (PVC)
- It is a request for storage by a user.
- It is similar to a Pod. Pods consume node resources (CPU and Memory) and PVCs consume PV resources (Storage Size).
### YAML File
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pvc-webserver
spec:
  storageClassName: ""
  volumeName: pv-storage
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 2Gi
```
- `volumeName`: is used for manual binding the PVC with the predefined PV.
After that we link the PVC with the Pod in its manifest file (`Pod.yaml`):
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod-nginx
spec:
  volumes:
  - name: server-storage
    persistentVolumeClaim:
      claimName: pvc-webserver
  containers:
  - name: pv-container
    image: nginx
  ports:
  - containerPort: 80
    name: webserver
  volumeMounts:
  - mountPath: "/path/in/container"
    name: server-storage
```
***NOTE:*** In case you are using Minikube, you will have to use `minikube ssh` command to access the virtual machine and you can find the files of the Pod at the `hostPath` defined in the PV manifest file (`pv.yaml`).

---