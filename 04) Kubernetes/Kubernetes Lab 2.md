1. Create a ReplicaSet using the below YAML:
```yaml
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: new-replica-set
  namespace: default
spec:
  replicas: 4
  selector:
    matchLabels:
      name: busybox-pod
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
        image: busybox777
        imagePullPolicy: Always
        name: busybox-container
```
2. How many Pods are DESIRED in the `new-replica-set`?
-> 4
3. What is the image used to create the pods in the `new-replica-set`?
-> `busybox777`
4. How many Pods are READY in the `new-replica-set`?
-> 0
5. Why do you think the Pods are not ready?
-> `Failed to pull image "busybox777": Error response from daemon: pull access denied for busybox777, repository does not exist or may require 'docker login': denied: requested access to the resource is denied`
6. Delete any one of the 4 Pods:
```sh
kubectl delete po <po-name>
```
7. How many pods now?
-> 4
8. Why are there still 4 Pods, even after you deleted one?
-> ReplicaSets keep track of the Pods that in case of a Pod failure, a new Pod is created.
---
9. Create a ReplicaSet using the below YAML. There is an issue with the file, so try to fix it.
```yaml
apiVersion: v1
kind: ReplicaSet
metadata:
  name: replicaset-1
spec:
  replicas: 2
  selector:
    matchLabels:
      tier: frontend
  template:
    metadata:
      labels:
        tier: frontend
    spec:
      containers:
      - name: nginx
        image: nginx
```
-> `apiVersion` must be `apps/v1`

---