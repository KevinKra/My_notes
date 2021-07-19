# Kubernetes

#### What is Kubernetes

Kubernetes is an **open-source** container orchestration tool originally developed by Google. In short, it manages containers. Kubernetes helps you manage applications that potentially could be made up of hundreds, or thousands, of containers and also allows you to manage them in different deployment environments (physical, virtual, hybrid, cloud). 

#### Kubernetes Problem-Solution case study

The trend from monolith to microservice application architecture led to increased usage of container technologies because containers served as perfect host for small and independent applications like microservices. As the microservice paradigm continued to take hold, many applications began to be comprised of hundreds or even thousands of containers. With such dramatic increases in containers, orchestration tools like Kubernetes, were developed to help manage the ever increasing large fleets of containers. 

Kubernetes guarantees several features:
 - high availability (no downtime)
 - scalability (high performance)
 - disaster recovery (backup and restore)


 ## K8 Fundamental Components

 > Kubernetes is composed of several core components that make it work. This section explores those components.

 ### Node

 A worker node (or just a Node in K8) is a simple server. It can be physical or virtual and can hold one or more pods.

 ### Pod

 A `Pod` is the smallest unit in Kubernetes and it serves as an abstraction over a container. Pods create a running environment, or layer, over the container and the intention behind a pod is to allow developers more flexibility and not be tied down to specific container services like Docker. An important concept is that **a pod is _usually_ meant to only run one application container inside of it.**  For instance, in a simple example your client facing application's container would run on one pod and your database's container would run on another pod. However, exceptions can be made where a helper container or side-service that has to run inside of that pod.

 Kubernetes offers a virtual network that is used to allow pods to communicate with one another. Each pod (not the underlying container) gets its own IP address that can be used by the pods to communicate with one another over the Node. For note, **it is an internal IP address and is not public facing.**

 Kubernetes pods are **ephemeral**, they can die very easily. For example, an underlying container could crash or the node/server running the pod could crash. When a pod component dies a new one will be created in its place and it will include a **new IP address.** In the event a new pod is created, and we're given a new IP address, the process of updating our infrastructure to point to the new address would be tedious to manage, as a result another component called a `Service` is used.

 ### Service

 A `Service` a static IP address that can be attached to each pod. **The lifecycle of a Pod and Service are not connected,** in the event that a pod dies, the service and its permanent IP address will remain. It's worth noting that `Services` are used across nodes as well. **Beyond their functionality as permanent IP addresses, `Services` also serve as Load Balancers** and can be used to redistribute traffic across Nodes. 

 It's likely that parts of our application should be accessible publicly, in that event an **external service** would be used. An external service opens a pod to communication from external sources. However, not all pods (like a database for instance) should be exposed to the public, in this event we use an **internal service.**

 By default, using a service would result in the following http protocol IP address: `http://123.45.678.90:8080`. First series of numbers in the http protocol is the Node IP address and the port number belongs to the service. While this URL is good for test purposes, it's not really ideal for production. In order to set a more human-readable URL we would use another Kubernetes component called `Ingress`.

 ### Ingress

 In order to provide a more suitable URL address than the underlying Node and Pod address/ports we use the `Ingress` component to handle the forwarding to the services on a node. In practice, a request hits the `Ingress` component and then it's forwarded to the appropriate `Pod(s)` through their `Service` component's address. 

 ### ConfigMap

 The `ConfigMap` component is used to streamline application configuration adjustments. For example, let's say your database has a specific endpoint; this endpoint would likely exist in the underlying applications code or stored as some sort of external environment variable. In the event we wanted to change the endpoint of a service we're using (like MongoDB), we would need to update the code, push up changes, and then pull the image into the pod and restart. Pretty tedious. As a solution, `ConfigMap` serves as the external configuration to your application. You simply add your configurations to the `ConfigMap` and then you connect it to the pod that uses the (MongoDB in our example) service. For note, these configurations _could_ also include the db-username and db-password as well **BUT** storing these credentials in plaintext inside the `ConfigMap` creates a vulnerability that is solved with another K8 component called `Secret`.

 ### Secret

 Used to store credentials. Data stored in the `Secret` component is not stored in plaintext, rather it's base64 encoded. **This component is not enabled by default.** You can use credentials from `ConfigMap` or `Secret` inside of your pods as environment variables or as properties files.

 ### Volumes

 if Pods are ephemeral, how would keep our data alive? `Volumes` attach physical storage to your pod, the storage could be on the **local** machine (same server Node where the pod is running) or on a **remote** service outside of the K8 cluster like on the cloud or an on-premise solution. In the event that a pod gets restarted all the data will survive and persist thanks to the `Volume` component. **Whether it's local or remote, think of storage through volumes as an external hard-drive plugged into the Kubernetes cluster, because K8 _explicitly_ does not manage data persistence.** 

 ### Deployments

 `Deployment` components are used to setup and configure pods and establish your replicas. In practice, you would not be directly creating pods. Rather, you would create deployments because with the `Deployment` component you can specify how many replicas you want and scale up/down the amount of replicas per your needs.

 **`Deployment` components are stateless** and should _not_ be used to replicate database-oriented pods.

 ### StatefulSet

 The `StatefulSet` component manages the replication and data-consistency aspects of pods in a manner very similar to how the `Deployment` component works. The key difference is that the `StatefulSet` component is designed specifically to handle applications like databases and is intended to be stateful.

 It's worth noting that deploying database applications using `StatefulSet` in K8 clusters can be tedious. As a result, it's a common practice to host database applications _outside_ of the K8 cluster and just have the stateless applications on the K8 cluster.


 ## Deployment and StatefulSet

 What happens in a scenario where an application pod dies that is used for a client facing website or other important infrastructure. Such an event would result in downtime and be result in a very negative experience. Instead of relying on one application pod or one database pod, **everything should be replicated across multiple nodes/servers.** We would have another Node, where a replica or clone of our application would run which would also **be connected to the same `Service` as the 'original' pod is using**. `Services` provide us two valuable functionalities: they serve as a permanent IP address _and_ serve as Load Balancers.

 In order to create a separate replica, **you would not create a separate pod**. Rather, you would create a blueprint for the pod and define how many replicas of a that given pod you would like to run. The component used to manage these blueprints and replicas is called `Deployment`.

 `Pod(s)` represent a layer of abstraction over the container and a `Deployment` represents a layer abstracting `Pod(s)`. Deployments make it more convenient to interact with, configure, and replicate pods. 

