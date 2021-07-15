# Docker

## Docker Deep Dive

- [Introduction to Docker](#Introduction-to-Docker)

- [Docker Architecture](#Docker-Architecture)

## Introduction to Docker

### What is Docker

Docker is an open platform for developing, shipping, and running applications. Docker enables you to separate your applications from your infrastructure so you can deliver software quickly. With Docker, you can manage your infrastructure in the same ways you manage your applications. By taking advantage of Docker’s methodologies for shipping, testing, and deploying code quickly, you can significantly reduce the delay between writing code and running it in production. [source](https://docs.docker.com/get-started/overview/)

- Docker is written in the `Go` programming language and takes advantage of several features of the Linux kernel to deliver its functionality. Docker uses a technology called `namespaces` to provide the isolated workspace called the `container`. When you run a container, Docker creates a set of namespaces for that container. These namespaces provide a layer of isolation. Each aspect of a container runs in a separate namespace and its access is limited to that namespace.

- Docker comes in two version Enterprise Edition (EE) and Community Edition (CE). Both are versions have a quarterly release cycle, with CE being supported for 4 months and EE support for 12 months.

- `Moby` is the open-source project for Docker. It's the upstream project of Docker and intended to break Docker down into module components. The source-code is available for free on Github.

#### Use cases for Docker

1. **Dev/Prod parity**
   1. with Docker, the `dev` and `prod` environments are **exactly** the same. In traditional environments, packages may be different between environments and not having the ability to replicate bugs is a _huge_ problem. The software you run in development is exactly the same software as in production.
1. **Simplifies Configuration**
   1. Docker allows you to put your environment and configuration into code, which streamlines the deployment process. This means you can use the exact same Docker configuration between `dev`, `staging`, and `prod`. This pattern helps establish the ultimate goal of being able to decouple infrastructure requirements from the application environment.
1. **Code Pipeline Management**
   1. by building standards and repeatable processes we are able to develop a pipeline to deploy code to production. Through pipelines, we can test our code, re-bake it back into a docker image, and then create a container based off of the image to build `dev`, `staging`, and `prod` environments.
1. **Developer Productivity**
   1. setting up local development environments can be solved with Docker. Instead of having to install a bunch of packages and software, you can simply install docker, deploy a container, and then have your code mapped into that container using a volume. This allows you to edit things locally and then simply restart the container to get those changes picked up.
1. **App Isolation**
   1. rather than using a single webserver that runs multiple applications, **the application is isolated to a single container.** To explore the implications of this paradigm, let's say the application experiences a DDoS attack or memory leak, the impact is isolated to that single container instead of the server it's run on. Furthermore, this isolation of services approach also accommodates the modern development practice of leveraging self-contained microservices to perform specific tasks well.
1. **Server Consolidation**
   1. Docker is lightweight and fast. It provides a viable, cost-effective alternative to hypervisor-based virtual machines, so you can use more of your compute capacity to achieve your business goals. Docker is perfect for high density environments and for small and medium deployments where you need to do more with fewer resources. with proper Docker integration, resources are used more efficiently. The increased efficiency results in faster and more optimized services.
1. **Debugging Capabilities**
   1. through establishing uniform environments we eliminate the challenges associated with discrepancies in packages and other resources that are found between environments. As a result. we can replicate in problem in `dev` without having to worry about impacting `prod`.
1. **Multi-tenancy**
   1. because containers run in isolation you can host multiple docker clients on the same Docker server without having to worry about compromising their information. In short, unless containers are given explicit permissions to establish connections with other Docker containers within a network, they run completely in isolation and are unable to expose the information or data existing in a given instance.
1. **Scale Elasticity**
   1. Docker’s portability and lightweight nature make it easy to dynamically manage workloads, scaling up or tearing down applications and services as business needs dictate, in near real time.

### Docker Architecture

- **Docker uses a client-server architecture.** The Docker _client_ talks to the Docker _daemon_, which does the heavy lifting of building, running, and distributing your Docker containers. The Docker client and daemon can run on the same system, or you can connect a Docker client to a remote Docker daemon. The Docker client and daemon communicate using a REST API, over UNIX sockets or a network interface. Another Docker client is Docker Compose, that lets you work with applications consisting of a set of containers.

#### The Docker Daemon (`dockerd`)

- The Docker daemon (`dockerd`) listens for Docker API requests and manages Docker objects such as images, containers, networks, and volumes. A daemon can also communicate with other daemons to manage Docker services.

#### The Docker Client (`docker`)

- The Docker client (`docker`) is the primary way that many Docker users interact with Docker. When you use commands such as `docker run`, the client sends these commands to `dockerd` (the docker daemon), which carries them out. The `docker` command uses the Docker API. The Docker client can communicate with more than one daemon.

#### Docker Registries

- A Docker registry stores Docker images. Docker Hub is a public registry that anyone can use, **and Docker is configured to look for images on Docker Hub by default.** You can even run your own private registry.

- When you use the `docker pull` or `docker run` commands, the required images are pulled from your configured registry. When you use the `docker push` command, your image is pushed to your configured registry.

#### Docker Objects

> When you use Docker, you are creating and using images, containers, networks, volumes, plugins, and other objects. This section is a brief overview of some of those objects.

1. **Images**
   1. read-only template with instructions for creating a Docker container.
   1. images are based on other images.
   1. you can create your own images using a `Dockerfile`.
1. **Containers**
   1. runnable instances of an image.
   1. containers can be connected to (multiple) networks
   1. storage / volumes can be attached to provide persistence.
   1. new images can be created based off of the current state of a running container.
   1. by default, a container is relatively well isolated from other containers and its host machine. You can control how isolated a container’s network, storage, or other underlying subsystems are from other containers or from the host machine.
   1. when a container is removed, any changes to its state that are not stored in persistent storage disappear.
1. **Services**
   1. scale containers across multiple Docker hosts.
   1. you can have multiple docker hosts work together by using Docker Swarm.
   1. Each member of the swarm is its own Docker daemon.
   1. Two types of nodes in a Docker swarm: managers and workers.
      1. managers manage the cluster
      1. workers execute tasks
   1. Services allow you define a desired state. (think how Kubernetes sets up pods and manages failures, etc.)
   1. Service is load-balanced
1. **Docker Swarm**
   1. Multiple Docker daemon (Master and Workers).
   1. The daemons all communicate using the Docker API.

### The Docker Engine

> What runs and manages the containers.

- modular in Design and can be customized.
- early versions of Docker could only run on Linux through `LXC` and were monolithic in nature with everything being on the daemon.
- `LXC` was later replaced by `libcontainer` which allowed Docker to be platform agnostic.
- eventually, Docker Inc. broke the monolithic daemon into smaller and more specialized tools, aka **pluggable architecture.**
- the `Open Container Initiative (OCI)` was initiated in 2015 to provide a lightweight governance structure. Or in other words, the intention was to create a standardized approach across the industry to establish container architectures. Docker Inc. is a major contributor of the OCI spec.
- `runc`: is a lightweight CLI wrapper for `libcontainer`, its sole purpose is to create containers.
- `containerd`: is responsible for managing the lifecycle of containers. it sits between the daemon and `runc` at the OCI layer. Also managed images.
- `shims`: used to decouple running containers from the daemon. When a container is created, `containerd` forks an instance of `runc` for each new container. The `runc` process exits after the container is created, then `shim` process becomes the container's parent. This allows us to run hundreds of containers _without_ running hundreds of `runc` instances.
- the `shim` is responsible for keeping STDIN and STDOUT streams open. This means that if the daemon is restarted, the container doesn't go and terminate due to closed pipes.
- the `shim` also reports the exit status of a container back to the docker daemon.

#### Docker Command Breakdown:

`docker run -i -t ubuntu /bin/bash`

1.  If you do not have the ubuntu image locally, Docker pulls it from your configured registry, as though you had run docker pull ubuntu manually.
1.  Docker creates a new container, as though you had run a docker container create command manually.
1.  Docker allocates a read-write filesystem to the container, as its final layer. This allows a running container to create or modify files and directories in its local filesystem.
1.  Docker creates a network interface to connect the container to the default network, since you did not specify any networking options. This includes assigning an IP address to the container. By default, containers can connect to external networks using the host machine’s network connection.
1.  Docker starts the container and executes /bin/bash. Because the container is running interactively and attached to your terminal (due to the -i and -t flags), you can provide input using your keyboard while the output is logged to your terminal.
1.  When you type exit to terminate the /bin/bash command, the container stops but is not removed. You can start it again or remove it.

#### Under the hood:

1.  use the CLI to execute a command
1.  Docker client uses the appropriate API payload
1.  POSTs to the correct API endpoint
1.  the Docker daemon receives the instructions
1.  the Docker daemon calls `containerd` to start a new container.
1.  the Docker daemon uses `gRPC` (a CRUD style API)
1.  `containerd` creates an OCI bundle from the Docker image
1.  `containerd` tells `runc` to create a container using the OCI bundle
1.  `runc` interfaces with the OS kernel to get the constructs needed to create a container -- includes things like namespaces, `cgroups`, etc.
1.  `runc` starts the container as child process
1.  once the container comes online, `runc` exits and the `shim` will become the new parent process.

#### Major Components

- `daemon`
- `containerd`
- `runc`

### Docker Images

- images are a template and containers are running instances of images.
- images are comprised of multiple layers, ie. images build on top of images and combined they represent a single object.
- **images are considered build-time constructs** whereas **containers are considered run-time constructs.** When you create a container from an image, they become dependent on one another. You can't delete the image until all of the containers using that image are deleted.
- images are built from `dockerfile` scripts.

#### Docker Image Layers

- images are made up of multiple "layers"
- each layer represents an instruction to the image's `dockerfile`.
- **each layer, except the very last one, is read-only.**
- each layer is only a set of differences from the layer before it
- containers add a new writeable layer on top of the underlying read-only layers (called the `Container layer`)
- all changes made to a running container are made to the `Container layer`
- when we delete a container, what's actually being done is that top r:w `Container layer` is being deleted. The underlying images will still exist unchanged.

## Docker Basics

- `docker -h | more`q
- docker commands have been rolled into docker "Management Commands". These commands encapsulate specific parts of docker and are the reason why `docker images` and `docker image ls` both exist and do the same thing.
- `docker container inspect <container_id>`
- `docker container run busybox`: running this command creates a container with the `COMMAND` "sh". In other words, this container starts up, executes a command, and then stops. This is unlike other containers that have "long-running processes" like standing up an `nginx` environment and using flags like `--rm` allow us to remove the containers after they run.
- `-i`: keeps STDIN open even if not attached
- `-t` or `--tty` allocate a pseudo-TTY (?)

#### Ports

- `-p` stands for `--publish` (NOT `-port`): used to list a published container's port(s) to the host.
- `-P`, `--publish-all`: used to publish all exposed ports to random ports.

- `--expose <PORT>` exposes a port, or range of ports. This command **does not publish the port.**
- `docker container port 7fb8ba939490`: shows which ports a container is using.

#### Commands

- commands can be: "one and done commands" or "long running commands"
- three ways of executing commands are: through the `dockerfile`, within a `docker run` command, or through using the `exec` command.

## Questions

- what does it mean to expose a port?
- what does it mean to publish a port?
- how do we set a container to publish all exposed ports to random ports?
- when publishing a port what do the before:after ports represent?
- can a container have multiple ports exposed?
- what is a TTY?
- how can I find the IP address of a nginx container?
- if there is no published port, how can you `curl` into a container?

---

---

---

## Docker by Doing

### Docker Overview

### Docker Basics

- [Running your first Docker Container](#Running-your-first-Docker-Container)
- [Deploying a Static Website to the Container](#Deploying-a-Static-Website-to-the-Container)
- [Handcrafting Container Images](#Handcrafting-Container-Images)

### Docker Storage

- [Storing Container Data in Docker Volumes](#Storing-Container-Data-in-Docker-Volumes)

### Docker Optimization

- Optimizing Docker Builds with OnBuild
- Ignoring Files during Docker Build

### Storing Data and Networking in Docker

- Creating Data Containers
- Container Networks with Links
- Container Networking with Networks
- Persistent Data Volumes

### Doing More with Docker

- Container Logging
- Updating Containers with Watchtower
- Adding Metadata and Labels
- Load Balancing Containers
- Building Services with Docker Compose

### Monitoring with Prometheus

- Monitoring Containers with Prometheus
- Using Grafana with Prometheus for Alerting and Monitoring

### Working with Docker Swarm

- Setting up Docker Swarm
- Backing up and restoring a Docker Swarm
- Scaling a Docker Swarm service

### Container Orchestration with Kubernetes

- Setting up a Kubernetes Cluster with Docker
- Scaling pods in Kubernetes
- Creating a Helm Chart

---

## Docker Overview

- Docker is an open source platform for developing, shipping, and running applications. Docker enables you to separate your applications from your infrastructure so you can deliver software quickly.

### Docker Architecture

Docker uses a client-server architecture. The Docker _client_ talks to the Docker _daemon_, which does the heavy lifting of building, running, and distributing your Docker containers. The Docker client and daemon _can_ run on the same system, or you can connect a Docker client to a remote Docker daemon. The Docker client and daemon communicate using a REST API, over UNIX sockets or a network interface. Another Docker client is Docker Compose, that lets you work with applications consisting of a set of containers.

#### The Docker daemon

- The Docker daemon (`dockerd`) listens for Docker API requests and manages Docker objects such as images, containers, networks, and volumes. A daemon can also communicate with other daemons to manage Docker services.

## Running your first Docker Container

> in this lab we use a provisioned EC2 instance running a Red-hat Linux OS. We SSH into the remote EC2 server using provided credentials and install / initialize Docker on CentOS.

#### Commands used:

- `sudo yum install -y yum-utils device-mapper-persistent-data lvm2`
- `sudo yum config-manager --add-repo https://download.docker/.../docker-ce.repo`
  - we use `config-manager` which we installed in the previous command through the `yum-utils` package to download the latest official docker repo.
- `sudo yum -install docker-ce`
  - we now install docker (community edition)
- `sudo systemctl enable --now docker`
  - we are now enabling the docker daemon. the `--now` flag will start docker immediately.
- `sudo usermod -aG docker cloud_user`
  - this command adds "cloud_user" to the docker group so we no longer need to use `sudo`
  - NOTE: we will need to `exit` and then log back in to view the user within the `groups`
- `groups`
  - this command shows what groups the currently logged in user is part of.
- `docker ps`
  - list all containers
- `docker run hello-world`
  - creates a hello-world container, a useful command to check that everything is installed and working properly.

#### Questions

1. what is `CentOS`?

#### Answers

1. CentOS is a discontinued Linux distribution that provides a free and open-source community-supported computing platform, functionally compatible with its upstream source, Red Hat Enterprise Linux.

## Deploying a Static Website to the Container

> in this lab, we are using prebuilt docker images from DockerHub to create containers on an EC2 instance with the intention of running our static website. The docker images we will use are the latest versions of "httpd" and "nginx". These containers will be exposed through the EC2 instance's public IPv4 address, ie: `http://34.224.60.43:8080`.

#### Commands used:

- `docker ps`
  - easy way to see if docker is installed on a machine.
- `docker pull httpd:2.4`
  - pulls down the httpd image
  - NOTE: you don't have to use `:2.4` tag, omitting it will pull down the latest. _However_, it's a best practice to be specific with which version you want to pull down as it makes your environment repeatable.
- `docker images`
  - shows the images currently available in the docker server.
- `docker run --name httpd -p 8080:80 -d httpd:2.4`
  - we create a container named "httpd" and expose a port `-p` (8080 on the server to connect to port 80 on the container).
  - the `-d` flag runs it as a **detached container** so it doesn't hold up the terminal.
  - with `httpd:2.4`, we choose a specific image to run.
- `git clone <github-repo>`
  - we clone a repo (provided in the lab) into our remote instance.
- `docker stop httpd`
  - stops our running docker container named httpd.
- `docker ps -a`
  - shows that our docker, while stopped, still exists.
- `docker rm httpd`
  - removes the httpd container we created.
- `docker run --name httpd -p 8080:80 -v $(pwd)/web:/usr/local/apache2/htdocs:ro -d httpd:2.4`

  - `-v` allows us to mount a `volume` inside of the container.
  - we attach the web directory (which was in our pwd when running the command) to the location of our apache server in the container. `:ro` sets it to read-only so the container can't actually modify the information we are mounting into it. For an apache web server, that's all it needs for a static website.
  - **NOTE: the `server:container` ports in the command correspond to the `$(pwd)/web:/apache/location/stuff`**

- NGINX: `docker pull nginx`
- NGINX: `docker run --name nginx -p 8081:80 -v $(pwd)/web:/usr/share/nginx/html:ro -d nginx`

## Handcrafting Container Images

> If you run your website from a pre-built base image, it will require a manual process to set up the container each time it runs. For repeatability and scalability, the container, and your website code should be made into an image. In this lab, you will start with a base webserver image, modify settings in the container for your website, and then create images from the container. You'll demonstrate the importance of small changes to your container, and how they affect your image. Lastly, you will use your new images to create containers to see your hard work in action.

#### Commands used:

- `docker exec -it <container> bash`
  - this lets us log into the container --so we can make changes to it.
  - `-it` flag provides an Interactive Terminal
- `apt update && apt install git -y`
- `git clone https://github.com/linuxacademy/content-widget-factory-inc.git /tmp/widget-factory-inc`
- `ls -l /tmp/widget-factory-inc/`
- `ls -l htdocs`
  - the directory where apache uses to serve website content (htdocs).
- `rm htdocs/index.html`
  - we remove the html already found there.
- `cp -r /tmp/widget-factory-inc/web/* htdocs/`
- `exit`
  - exit out of the container
- `docker commit <CONTAINER_ID> example/widget-factory:v1`
  - allows us to create an image off of the container we just edited.
- At this point, we notice that our new image is significantly larger than the httpd image we built on.
  - `docker exec -it <container_we_made> bash`
  - `rm -rf /tmp/widget-factory-inc`
    - earlier we moved these files to where apache serves website content (htdocs), we can remove it here.
  - `apt remove git -y && apt autoremove -y && apt clean`
    - we no longer need git.
    - we autoremove installed dependencies that git needed.
    - remove the cached files needed by all of the packages.
  - We then `exit` this container and re-commit it as `example/widget-factory:v2`
- `docker rmi example/widget-factory:v1`
  - we remove the image `rmi` of the previous widget factory with the tag v1.
- `docker run -d --name web1 -p 8081:80 example/widget-factory:v2`

## Storing Container Data in Docker Volumes

> Storing data within a container image is one option for automating a container with data, but it requires a copy of the data to be in each container you run. For static files, this can be a waste of resources. Each file might not amount to more than a few megabytes, but once the containers are scaled up to handle a production load, that few megabytes can turn into gigabytes of waste. Instead, you can store one copy of the static files in a Docker volume for easy sharing between containers. In this lab, you will learn how Docker volumes interact with containers. You will do this by creating new volumes and attaching them to containers. You'll then clean up space left by anonymous volumes created automatically by the containers. Finally, you'll learn about backup strategies for your volumes.

> in other words, instead of storing the static website data in each container like we did in the previous exercise, we will create a docker volume to store the static website data and it will be shared amongst the containers. We mount that volume to containers made from smaller images -- which means smaller containers and that now more of them can run on the same system. Volumes are a great way to store common config files, stateful information, static shared files, and so on.

#### Commands used:

- `docker volume ls`
- `docker run -d --name db1 postgres:12.1`
- `docker inspect db1 -f '{{ json .Mounts }}' | python -m json.tool`
  - this will show all the mount information for the volumes on the db1 container. We also used a python util to make this easier to read.
  ```
    [
        {
            "Destination": "/var/lib/postgresql/data",
            "Driver": "local",
            "Mode": "",
            "Name": "3f97b74b45df52a556db938f8ef7a18e8ccf0c39be68d69213d7aa2493209010",
            "Propagation": "",
            "RW": true,
            "Source": "/var/lib/docker/volumes/3f97b74b45df52a556db938f8ef7a18e8ccf0c39be68d69213d7aa2493209010/_data",
            "Type": "volume"
        }
    ]
  ```
  - the key takeaway from that command is that we can see the "Name" is the same as the volume's `VOLUME NAME`
- `docker run -d --rm --name dbTmp postgres:12.1`
  - `--rm` sets the container to remove itself, **and its volume,** when its stopped.
- `sudo cp -r /home/cloud_user/widget-factory-inc/web/* /var/lib/docker/volumes/website/_data/`
  - because volumes live in protected spaces we need to enter the volumes using sudo.
  - we copy everything from `/web/*` into `/website/_data` in our docker volume.
- `docker run -d --name web1 -p 80:80 -v website:/usr/local/apache2/htdocs:ro httpd:2.4`
- `docker run -d --rm --name webTmp -v website:/usr/local/apache2/htdocs:ro httpd:2.4`
  - `--rm` flag used and no `-p` provided (just an exercise)
- `docker exec -it webTmp bash`
  - we enter `webTmp` with a bash terminal
- `ls -l htdocs`
  - shows us that the files exist in the htdocs file as expected
- **NOTE: even if a container has a `--rm` flag, when stopped, if another container is using the shared volume, the volume will still exist despite the `--rm` flag.**
- `docker volume prune`

  - This will remove all local volumes not used by at least one container.

- `sudo su -`
  - docker volume data is stored in a protected space, so in order to back up and restore data in a docker volume we need to be root (user)
- `docker volume inspect website`
- `tar czf /tmp/website_$(date +%Y-%m-%d-%H%M).tgz -C /var/lib/docker/volumes/website/_data .`
  - we use `tar czf` to create a zip file

## Questions:

1. if we stop a container, will it automatically clean itself up?
1. if we remove a container with an attached volume, can we always assume the volume will also be cleaned up?
1. does docker volume data live in protect space?
1. what command can you use to remove all local volumes not used by at least one container?

## Answers

1. no, unless the container has a `--rm` flag it will simply stop. You will need to run `docker rm <container_name>` to remove it.
1. no, if the volume is mounted on another container docker will not remove it.
1. yes, volume data lives in protect spaces. To access them we need to use `sudo`.
1. `docker volume prune`.
