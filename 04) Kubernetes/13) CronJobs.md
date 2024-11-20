- A CronJob creates Jobs on a repeating schedule.
- CronJob is meant for performing regular scheduled actions such as backups, report generation, and so on.
- It runs a Job periodically on a given schedule, written in Cron format.
## Example
- Print the current time and a hello message every minute:
```yaml
apiVersion: batch/v1
kind: CronJob
metadata:
  name: hello
spec:
  schedule: "* * * * *"
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: hello
            image: busybox:1.28
            imagePullPolicy: IfNotPresent
            command:
            - /bin/sh
            - -c
            - date; echo Hello from the Kubernetes cluster
          restartPolicy: OnFailure
```
## Schedule syntax
The `.spec.schedule` field is required. The value of that field follows the Cron syntax:
```
# ┌───────────── minute (0 - 59)
# │ ┌───────────── hour (0 - 23)
# │ │ ┌───────────── day of the month (1 - 31)
# │ │ │ ┌───────────── month (1 - 12)
# │ │ │ │ ┌───────────── day of the week (0 - 6) (Sunday to Saturday)
# │ │ │ │ │                       OR sun, mon, tue, wed, thu, fri, sat
# │ │ │ │ │ 
# │ │ │ │ │
# * * * * *
```
## YAML File
- A CronJob that starts every 3 minutes:
```yaml
apiVersion: batch/v1
kind: CronJob
metadata:
  name: cron-job-task
spec:
  schedule: "*/3 * * * *"
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: ubuntu
            image: ubuntu
            imagePullPolicy: IfNotPresent
            command: ["/bin/bash", "-c"]
            args:
            - |
              # Keep the container running for an hour
              sleep 3600
          restartPolicy: OnFailure
```
---