What happens if the database pod dies? We **can't replicate a database pod using deployment**. This is because databases have state (their data), if we were to replicate databases they would all need to access the same shared data-storage to maintain data consistency. We would need a mechanism that manages which pods are reading from and which pods are writing to the database. Luckily, there is a component that handles both the replication and consistency challenges related database-oriented pods: `StatefulSet`.

## Review

### Questions:
- What is a `Node` component?
- What is a `Pod` component?
- What is a `Service` component?
- What is an `Ingress` component?
- What is a `ConfigMap` component?
- What is a `Secret` component?
- What is a `Volume` component?
- What is a `Deployment` component?
- What is a `Stateful` component?

1. What is the use-case for Kubernetes and is it open source?
1. What (3) features does Kubernetes guarantee?
1. How many pods can a `Node` hold?
1. How many applications should run inside of a pod? Are there any edge-cases?
1. Pods are designed to be agnostic to what underlying element?
1. A Pod is a running environment, or layer, over what technology?
1. What does Kubernetes provide that allows pods to communicate with one another?
1. Are pod IP addresses permanent and are they internal?
1. What are _internal_ pod addresses used for?
1. Pods are ephemeral, what does that mean and what does it imply?
1. Would a new pod have the same IP address as the one that it replaced?
1. What component is used to persist IP addresses between pod restarts?
1. In addition to IP address permanence, what else does a `Service` component provide?
1. What purpose does an internal and external `Service` provide?
1. What would a default `Service` http protocol look like, what are the parts?
1. What component could be used to make the URL human readable?
1. What component would be used to manage environment variables across applications and how does it contrast the pre-K8 approach?
1. What variables should not be stored on a `ConfigMap`, why?
1. Which K8 component is used to store sensitive configuration variables, is it enabled by default and what encryption model does it use?
1. What K8 service persists data through Pod restarts?
1. What is a `Volume` and where are two potential locations to store the data?
1. What mentality should you keep regarding `Volumes` regardless of whether they're local or remote?
1. Should you create pods directly? What component is used to create and manage Pods and their replicas?
1. Are `Deployment` components stateful?
1. What component serves as the stateful variant of the `Deployment` component?
1. Why is the `StatefulSet` component not commonly used? What alternative solution is commonly practiced?
1. How is high availability maintained within K8? What should everything be replicated across and what component can be used to serve as a load balancer?
1. In order to create a separate replica, would you create a a separate Pod? If not, what would you use instead and why?

---

## K8 Architecture

> How does K8 work

### Nodes Processes

#### Worker Servers/Nodes Components

