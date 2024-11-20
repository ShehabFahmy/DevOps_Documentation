## Persistent Volumes and Claims (PV & PVC)
1. Create a Pod from the below YAML file:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: webapp
spec:
  containers:
  - env:
    - name: LOG_HANDLERS
      value: file
    image: kodekloud/event-simulator
    imagePullPolicy: Always
    name: event-simulator
```

2. Configure a volume to store these logs at `/var/log/webapp` on the host.
Use the spec provided below:
- `Name: webapp`
- `Image Name: kodekloud/event-simulator`
- `Volume HostPath: /var/log/webapp`
- `Volume Mount: /log`
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: webapp
spec:
  volumes:
  - name: log-volume
    hostPath:
      path: /var/log/webapp
  containers:
  - env:
    - name: LOG_HANDLERS
      value: file
    image: kodekloud/event-simulator
    imagePullPolicy: Always
    name: event-simulator
    volumeMounts:
    - name: log-volume
      mountPath: /log
```
3. Create a Persistent Volume with the given specifications:
- `Volume Name: pv-log`
- `Storage: 100Mi`
- `Access Modes: ReadWriteMany`
- `Host Path: /pv/log`
- `Reclaim Policy: Retain`
```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-log
spec:
  storageClassName: "lab5"
  capacity:
    storage: 100Mi
  accessModes:
    - ReadWriteMany
  hostPath:
    path: "/pv/log"
  persistentVolumeReclaimPolicy: Retain
```
4. Let us claim some of that storage for our application. Create a Persistent Volume Claim with the given specification.
- `Volume Name: claim-log-1`
- `Storage Request: 50Mi`
- `Access Modes: ReadWriteOnce`
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: claim-log-1
spec:
  storageClassName: "lab5"
  volumeName: pv-log
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 50Mi
```
5. What is the state of the Persistent Volume Claim?
-> `Pending`
6. What is the state of the Persistent Volume?
-> `Available`
7. Why is the claim not bound to the available Persistent Volume?
-> `VolumeMismatch: Cannot bind to requested volume "pv-log": incompatible accessMode`
8. Update the Access Mode on the claim to bind it to the PV?
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: claim-log-1
spec:
  storageClassName: "lab5"
  volumeName: pv-log
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 50Mi
```
Since PVC are immutable, we have to delete the PVC and re-apply it.
```sh
kubectl delete pvc claim-log-1
kubectl apply -f pvc.yaml
```
---------
