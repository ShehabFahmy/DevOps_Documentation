- An object that contains a small amount of sensitive data such as a password, a token, or a key. Using a Secret means that you don't need to include confidential data in your application code.
- Secrets are similar to ConfigMaps but are specifically intended to hold confidential data.
## Creating an Opaque Secret
- `Opaque` is the default Secret type if you don't explicitly specify a type in a Secret manifest.
- Imperative:
```sh
kubectl create secret generic <secret-name> --from-literal=username=myUsername --from-literal=password=myPassword
```
- Declarative:
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: db-secret
  namespace: default
type: Opaque
data:
  username: dXNlcm5hbWU=  # base64 encoded
  password: cGFzc3dvcmQ=  # base64 encoded
```
The value data must be `base64` encoded, which can be converted using the terminal:
- Encoding:
```sh
base64 <<< "username"
```
- Decoding:
```sh
echo "dXNlcm5hbWU=" | base64 -d
```
or
```sh
base64 -d <<< "dXNlcm5hbWU=" && echo
```
---