Each Node has one or more application Pods with containers running on it. **Kubernetes does this by using 3 processes that must be installed in every Worker Node that is used to schedule and manage those Pods.** Worker Nodes do the actual work.

1. `Container runtime`. A container runtime (Docker for example) must be installed on every Node. Application Pods have containers running inside of them, as such a runtime needs to be provided. The process that actually schedules the Pods, and their containers, is called **Kubelet**. 
1. `Kubelet` is a process of Kubernetes itself (unlike the container runtime) that interfaces with _both_ the Container and Node.** Kubelet takes the provided configuration and actually runs/starts a Pod with a Container inside and assigns resources from that Node to that container like CPU, RAM, and storage. Often K8 clusters are made up of multiple Nodes that each must have a Container runtime and Kubelet installed.
1. `Kube Proxy`. Kube Proxy is used to forward requests from Services to Pods. Kube Proxy has intelligent forwarding logic that ensures that communication works in an intelligent way with low overhead. For example, if a request is made from a Pod, the Service component (through Kube Proxy) will intelligently direct that request to a Pod on the same Node as opposed to a Pod on a random Node (this approaches the network overhead).

### Master Nodes

> How do you schedule Pods, monitor Pods, re-schedule/restart Pods, and join Pods to new Nodes?

Master Nodes have completely different processes than Worker Nodes. **Four processes  run on every master node (shown below).** A Kubernetes cluster is often made up of multiple Master Nodes where the `API Server` is load-balanced and the `etcd` component is a distributed storage element shared across all master nodes.

Typically, Master Nodes (while important) require less resources than Worker Nodes. As an application grows and its complexity increases, you may (definitely will) add more master and worker node servers to your cluster. The process of setting up these new nodes/servers boil down to: get a new server, installed all the master/worker node processes, and then add it to the K8 cluster.

#### Master Node Components

1.`API Server`. Used to deploy a new application in a K8 cluster, you would use some sort of client (K8 Dashboard, Kubelet CLI, K8 API, etc.) to interface with the `API Server`. In short, `API Server` is a "cluster gateway". It receives the initial request of any updates to the cluster or queries from the cluster. **Also serves as a gatekeeper for authentication.** Example: some request hits the `Api Server`, it validates the request, passes it to other processes, and then it's completed. It's good for security because it results in _one entrypoint_ into the cluster.
1. `Scheduler`. After a request is validated by the `API Server` it is handed off to the `Scheduler` to actually start the process (like starting an application Pod) on a Worker Node. `Scheduler` is an intelligent service that knows which Worker Node(s) the next Pod/component should be scheduled to. In practice, `Scheduler` will look at the Worker Nodes and select whichever Node has the most resources available. `Scheduler` selects the suitable Node but the Node's **`Kubelet` handles the actual process of executing the request on the Node.** 
1. `Controller Manager`. Detects state changes on a Cluster (like a Pod crashing). When a Pod dies, `Controller Manager` detects the change and tries to resolve it as fast as possible. In order to do that, `Controller Manager` makes a request to the `Scheduler` to reschedule those dead pods. At this point, `Scheduler` determines the best Nodes to restart the Pods and sends the requests to the appropriate Node's `Kubelet` component for execution.
1. `etcd`. A key-value store of a cluster state (the clusters brain). Every change in the cluster (a new pod is schedules, a pod dies, etc.) gets recorded in the `etcd` component's key-value store. All of the other components in this list work off of the data contained within the `etcd` component. All cluster state information is stored within `etcd` and is used for master processes to communicate with work processes and vice-versa.

## Review

### Questions:
1. What is a Worker Node?
1. What is a Master Node?
1. What 3 processes must be installed on every worker node?
1. What is the container runtime?
1. What is the `Kubelet`?
1. What does `Kubelet` interface with?
1. What is the `Kube Proxy`?
1. What are the 4 processes run on every master node?
1. What is the `API Server`?
1. What is the `Scheduler`?
1. What is the `Controller Manager`?
1. What is the `etcd` component?
1. Clusters usually have multiple Master and Worker nodes. Which component serves as the Master Nodes' Load Balancer and how is `etcd` setup to share key-value state across all the Master Nodes?
1. Which Node type requires more resources?
1. Which MN component serves as the "Cluster Gateway" and authenticator?
1. What are some clients that can interact with the `API Server`?
1. Which MN component starts the process send from the client? Which component actually executes the request on the Worker Node?
1. Which MN component detects state changes? If it detects a state change, which process does it send the request to fix it to?
1. What type of storage is `etcd` and what does it record? Is all cluster data stored on `etcd`?
