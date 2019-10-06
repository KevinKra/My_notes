# Coding for the Cloud 101

### Background / Cloud Solutions

- Before the cloud we had physical servers (aka **"bare metal"**) usually located in data centers. You were given for remote access to the machine and you responsible for everything that happens on the machine.
- **Virtualization**. Virtualization is a technology that created virtual servers and other infrastructure called **Virtual Machines or VM**. One or more virtual servers can run on a machine. A virtual machine can be provisioned in minutes instead of weeks or months.
- **IaaS, Infrastructure as a Service**. VM helps power IAAS, infrastructure is provided on demand as a service through a control panel or API call. You don't have to worry about the physical infrastructure. IaaS allows users to reap the benefits of virtualization but still requires users to determine the OS and you're still managed individual devices and instances.
- **PaaS**, Platform as a Service. Instead of infrastructure you get a platform that you can build on top of. Examples: Salesforce, Heroku, etc. The provider is responsible for scaling, uptime, redundancy, etc. This is great so long as the provider is able to provide a reliable service, if they don't or they have issues you need to work with the provider directly to find a solution.
- **SaaS, Software as a Service.** You get access to a software application. You could get access to a UI, like gMail, google maps, etc. Salesforce is also often considered SaaS, because you can use Salesforce apps out-of-the-box and customize them as well as writing your own applications on the service.
- **SOA, Service Oriented Architecture.** SOA is a pattern for developing applications. You can use IaaS, PaaS, or SaaS, as part of a SOA. Essentially, instead of writing one massive application, you can break your application down into smaller services that work together. Each service usually runs on a separate machine, physical or virtual, and has its own domain or set of responsibilities. Following SOA your applications are more scalable, robust, and can also simplify development.
- **Containers**, Docker is one of the most popular examples of a container. Similar to Virtual Servers, Containers provide a full server operating system. They use features of an OS to partition different application environments. Containers are especially suitable for applications that need to scale up and scale down quickly, but don't usually use the full capacity of a single server. Like IaaS, the app has to be configured to scale. Containers are essentially as lighter-weight VMs. Containers are often set-up and considered **ephemeral**, or it only exists as its doing work. Containers do not _have_ to be ephemeral, but they are well suited for the role.
- **Microservices**. VMs and Containers ability to scale up and down rapidly have encourage a architecture pattern called microservices. Instead of larger apps and big services running on a single server, a microservice is the concept of building multiple smaller services that do one thing effectively. The microservice pattern is the evolution of SOA. Microservices by their nature are easier to write an maintain, but you have more complexity in the architecture of the application. An example of a e-commerce platform using microservices: One microservice may handle the store page, another handles transactions, customer accounts, emails, etc. Each one operates independently, and if the architecture is designed well, if one service gets overloaded and crashes the other microservices should continue as normal.
- **FaaS, Functions as a Service**. Lamba is an example of a FaaS product. FaaS products run code at the level of a single function of code. You essentially have functions that handle specific services and they only run on demand often in parallel with other functions. These are essentially the evolution of microservices that take the concept of distributed responsibilities down to a functional level.
- **BaaS, Backend as a Service**. Powerful Data processing services that vendors provide via an API and are available to the frontend. These services are designed to replace an app's backend and can be called directly from the frontend without an intermediary. Could be considered an evolution of SaaS, except you're not using entire application. Instead, you're using one or a few individual services like an authentication service, an image processing service, etc.
- **Serverless**, is a name given to emerging technologies and patterns including technologies like BaaS or FaaS, that abstract away the management of infrastructure from a developer. Serverless puts the responsibility for the server _entirely_ on the provider. Serverless supports and encourages loosely coupled, event-driven applications. Typically, Serverless technologies have more powerful frontends that rely on asynchronous connections to many different services.

### What is Cloud Computing?

> According to NIST:

- Five Characteristics:
  1. On-demand self-service
  2. Broad network access
  3. Resource pooling
  4. Rapid elasticity
  5. Measured service
- Three Service Models:
  1. SaaS
  2. PaaS
  3. IaaS
- Four Deployment Models:
  1. Private Cloud
  2. Community Cloud
  3. Public Cloud
  4. Hybrid Cloud

### Principles of Serverless

- Use compute services to execute code on demand.

- Write single-purpose stateless functions.

- Design push-based event-driven pipelines.

- Create thicker, more powerful frontends.

- Embrace third party services.
