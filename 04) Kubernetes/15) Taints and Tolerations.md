- _Taints_ are the opposite of [[14) NodeSelector and Node Affinity|Node Affinity]] -- they allow a node to repel a set of pods.
- _Tolerations_ are applied to pods. Tolerations allow the scheduler to schedule pods with matching taints.
- Taints and tolerations work together to ensure that pods are not scheduled onto inappropriate nodes. One or more taints are applied to a node; this marks that the node should not accept any pods that do not tolerate the taints.
## Method:
1. You add a taint to a node:
```sh
kubectl taint nodes node1 key1=value1:NoSchedule
```
This places a taint on node `node1`. The taint has key `key1`, value `value1`, and taint effect `NoSchedule`. This means that no pod will be able to schedule onto `node1` unless it has a matching toleration.
- To remove the taint added by the command above, you can run:
```sh
kubectl taint nodes node1 key1=value1:NoSchedule-
```
2. You specify a toleration for a pod in the Pod.spec:
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
  tolerations:
  - key: "example-key"
    operator: "Exists"
    effect: "NoSchedule"
```
### `effect` Field
The allowed values for the `effect` field are:
- `PreferNoSchedule`
- `NoExecute`
- `NoSchedule`
- `PreferNoSchedule`
---