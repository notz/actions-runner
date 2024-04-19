# actions-runner

This repository build every week a new actions runner image which is a drop-in replacement from default github base image with some basic tools installed.

## Tools included
* build-essential
* curl
* git
* openssh-client
* unzip
* wget
* xz-utils
* Chrome dependencies

## Usage

Install [gha-runner-scale-set helm chart](https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners-with-actions-runner-controller/deploying-runner-scale-sets-with-actions-runner-controller) with following template spec:

```yaml
    template:
      spec:
        initContainers:
          - name: init-dind-externals
            image: ghcr.io/notz/actions-runner:latest
            command: ["cp", "-r", "-v", "/home/runner/externals/.", "/home/runner/tmpDir/"]
            volumeMounts:
              - name: dind-externals
                mountPath: /home/runner/tmpDir
        containers:
          - name: runner
            image: ghcr.io/notz/actions-runner:latest
            command: ["/home/runner/run.sh"]
            env:
              - name: DOCKER_HOST
                value: unix:///var/run/docker.sock
            volumeMounts:
              - name: work
                mountPath: /home/runner/_work
              - name: dind-sock
                mountPath: /var/run
          - name: dind
            image: docker:dind
            args:
              - dockerd
              - --host=unix:///var/run/docker.sock
              - --group=$(DOCKER_GROUP_GID)
            env:
              - name: DOCKER_GROUP_GID
                value: "123"
            securityContext:
              privileged: true
            volumeMounts:
              - name: work
                mountPath: /home/runner/_work
              - name: dind-sock
                mountPath: /var/run
              - name: dind-externals
                mountPath: /home/runner/externals
        volumes:
          - name: work
            emptyDir: {}
          - name: dind-sock
            emptyDir: {}
          - name: dind-externals
            emptyDir: {}
```

