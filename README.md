# Docker in Docker (DinD) cookbook

> Author's notes: DinD is not awesome or fun. It's more work to maintain, understand and often leads to quirks and issues than it's actually worth it. I hope you are probably here because you like pain and understand your usecase well enough to take on DinD.

DinD is an incredible learning opportunity as well to figure out how container's networking, filesystem, volumes and engine components work when the problem do occur. 

This repository aims to provide Dockerfiles optimized to run Docker in Docker with minimal size and support for multiple architectures: 

1. armv7hf
2. amd64

Full disclaimer: The architecture support is made possible with balena base images available for [multiple archs, distros, device types and language stacks](https://docs.balena.io/reference/base-images/base-images/). You can use any of [11k+ images available](https://docs.balena.io/reference/base-images/base-images-ref/) to get DinD running on your target environment. 


### Context

Docker In Docker (also known as dind) allows developers to run a Docker container within an already running Docker container to support CI/CD pipelines and create sandboxed container environments. Running containers this way extends the already robust capabilities of the system to allow developers more flexibility in how they use it. ([Source](https://blog.packagecloud.io/3-methods-to-run-docker-in-docker-containers))

Not diving deeper, if you are here you probably know why you are using Docker in Docker in your usecase. Here's ways you can implement them: 

# Get Started

I want to run DinD using: 
## Docker Engine 

**Using Dockerfile** Docker will build the image compatible with ARM v7 devices. Change the base image for this Dockerfile to any other architecture, distribution or version as available on the balenalib org. 

```
FROM balenalib/armv7hf-alpine:3.15-run 
```

This mounts the Docker socket to the engine which results in your Docker in a container using the Host Docker engine. 

## balena Engine

This is a [balenaCloud](https://balena.io/cloud) specific workflow. 

**Using Dockerfile.template** balena engine will build the image compatible to your device type without any modification when using the balena-cli command `balena push` or `balena build`

```
FROM balenalib/armv7hf-alpine:3.15-run 
```

This mounts the Docker socket to the engine which results in your Docker in a container using the Host Docker engine. 

## Sysbox 

?? - Assess https://devopscube.com/run-docker-in-docker/#:~:text=Method%203%3A%20Docker%20in%20Docker

## Docker CLI (No Dockerfile)

?? Using the official DinD image  

basically: `docker run --privileged -d --name <demo> docker:dind`

