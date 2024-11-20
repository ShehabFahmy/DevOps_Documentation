You can constrain a Pod so that it is _restricted_ to run on particular node(s), or to _prefer_ to run on particular nodes. For example, to ensure that a Pod ends up on a node with an SSD attached to it, or to co-locate Pods from two different services that communicate a lot into the same availability zone.
## Methods:
### nodeSelector:
1. Choose one of your nodes, and add a label to it:
```sh
kubectl label nodes <your-node-name> disktype=ssd
```
2. Create a pod that gets scheduled to any node with the label:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    env: test
spec:
  containers:
  - name: nginx
    image: nginx
    imagePullPolicy: IfNotPresent
  nodeSelector:
    disktype: ssd
```
or Create a pod that gets scheduled to specific node:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  nodeName: foo-node # schedule pod to specific node
  containers:
  - name: nginx
    image: nginx
    imagePullPolicy: IfNotPresent
```
---
### Affinity and Anti-affinity
- _Node affinity_ functions like the `nodeSelector` field but is more expressive and allows you to specify soft rules.
- _Inter-pod affinity/anti-affinity_ allows you to constrain Pods against labels on other Pods.
#### Node Affinity
Allows you to constrain which nodes your Pod can be scheduled on based on node labels.
##### Types:
- `requiredDuringSchedulingIgnoredDuringExecution`: The scheduler can't schedule the Pod unless the rule is met.
- `preferredDuringSchedulingIgnoredDuringExecution`: The scheduler tries to find a node that meets the rule. If a matching node is not available, the scheduler still schedules the Pod.
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: with-node-affinity
spec:
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
        - matchExpressions:
          - key: topology.kubernetes.io/zone
            operator: In
            values:
            - antarctica-east1
            - antarctica-west1
      preferredDuringSchedulingIgnoredDuringExecution:
      - weight: 1
        preference:
          matchExpressions:
          - key: another-node-label-key
            operator: In
            values:
            - another-node-label-value
  containers:
  - name: with-node-affinity
    image: registry.k8s.io/pause:2.0
```
---