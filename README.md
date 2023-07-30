# Docker in Docker (DinD) cookbook

> Author's notes: DinD is not awesome or fun. It's more work to maintain, understand and often leads to quirks and issues than it's actually worth it. I hope you are probably here because you like pain and understand your usecase well enough to take on DinD in production usecases.

DinD is an incredible learning opportunity as well to figure out how container's networking, filesystem, volumes and engine components work when the problem do occur. 

This repository aims to provide Dockerfiles optimized to run Docker in Docker with minimal size and support for multiple architectures from the [Alpine DockerHub page](https://hub.docker.com/_/alpine).

`amd64, arm32v6, arm32v7, arm64v8, i386, ppc64le, riscv64, s390x`

### Context

Docker In Docker (also known as dind) allows developers to run a Docker container within an already running Docker container to support CI/CD pipelines and create sandboxed container environments. Running containers this way extends the already robust capabilities of the system to allow developers more flexibility in how they use it. ([Source](https://blog.packagecloud.io/3-methods-to-run-docker-in-docker-containers))

Not diving deeper, if you are here you probably know why you are using Docker in Docker in your usecase. Here's ways you can implement them: 

# Get Started

I want to run DinD using: 

  - [Docker CLI (No Dockerfile)](#docker-cli-no-dockerfile)
  - [Docker Engine](#docker-engine)
  - [balena Engine](#balena-engine)
  - [Sysbox](#sysbox)

## Docker CLI (No Dockerfile)

> Using the official DinD image is the cookiecutter way of doing DinD.

Image credit: [https://devopscube.com/run-docker-in-docker](https://devopscube.com/run-docker-in-docker)

![](https://devopscube.com/wp-content/uploads/2020/08/docker-dind-min.png.webp)

To start run the command to pull and run the official Docker in Docker image: `docker run --privileged -d --name dind docker:dind`

Now, run `docker ps` to verify the Docker in Docker container called `dind` is running. To enter the container, run the command `docker exec -it dind /bin/sh`

Now, you can interact with the Docker installation inside and run Docker commands to create environments.

## Docker Engine 

> This is the most common and recommended way to run DinD. 

**Using Dockerfile** build your DinD image and be able to run Docker inside the container. Check out the entrypoint script `entry.sh` to replace the placeholder command with the options mentioned there. 

This method mounts the host Docker engine socket to the container we just built resulting in Docker being available in your container. 

## balena Engine

This is a [balenaCloud](https://balena.io/cloud) specific workflow using [balena-engine](https://www.balena.io/engine) instead of Docker engine as the host container engine. Balena-engine is a container engine forked from Docker engine optimized for embedded and IoT workloads that comes pre-installed in balenaOS.

```
balena-engine --starts-->  Docker-Engine --> *Starts new containers*
```

**Using Dockerfile.template** balena engine will build the image compatible to your device type or architecture without any modification when using the balena-cli command `balena push` or `balena build`

This method installs and runs Docker in your system standalone. 

## Sysbox 

?? - Assess https://devopscube.com/run-docker-in-docker/#:~:text=Method%203%3A%20Docker%20in%20Docker

