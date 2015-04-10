# Overview

Installs and configures docker.


## Requirements

none

## Role Variables

none

## Dependencies

none

## Example Playbook

    - hosts: all
      roles:
         - role: docker


# On Mac with boot2docker

To connect the Docker client to the Docker daemon, please set:

    export DOCKER_HOST=tcp://192.168.59.103:2376
    export DOCKER_CERT_PATH=/Users/Shared/Jenkins/.boot2docker/certs/boot2docker-vm
    export DOCKER_TLS_VERIFY=1

## License

MIT

## Author Information

SCB 10x Team <scb10x@gmail.com>
