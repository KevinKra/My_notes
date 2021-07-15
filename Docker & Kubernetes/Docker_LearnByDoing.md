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
