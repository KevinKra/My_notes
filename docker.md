### What is Docker

- Docker comes in two version Enterprise Edition (EE) and Community Edition (CE). Both are versions have a quarterly release cycle, with CE being supported for 4 months and EE support for 12 months.

- `Moby` is the open-source project for Docker. It's the upstream project of Docker and intended to break Docker down into module components. The source-code is available for free on Github.

#### Use cases for Docker

1. Dev/Prod parity
   1. the concept that the `dev` and `prod` environments are **exactly** the same. Packages may be different between environments and not having the ability to replicate bugs is a _huge_ problem. The software you run in dev is exactly the same software as in production.
1. Simplifying Configuration
   1. let's you put your environment and configuration into code so you can deploy. This means you can use the exact same Docker configuration between dev, staging, and prod. The ultimate goal being to decouple infrastructure requirements from the application environment.
1. Code Pipeline Management
   1. by building standards and repeatable processes we are able to develop a pipeline to deploy code to production. Through pipelines, we can test our code, re-bake it back into a docker image, and then create an container based off of the image to dev, staging, and production.
1. Developer Productivity
   1. setting up local development environments can be solved with Docker. Instead of having to install a bunch of packages and software, you can simply install docker, deploy a container, and then have your code mapped into that container using a volume. This allows you to edit things locally and then simply restart the container to get those changes picked up.
1. App Isolation
   1. Rather than using a single webserver that runs multiple applications, the application is isolated to a single container. Let's say the application experiences a DDoS attack or memory leak, the impact is isolated to that single container instead of the server it's run on. This mentality also accommodate modern best practices like using microservices.
1. Server Consolidation
   1. resources are used more efficiently meaning we need less of them.
1. Debugging Capabilities
   1. were not fighting between difference between environments. We can replicate in problem in dev without having to worry about impacting production.
1. Multi-tenancy
   1. because containers run in isolation you can host multiple docker clients on the same Docker server without having to worry about comprising their information.
