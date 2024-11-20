- An API object used to store NON-confidential data in key-value pairs.
- Allows you to decouple environment-specific configuration from your container images, so that your applications are easily portable.
- It Is not designed to hold large chunks of data. The data stored in a ConfigMap cannot exceed 1 MiB. Mount a volume for larger data.
## Creating a ConfigMap
### Imperative:
- From Literal:
```sh
kubectl create configmap <cm-name> --from-literal=env=test --from-literal=ipaddress=172.0.0.1
```
- From File:
```sh
kubectl create configmap <cm-name> --from-file=<path/to/file>
```
- From Folder (many files):
```sh
kubectl create configmap <cm-name> --from-file=<path/to/folder>
```
### Declarative
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: myconfigmap
data:
  # property-like keys; each key maps to a simple value
  player_initial_lives: "3"
  ui_properties_file_name: "user-interface.properties"

  # file-like keys
  game.properties: |
    enemy.types=aliens,monsters
    player.maximum-lives=5    
  user-interface.properties: |
    color.good=purple
    color.bad=yellow
    allow.textmode=true
```
## Using ConfigMaps as Environment Variables
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: env-configmap
spec:
  containers:
  - name: envars-test-container
    image: nginx
    env:
    - name: CONFIGMAP_USERNAME
      valueFrom:
        configMapKeyRef:
          name: myconfigmap
          key: username
```
## Using ConfigMaps as Files in Volumes
- `cm.yaml`:
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: myconfigmap
data:
  script.sh: |
    #!/bin/bash
    echo "Hello from the script!"
```
- `pod.yaml`:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod-test
spec:
  volumes:
  - name: cm-volume
    configMap:
      name: myconfigmap
  containers:
  - name: ubuntu
    image: ubuntu
	command: ["/bin/bash", "-c"]
	args:
	- |
	# Copy the file out of the ConfigMap Volume as it is Read-only
	# cp /home/my-storage/scripts/script.sh /home/my-storage/
	# Make the script executable
	# chmod +x /home/my-storage/script.sh
	# Run the script
	bash /home/my-storage/scripts/script.sh
	# Keep the container running for an hour
	# sleep 3600
	volumeMounts:
	- name: cm-volume
	  mountPath: /home/my-storage/scripts
```
---