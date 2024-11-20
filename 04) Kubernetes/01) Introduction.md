Kubernetes is an open-source container orchestration platform to automate and manage containerized applications.
Node: the machine
Pod: the smallest component in Kubernetes that may contain one or more containers.
Master Node/Control Plane:
- API Server: responsible for all the communication inside and outside the cluster.
- Scheduler: responsible for scheduling pods on worker nodes.
- ETCD: key-value database that contains data about the cluster state and its configuration.
- Controller-Manager: monitors the state of the components within the Kubernetes cluster.
- Cloud-Controller-Manager: controls and facilitates connecting the cluster to the cloud providers.
Worker Node:
- Kubelet: an agent that runs on each node in the cluster.
- Container Runtime: responsible for running containers in Pods.
- Kube-Proxy: a networking proxy that runs on each node in the Kubernetes cluster.
---
## The Life Cycle of a Kubernetes Pod
`Pending`: The Pod has been accepted by the kubernetes cluster but the Pod is waiting to be scheduled and image being downloaded over the network.
`Running`: The Pod has been bound to a node, and all of the containers have been created.
`Failed`: All containers in the Pod have terminated, and at least one container has terminated in failure.
`Succeeded`: All containers in the Pod have terminated in success, and will not be restarted.

---
## Static Pods
- They are managed directly by the kubelet daemon on a specific worker node, without the API server observing them. Whereas most Pods are managed by the control plane (for example, a Deployment), for static Pods, the kubelet directly supervises each static Pod (and restarts it if it fails).
- Static Pods are always bound to one Kubelet on a specific node. The main use for static Pods is to run a self-hosted control plane: in other words, using the kubelet to supervise the individual control plane components.
---
## Multi-container Pods
- Pods that run multiple containers that need to work together.
- A Pod can encapsulate an application composed of multiple co-located containers that are tightly coupled and need to share resources.
- These co-located containers form a single cohesive unit of service—for example, one container serving data stored in a shared volume to the public, while a separate sidecar container refreshes or updates those files. The Pod wraps these containers, storage resources, and an ephemeral network identity together as a single unit.
- Some Pods have init containers as well as app containers. By default, init containers run and complete before the app containers are started.
---
