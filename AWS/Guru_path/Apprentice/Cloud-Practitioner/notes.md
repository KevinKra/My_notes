# AWS Cloud Practitioner

> Content necessary for the AWS Cloud Practitioner certificate.

---

# Cloud Concepts and Technology

#### What is Cloud Computing?

- Cloud Computing is the on-demand delivery of compute, database storage, applications, and other IT resources, through a cloud services platform with pay-as-you pricing.

### Six Advantages of Cloud Computing

1. Trade Capital Expense for Variable Expense.

   > Instead of having to invest in data centers and servers before knowing you will use them, you can pay for only how many computing resources you consume.

2. Benefit from massive economies of scale.

   > Leverage the powers and infrastructure of powerful companies like Amazon.

3. Stop guessing about capacity.

   > No longer have to deal with situations of too little or too much provisioned capacity. Cloud scales dynamically and automatically with business needs without being restricted by contracts or physical limitations.

4. Increase speed and agility.

   > Leveraging the cloud allows you to build platforms rapidly by taking advantage of serverless architecture.

5. Stop spending money running and maintaining data centers.

   > Focus on what matters, not managing infrastructure. Let others manage that for you.

6. Go Global in minutes
   > Easily deploy applications in multiple regions around the world in minutes. This provides lower latency and better experience for customers while incurring minimal costs.

### Three types of Cloud Computing

- IaaS
  > example: EC2
- PaaS
  > example: AWS Lightsail, GoDaddy, Heroku, ElasticBeanStalk, etc.
- SaaS
  > example: Gmail

### Three types of Cloud Deployments

- Public Cloud
  > AWS, Azure, GCP
- Hybrid
  > Mixture of public and private. Example: Public information on public cloud, employee information on private cloud.
- Private Cloud (or on premise)
  > You manage it in your data center.

### Factors in determining the correct Region

- Data Sovereignty laws
- Latency
- AWS services

### Questions:

- What are the six advantages of cloud computing?
- What are three types of cloud computing?
- What are the three types of Cloud Deployments?
- What are the three main factors in determining the correct region to setup into?

---

## AWS Account Details

### AWS Support Plans

- **Basic**
  1. **Price:** Included
  2. **Details:** Customer service for account and billing questions and access to AWS forums.
- **Developer**
  1. **Price:** Starts at \$29/month. Scales with usage.
  2. **Details:** One primary contact that you can ask technical questions to and expect an answer in 12-24 hours.
  3. **Use Case:** AWS experimenting.
- **Business**
  1. **Price:** Starts at \$100/month. Scales with usage.
  2. **Details:** 24/7 support by phone and chat. 1-hour response for urgent cases.
  3. **Use Case:** Production use of AWS.
- **Enterprise**
  1. **Price:** Starts at \$15,000/month. Scales with usage.
  2. **Details:** All business features. Assigned **Technical Account Manager (TAM)**. 15-minute response to critical support needs.
  3. **Use Case:** Mission-critical usage of AWS.

### Questions:

- What are the four different AWS support plans?
- What are the details, costs, and use cases, of each support plan?

---

## IAM

- **IAM, Identity Access Management**, allows you to create users, roles, groups, and policies, that establish permissions that can be used across an AWS instance.
- When you add a User to a Group they will inherit all the privileges delegated to the group.
- IAM is **Global**, you do not need to specify a region.
- **Root Account** is the email used to set up your AWS account. Root account has full admin access, even more than standard full-admins, and is essentially the god account.
- To give permissions to a group you need to create a policy. **Policies are written in JSON.**

### Adding Users

- There are three ways to grant users access to AWS.

  1. Programmatic Access - Enables an **access key ID** and **secret access key** for the AWS API, CLI, SDK, and other de tools.
  2. Console Password - Enables a **password** that allows users to sign-in to the AWS management console.
  3. Using the Software Development Kit, SDK.

### Questions:

- What are the three ways for users to gain access to AWS?
- What does IAM stand for, what is it's purpose?
- What are the IAM permission formats?
- Is IAM regional or global?
- Explain the root account.
- How can you give permissions to a group, what language are they written in?

---

## S3

- **S3, Simple Storage Service**, one of the oldest and most fundamental resources in AWS. It provides developers and IT professionals with secure, durable, and highly scalable **object-based storage**. Object-based storage is ideal for storing flat-files, or data that doesn't need to constantly change (ie. not databases) like images, text documents, etc. OBS differs from **Block-based storage**, which is intended to store Databases, Operating Systems, etc.
- Amazon S3 is easy to use and allows the storage and retrieval of objects from anywhere in the world. It is comprised of buckets (directories), that have universal namespace, and objects that represent files ranging in size from 0B to 5TB. S3 is broken into several tiers: S3 Standard, S3 - IA, S3 one-zone IA, S3 Glacier, S3 Glacier - Deep Archive, and the newest tier S3 Intelligent Tiering.

### S3 Features

- Lifecycle Management
- Versioning
- Storage classes/tiers (can be changed on the fly)
- Encrypt Files at Rest
- Access Control Lists (file level restrictions and permissions)
- Bucket Policies (bucket level restrictions and permissions)
- Object size: 0B - 5TB
- Unlimited storage
- Files are stored in buckets
- Buckets must have universally unique names because buckets create DNS addresses and therefor must be unique.
- Universal name example: `https://s3-eu-west-1.amazonaws.com/myTotallyUniqueBucketName5000`
- You will receive a **HTTP 200 code** if an upload was successful.
- All S3 tiers except S3 one-zone store data in 3 or more AZs.

### S3 Tiers

- S3 - Standard
  > Standard tier providing immediate retrieval of data with the added benefits of amazon's cloud promising 99.99% availability and %99.999999999 durability.
- S3 - IA
  > Infrequently Accessed. Lower recurring cost than S3 standard but has additional retrieval costs for objects that are stored in this tier. Note: retrieval time for IA is **just** as fast as standard.
- S3 one-zone IA
  > Infrequently Accessed. Even cheaper recurring cost than S3-IA due to reduced inherent data durability as a result of being stored in one zone. Note: retrieval time for IA is **just** as fast as standard.
- S3 Glacier
  > Archived Data. Significantly reduced recurring cost. Data that is not intended to retrieved immediately, can take minutes or hours before response is sent out.
- S3 Glacier - Deep Archive
  > Archived Data. Lowest cost of all options. Data is not intended to be received in a fast pace, up to 12 hours retrieval time before response is sent out is acceptable.
- S3 Intelligent Tiering
  > Uses machine learning algorithms to automatically adjust object storage tiers based on use and demand without additional performance impact or operation overhead. An alternative or support mechanism that can work alongside S3 Lifecycles.

### S3 Charges

- Storage
- Requests
- Storage Management Pricing
- Data Transfer Pricing
- Transfer Acceleration
  > Leveraging the CloudFront CDN network to reduce data upload times. When a user uploads a file, the file arrives at the nearest edge location, it is then routed to the Amazon S3 bucket over an optimized super-fast network path. It travels across amazon's network, not the general internet backbone.
- Cross Region Replication
  > Replicating data across different regions for security and durability reasons.

### S3 Objects

- Consist of a Key, Value
- Key (name of the object)
- Value (data of the object)
- Version ID (important for versioning)
- Metadata (Data about your data)
- Subresources
  1. Access Control Lists
  2. Torrent

### S3 Data Consistency

- POSTs have immediate consistency or **Read after Write.**
  > Notes say PUT but POST would be more accurate in regards to RESTful architecture patterns regarding new data being submitted.
- PUTs / DELETEs have **eventual consistency.** Can take time to propagate, or update data. There is potential for seeing previous versions of files before the propagation updates the file.

### Ways to restrict access to Buckets?

- Bucket Policies
- Object Policies
- IAM Policies to Users and Groups

### Questions:

- What is block based storage?
- What is object based storage?
- Is data stored across multiple devices and multiple facilities?
- Where are objects stored and what is their size range?
- Does S3 allow unlimited storage?
- What does S3 is a universal namespace mean?
- What does an S3 bucket url look like?
- What kind of response do you get if a bucket was successfully uploaded?
- What does it mean to say that S3 objects are essentially a key-value store?
- In addition to the key and value, what other data exists on an S3 object?
- What is the Data consistency for PUT, POST, DELETE?
- Why is there potential for seeing older versions of a file if you immediately try reading it after deletion / editing?
- What is the difference between Access Control Lists and Bucket Policies?
- Explain S3 Transfer Acceleration.
- Explain S3 Cross-region-replication.
- Is S3 regional or global?
- Can you change Storage Tiers on the fly?
- What are 3 ways to restrict bucket access?
- Are buckets public by default?
- Can you host static websites on S3?
- Does S3 automatically scale to demand?

---

## Elastic Load Balancing

- Elastic Load Balancing distributes incoming application or network traffic across multiple targets, such as Amazon EC2 instances, containers, and IP addresses, in multiple AZs.
- Elastic Load Balancing scales your load balancer as traffic to your application over time, it can automatically scale to the vast majority ov workloads.

#### Load Balancer components

- **Load balancer** - serves as the single point of contact for clients and it distributes incoming traffic across multiple targets.
- **Listener** - checks for connection requests from clients, using the protocol and port that you configure. The rules that you define for a listener determine how the load balancer routes requests to its registered targets.
- **Target Group** - routes requests to one or more registered targets, such as EC2 instances, using the protocol and port number you specify.

### Types of LoadBalancers

- Application Load Balancers
  > Application aware and can make intelligent routing decisions. Layer-7 aware (makes intelligent decisions).
- Network Load Balancers
  > Ultra-high performance and static ip addresses.
- Classic load Balancers
  > Testing and Development, keep costs low. Getting phased out.

#### BootStrap Scripts

```
#!/bin/bash/
yum update -y
yum install httdp -y
service httpd start
chkconfig on
cd /var/www/html
echo "<html><h1>Hello</h1></html>" > index.html
```

### Questions:

- What is Elastic Load Balancing?
- What does a load balancer do?
- Describe the overview of networking traffic interacting with a load balancer.
- What are the three types of load balancers?
- Why should you always aim to have EC2 servers in multiple AZs?

---

## Databases 101

### Types of Databases:

- **Relational Databases (RDS)**

  > Consists of Tables composed of rows and a fixed number of columns. Need to be well-planned in advance.

  - AWS RDS as two key features:
    - **Multi-AZ**: For disaster recovery and protection. If you lose on AZ, RDS will **automatically** fail-over to the other AZ and access that RDS.
    - **Read Replicas**: Copies of the production database, EC2s can be instructed to read from the read-replicas instead of the production database thus increasing performance. If your primary database fails, AWS will **not** automatically fail-over to the read-replica. A **solution:** EC2 instances can send all their writes to the primary RDS and read from the replicas. This architecture also provides for greater performance because while the writes all go to the primary RDS, all the EC2 reads will be spread across the (up to 5) read replica RDS.
  - Types:
    - Microsoft SQLserver
    - Oracle
    - MySQL
    - Amazon Aurora
    - MariaDB

- **Non-relational Databases**
  > Consists of Collections composed of documents made up of key value pairs. Key value pairs can be added individually to documents.
  - Types:
    - DynamoDB

### Data Warehousing

- Data Warehousing databases use different type of architecture both from a database perspective and an infrastructure layer.
  - Types:
    - **AWS Redshift (OLAP)** - built from the ground up for the OLAP purpose. use RedShift instead of RDS for OLAP.

#### OLTP vs. OLAP

- **Online Transaction Processing (OLTP)** differs from **Online Analytics Processing (OLAP)** in regards to the types of queries you will run.

- OLTP example: Reading or writing a row from a database. Order number 213851, pull up row of data including: Name, Date, address to deliver to, delivery status, etc.
- OLAP example: Net Profit for EMEA and Pacific regions for the Digital Radio Product. Pulls in _large numbers of records_: Sum of radios sold in EMEA, Pacific, unit costs of radios, etc.

- **Data Warehousing** - Used for business intelligence. Tools like Cognos, Jaspersoft, etc. are used to pull in very large and complex data sets. The concept was invented to keep all of the complex processes involved with OLAP separate from the primary database, so it doesn't impact the its performance. Instead, there is a secondary database (specifically built for OLAP) that can instead manage the queries.

### ElastiCache

- ElastiCache is a web service that makes it easy to deploy, operate, and scale an in-memory cache in the cloud. The service improves the performance of web applications by allowing you to retrieve information from fast, managed, in-memory caches, instead of relying entirely on slower disk-based databases. ElastiCache caches common DB queries in its own servers and allows future queries to interact with ElastiCache instead of going through the slower route of interacting with the DB. ElastiCache takes a tremendous load off the primary production DB because the most common queries will interact with EC leaving only uncommon queries to request from the primary DB.

- ElastiCache comes in two different caching engines:
  - Memcached
  - Redis

### Questions:

- What is an RDS?
- Explain Multi-AZ.
- Explain Read Replicas.
- What are the 6 types of RDS available on AWS?
- What is the structure of an RDS?
- What is the structure of an noSQL non-relational database?
- What is the key difference between RDS and noSQL?
- What is Data Warehousing?
- What is amazons Data Warehousing technology?
- What is the structure and use-cases of OLTP and OLAP?
- What does OLTP and OLAP stand for?
- What does ElastiCache do?
- What is an ElastiCache use case?
- What are the two current ElastiCache engines?

---

## Route53 101

- Route53 is an AWS DNS service.
- DNS works on port 53 hence the name.
- Route53 is **Global**
- You can use Route53 to direct traffic and it can be used to register a domain name.
- DNS is a service computers use to resolve domain names to IP addresses.

### Questions

- what is Route53?
- Is Route53 regional or global?

---

## AWS Provisioning 101

### Elastic Beanstalk

- Allows for the provisioning of AWS resources in just a few clicks and easily deploying applications to the cloud.
- **Free Service**, though what they provision may not be.

### CloudFormation

- consists of stacks
- **Free Service**, though what they provision may not be.

### Questions

- What is Elastic Beanstalk?
- What is CloudFormation?
- What are the similarities and differences between Elastic Beanstalk and CloudFormation?

---

### Amazon Cloud Whitepaper

#### Scalability

- **Scale up**
  > Upgrading the infrastructure currently being utilized by an account. Example: Upgrading the EC2 instance from t family to m family.
- **Scale out**
  > Adding multiple virtual machines behind an elastic load balancer (more common to scale out than scale up.)
  - **Stateless Applications** - an application that doesn't hold state (lamba) and forgets after interaction.
  - **Distribute Load to Multiple Nodes** - Example: RDS read-replicas.
  - **Stateless Components** - The more stateless components, the easier it is to scale a platform. Ex: Signing into a website, instead of storing user data on a webserver, store their data on the user's browser as a cookie.
  - **Stateful Components** - Storing information in a database.
  - **Implement Session Affinity** - _Sticky session_, putting a cookie in a user's browser. An ALB will detect the cookie and send the user to a specific EC2 instance.
  - **Implement Distributed Processing** - _Elastic Map Reduce_ Using fleets of EC2 instances to process extreme amounts of data. Big data handling.

#### Disposable Resources

- Instantiating compute resources
  - **Bootstrapping** - Helps in avoiding the need to repeat steps every single time between setups.
  - **Golden Images** - Taking an Image of an EC2 instance after it was set up and configured and then using that "golden image" to serve as the setup for additional EC2 Instances.
  - **Containers** - null
  - **Hybrid** - Hybrids of containers and EC2 instances

#### Automation

- Aim for things to be serverless, when everything is serverless you don't need to worry about infrastructure or your tools because they will take of themselves (Amazon's job is to maintain that infrastructure.)
- Infrastructure Management and Deployment
  - AWS Elastic Beanstalk
  - AWS CloudFormation
  - Amazon EC2 auto recovery
  - AWS Systems Manager
  - Auto Scaling

#### Alarms and Events

- Amazon CloudWatch alarms - example: billing alert.
- Amazon CloudWatch Events - **Proactive responses to events.** example: can be used to detect if images have been uploaded to S3, can trigger a Lamba function to create a watermark on the image.
- AWS Lamba Scheduled Events
- AWS WAF security automations

#### Loose Coupling

- Components should be loosely coupled in order to avoid failures from impacting other systems.
- Well defined Interfaces
  - Amazon API Gateway
- Service Discovery
  - Implement Service Discovery

#### Distributed Systems Best Practices

- Graceful Failure in practice
  > If there is an issue with a page, show an error html page and send alert

#### Aurora

- Scalable
- Compatible with mySQL and PostgreSQL
- High Availability - Multi-AZ
- 6 copies of data across >= 3 AZs
- **Anti-patterns**- _Where you wouldnt use a technology..._ If no need for joins or complex transactions then use noSQL.

#### DynamoDB

- Scalable
- Push button scalability, autoscaling built in
- High Availability - Multi-AZ
- **Anti-patterns** - Data that requires joins or complex transactions, use a relational DB. If you have large binary files (video, audio, images) consider using S3.

#### Redshift

- Scalable
- High Availability - Multi-AZ
- **Anti-patterns** - Not meant for OLTP

#### Graph Databases

- Scalable
- High Availability
- Neptune

#### Data Lake

- A data lake is an architectural approach that allows you to store massive amounts of data in a central location so that it's readily available to be categorized, processed, analyzed, and consumed by diverse groups within your organization. Since data can be stored as-is, you do not have to convert it to a predefined schema, and you no longer need to know what questions to ask about your data beforehand.
- S3 is a great place to create data lakes and using services like Athena would allow you to run SQL queries on that data.

#### Removing Single Points of Failure

- Introducing redundancy
- Detect failure
- Durable data storage
- Automate multi-data center resilience
- Fault Isolation and traditional horizontal scaling (scaling out)
- **Sharding** - splitting data across multiple shards allowing faster data processing.

#### Optimization Patterns

- Correct sizing
- Elasticity
- Take advantage of purchasing options (EC2 Spot, reserved instances, etc)

#### Caching

- Application Caching - Elasticache
- Edge Caching - Cloudfront

#### Security

- Use AWS features for defense in depth
- Share security responsibility with AWS
- Least privilege for users
  **- Security as Code - Create Golden Images of hardened EC2 instances and instantiate these hardened EC2 instances around the world.**
- Real-time Auditing (CloudTrail)

### Questions

_Scalability_

- Describe Scaling Up and Scaling Out.
- What is a stateless application, what is an example of one?
- What is an example of distributing loads to multiple nodes?
- Benefits of stateless components, example?
- What is the difference between stateless components and stateful components?
- What is session affinity / sticky session?
- Describe distributed processing and EMR.

_Disposable Resources_

- Describe two ways to instantiate compute resources.
- What is a golden image?
- What is bootstrapping?

_Automation_

- Why should you aim for serverless infrastructure?
- What are the inherent benefits of serverless architecture?
- What are some AWS solutions to Infrastructure Management and Deployment?

_Alarms and Events_

- What AWS service handles alarms and events?
- What is an example of an alarm?
- What is an example of an event?
- How could a severless function in lamba interact with a CloudWatch triggered event?

_Loose Coupling_

- What is the objective behind loose coupling?

_Distributed Systems Best Practices_

- Describe Graceful failure and provide an example.

_Aurora Features_

- What relational databases is Aurora compatible with?
- Relational DB anti-patterns?
- Does Aurora have multi-az support?

_DynamoDB Features_

- Does DynamoDB have autoscaling features?
- What are non-relation DB anti-patterns?
- What is a suitable service to store large binary files?
- What should you use if you have data that requires joins or complex transactions?
- Does DynamoDB have multi-az support?

_Redshift_

- What is OLTP?
- What is OLAP?
- Does Redshift have multi-az support?
- What is RedShift's anti-pattern?

_Neptune_

- What is Neptune?

_Data Lake_

- What is a data lake?
- Do you need to convert the data in a data lake ot a schema?
- What is an AWS service that is suitable for creating data lakes?
- What AWS service could you use to run SQL queries on data in a data lake?

_Removing Points of Failure_

- What is redundancy?
- What is sharding?
- How can fault isolation and traditional horizontal scaling provide resilience to a network?

_Optimization Patterns_

- How does sizing, elasticity, and purchase options, provide optimization to a network?

_Caching_

- What are the two types of caching provided by AWS?
- What is an example of application caching?
- What is an example of edge caching?

_Security_

- What service provides real-time auditing?
- What does it mean to use hardened EC2 instances as golden images?
- Describe the concept of designing with least privilege.

---

## Global AWS services

#### Global

- IAM
- Route53
- CloudFront
- SNS
- SES

#### Regional

- **S3 (has global view)** - appear global but are actually in specific regions

### Question

- What are the AWS (5) global services?
- What AWS service has a global view but is actually regional?

---

## On Premise AWS Services

> The AWS services that can be used inside your own data centers or corporate office.

- **Snowball** - A massive disk that you load your data onto and send back to Amazon, **typically 80TB of size,** and then AWS loads the data onto S3.
- Snowball Edge - similar to snowball but also has CPU with storage that allows you to write Lamba functions on premise. **Snowball Edge is useful for where you cannot get AWS connectivity but still need AWS resources**.
- **Storage Gateway** - Similar to snowball, but it **stays on premise at all times**. Can be a physical or virtual device in your data center or HQ. Replicates files directly to S3 and in the event you lose internet connection you still have the device and it's files on premise to provide the data.
- **CodeDeploy** - Deploy your code to EC2 instances or on premise web-servers as well. Deploys code.
- **Opsworks** - Similar to Elastic Beanstalk, allows for automated deployments to EC2 instances and on premise web-servers.
- **IoT Greengrass** - Connects devices to the AWS cloud.

#### Which AWS services can be used to deploy applications on premise

- CodeDeploy
- Opsworks

### Question

- What are six on premise AWS services?
- Describe a situation suitable for AWS Snowball.
- Describe a situation suitable for AWS Snowball edge.
- What does Storage Gateway provide, how is it similar to snowball?
- Which two on premise services deploy code?
- What is IoT Greengrass?

---

## AWS Systems Manager

> Allows you to manage EC2 instances at scale. Imagine having hundreds of EC2 instances (an EC2 fleet) that you need to run a yum update on.

- AWS created Systems Manager, when you deploy an EC2 instance you install a piece of software on that VM which connects that EC2 instance to System Manager. Then, System Manager can be used to run commands across the EC2 fleet.
- Run Command is used to install, patch, and uninstall software.
- Integrates with CloudWatch to give a dashboard of the entire EC2 fleet estate.

### Questions

- What type of service does AWS Systems Manager provide?
- Does anything need to be added to instantiated EC2 instances to connect them to AWS Systems Manager?
- Can AWS Systems Manager be integrated with any other AWS services?

---

## Cloud Concepts and Technology Summary

### The six advantages of the cloud

- Trade Capital Expense for Variable Expense
- Benefit from massive economies of scale
- Stop Guessing about capacity
- Increase Speed and Agility
- Stop spending money maintaining infrastructure
- Go Global in minutes

### Three types of Cloud Computing

- IaaS, Infrastructure as a Service
  > EC2, S3, etc.
- PaaS, Platform as a Service
  > ElasticbeanStalk, Heroku, etc.
- SaaS, Software as a Service
  > Gmail, Google Docs, etc.

### Three Types of Cloud Computing Deployments

- Public
  > AWS, Azure
- Hybrid
  > Applications that are both hosted in the cloud and in traditional data centers.
- Private
  > You manage it in your data center using vmware or openstack.

### Regions, AZs, Edge locations

- Regions
  > Consist of >=2 AZs
- Availability Zones
  > One or more discrete data centers with redundancies in power, connectivity, devices, and networks.
- Edge Locations
  > Endpoints used by AWS to cache content, typically consists of CloudFront (Amazons content delivery network/CDN)

### What to consider when choosing a region.

- Data Sovereignty laws
- Latency to end users
- Needed AWS services
  > Does the region have the services you need like glacier for instance.

### Different Support Packages

- Basic
  > Free
- Developer
  > \$29/month (scales on usage)
- Business
  > \$100/month (scales on usage)
- Enterprise
  > \$15,000/month (scales on usage) + full-time Technical Account Manager (

### IAM

- Identity Access Management
- You don't specify a region, it is **global**, when you create a user or group it is created **globally**.
- Roles and users are global.

### Three ways to access the AWS console

- Via the console (duh)
- Programmatically (using the CLI)
- Using the Software Developers Kit (SDK)

### Root Account

- Account made with your AWS account
- _God_ access to everything
- **Do not share** the account credentials with anyone
- Create users for individuals in your organization
- Protect with MF

### S3

- Object Based
- 0B - 5TB
- Unlimited storage
- Buckets / Objects
- Universal name space
- Not suitable for installing OSs on
- Uploads send a 200 status code
- Key, value, metadata, versioning, subresources
- data consistency variants on puts / deletes / posts
- You _can_ have buckets in regions, but you can still see them all globally
- opt-in automatic Cross Region Replication (CRR)
- Transfer Acceleration
- Six Different types of S3: S3 standard, S3-IA, S3 one-zone IA, S3 Glacier, S3 Glacier Deep Archive (2018), S3 Intelligent Tiering (2018)
- Bucket and Object level policies
- S3 can host static websites
- Websites that need DB connections cannot be hosted on S3
- S3 scales automatically with demand, great for static websites
- S3 & CloudFront

### CloudFront

- A collection of CDN Edge Locations is called a **distribution**.
- Edge location is a location that caches data
- Origin is the origin of all the files that the CDN will distribute. Can be an instance of: S3 Bucket, EC2, Route53, Elastic Load Balancer
- Web Distribution - Typically used for Websites
- RTMP - used for media streaming (Adobe flash)
- Can be **Read & Write**
- **Time to live, TTL** - objects are cached for the life of the TTL (always in seconds.)
- You can clear cached objects from the edge location, **but you will be charged.**

### Common Ports

- Linux = SSH - Port 22
- Microsoft = Remote Desktop Protocol (RDP) - Port 3389
- HTTP - Port 80
- HTTPS - Port 443

### Firewalls

- 0.0.0.0/0 - lets everything in
- x.x.x.x/32 - specific IP address
- **Security Groups** are virtual firewalls. Everything is blocked by default

### General

- Always design for failure
- Have one EC2 Instance in each availability zone

### Security

- **Do not store credentials on EC2 instances.** Use roles instead.
- Roles can be applied to EC2 instances at any time, changes take place immediately.

### Three Types of Load Balancers

- Application Load Balancers
  > Layer-7 (make intelligent routing decisions)
- Network Load Balancers
  > Extreme Performance/Static IP Addresses
- Classic Load Balancers
  > Test & Dev, keep costs low.

### Databases

- RDS: SQL, MySQL, PostreSQL, Oracle, Aurora, MariaDB
- RDS two key features: Multi-AZ (durability), Read Replicas (performance)
- NoSQL: DynamoDB
- OLAP: RedShift
- Redshift - Database Warehousing
- Elasticache - Dramatically speeds up performance of existing databases

### Elasticache

- Caching service for very frequently queried DB blocks
- Memcached
- Redis

### Graph Databases

- Scalability
- High Availability
- AWS Neptune

### Autoscaling

- Autoscaling allows you to provision multiple EC2 instances behind a load balancer automatically depending on your demand.

### DNS (Domain Name System) Route53

- Amazons DNS is called Route53
- DNS is on port 53
- **Route53 is global**, similar to IAM and S3
- Works exactly like a phonebook. It's the process that computers use to resolve domain names to IP addresses.
- You can use it to direct traffic all around the world and you can use it to register a domain name.

### Elastic Beanstalk

- What developers use if they don't know how to use AWS.
- Allows you to quickly deploy and manage applications in the AWS Cloud without worrying about the infrastructure that runs those applications. You simply upload your application and Elastic Beanstalk automatically handles the details of capacity provisioning, load balancing, scaling, and application health monitoring.
- **Free resource**, though what it provisions might not be.
- **Limited in what it can provision. Not Programmable.**

### AWS CloudFormation

- What developers use if they know how to use AWS.
- Helps you model and set up your AWS resources so that you spend less time managing those resources and more time focusing on your applications that run in AWS.
- You create a template that describes all the AWS resources that you want and AWS CloudFormation takes care of provisioning and configuring those resources for you.
- You don't need to individually create and configure AWS resources and figure out what is dependent on what, AWS CloudFormation handles that.
- CF template is a JSON object.
- **Free resource**, though what it provisions might not be.
- **Can provision almost any AWS service. Completely programmable.**

### Global Services

- IAM
- Route53
- CloudFront
- SNS
- SES

### AWS that can be used on premise

- Snowball
- Snowball Edge
- Storage Gateway
- CodeDeploy
- Opsworks
- IoT Greengrass

### CloudWatch

- CloudWatch is used for monitoring performance
- CloudWatch can monitor most of AWS as well as applications that run on AWS
- CloudWatch with EC2 will monitor events every 5 minutes by default
- You can have 1 minute intervals by turning on detailed monitoring

### AWS Systems Manager

- Used to manage fleets of EC2 instances and virtual machines
- A piece of software is installed on each VM
- Can be both inside AWS and on premise
- Run Command is used to install, patch, uninstall software
- Integrates with CloudWatch to give a dashboard of entire estate

---

## Quiz Questions

- Which of the following are not valid CloudFormation template sections?
  [resource](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html)
- Which of the following Route 53 policies allow you to a) route data to a second resource if the first is unhealthy, and b) route data to resources that have better performance?

  > Failover Routing and Latency-based Routing are the only two correct options, as they consider routing data based on whether the resource is healthy or whether one set of resources is more performant than another. Any answer containing location based routing (Geoproximity and Geolocation) cannot be correct in this case, as these types only consider where the client or resources are located before routing the data. They do not take into account whether a resource is online or slow. Simple Routing can also be discounted as it does not take into account the state of the resources.

- Choose the features of Consolidated Billing.

  > Consolidated Billing is a feature of AWS Organizations. Once enabled and configured, you will receive a bill containing the costs and charges for all of the AWS accounts within the Organization. Although each of the individual AWS accounts are combined into a single bill, they can still be tracked individually and the cost data can be downloaded in a separate file. Using Consolidated Billing may ultimately reduce the amount you pay, as you may qualify for Volume Discounts. There is no charge for using Consolidated Billing.

  [resource](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/consolidated-billing.html)

---

# Billing and Pricing

> Pay as you go, pay for what you use, pay less for more, and pay even less when you reserve capacity

## AWS Billing and Pricing

### Capex vs. Opex

- **Capex stands for Capital Expenditure** where you pay upfront. It's a fixed, sunk cost.
- **Opex stands for Operational Expenditure**. You pay for what you use as you use them.

### Pricing Policies

- Pay as you go
- Pay less when you reserve
- Pay less for more
- Pay even less as AWS grows
- Custom Pricing

#### Key Principles of Pricing Models

- Understand the fundamentals of pricing
- Start early with cost optimization
- Maximize the power of flexibility
- Use the right pricing model for the job

### Three Fundamental drivers of Cost with AWS

- Compute
- Storage
- Outbound Data

### Starting Early with Cost Optimization

- It's never too early to start with cost optimization in cloud. Furthermore, It's easiest to put cost controls in place _before_ the environment grows to large.
- Managing costs effectively from the start ensures that managing cloud investments doesn't become an obstruction as you grow and scale.

### Maximizing Flexibility

- AWS services are priced independently and transparently, so you can choose and pay for exactly what you need and no more.
- There are no minimum commitments or long-term contracts that are required, _unless_ you choose to save money through a reservation model.
- By paying for resources as needed, you can redirect your focus to innovation and invention allowing your business to be elastic.
- One of the key advantages of cloud-based resources is that you don't pay for them when they're not running. By turning off instances you don't use, you can significantly reduce costs.

### EC2 Price Models

- On Demand
- Dedicated Instances
- Spot
- Reservations

#### Free Services

- VPC (a virtual data center in the cloud)
- Elastic Beanstalk
- CloudFormation
- IAM
- Auto Scaling
- Opsworks (similar to EB)
- Consolidated billing

### Questions

- What is Capex?
- What is Opex?
- Describe an example of Capex vs Opex.
- What is the AWS pricing mantra?
- Describe the four key principles of pricing models.
- What are the three fundamental drivers of cost in AWS?
- Is it ever too early to start with cost optimization?
- What does early optimization ensure over the lifetime of a platform?
- What does it mean to maximize flexibility, how can this be accomplished?
- Would turning off instances when you're not using them reduce costs?
- What are the EC2 price models?
- What are the seven free AWS services?

---

## AWS Billing Per Service

### EC2 Pricing

- Detailed Monitoring
- Operating Systems and Software Packages (Windows cost more than an open-source OS like Linux)
- Clock hours of server time
- Pricing model
- Instance type
- Load Balancing
- Elastic IP Addresses (Every time we created an EC2 instance we are given an IP address)
- Auto Scaling (more EC2 instances the more you pay)
- Number of instances

### Lambda Pricing

- Request Pricing
  - Free Tier: 1 million requests per month
  - \$0.20 per 1 million requests thereafter
- Duration Pricing
  - 400,000 GB-seconds per month free, up to 3.2 million seconds of compute time
- Additional Charges
  - If Lambda uses other AWS services or transfers data.
  - Example: if Lambda function reads and writes data to or from S3, you will be billed for the read/write requests and data stored in S3.

### EBS Pricing

- Snapshots (per GB)
- Volumes (per GB)
- Data Transfers

### S3 Pricing

- Storage Class
- Storage amount
- Number of Requests (GET, POST, PUT, DELETE)
- Data Transfers

- Glacier
  - Data Retrieval times, the longer the retrieval time the more cost savings

### Snowball Pricing

- Petabyte-scale data transport solution that uses secure technology (snowball) to transfer large amounts of data into and out of the AWS cloud.

- Service fee per job
  - Snowball 50TB: \$200
  - Snowball 80TB: \$250
- Daily Charge
  - first 10 days are free, \$15 per day after that.
- Data Transfers
  - **Data transfer into S3 is free. Data transfer out from S3 into a snowball is not.** (keeps people on the platform)

### RDS Pricing

- Clock hours of server time
- Database characteristics (type of database)
- Database purchase type (how large the database is)
- Number of database instances
- Provisioned storage (how big are the databases going to be)
- Additional storage
- Requests
- Deployment type
- Data transfers

### DynamoDB Pricing

- Provisioned Throughput (write)
- Provisioned Throughput (read)
- Indexed data storage (amount of storage saved inside of DB)

### CloudFront Pricing

- Requests
- Traffic Distribution
- Data transfers

### Questions

- What are the 9 EC2 pricing vectors? (DOCPILEAN)
- What are the 3 Lamba pricing vectors? (RDX)
- What are the 3 EBS pricing vectors? (SVD)
- What are the 4 S3 pricing vectors? (CAND)
- What is an additional pricing vector for S3 Glacier?
- What are the 3 Snowball pricing vectors? (SDDo)
- How much does a Snowball 50TB cost? 80TB?
- How many days is Snowball free, how much does it cost per day after that?
- Are data transfers in and out of S3, using SnowBall, free?
- What are the 9 RDS pricing vectors?
- What are the 2 noSQL pricing vectors? (PI)
- What are the 3 CloudFront pricing vectors? (RTD)

---

## AWS Budgets vs Cost Explorer

#### AWS Budgets

- AWS budgets gives you the ability to set custom budgets that alert you when your costs or usage exceed, or are forecast to exceed, your budgeted amount.
- Used to budget costs **before** they have been incurred.

#### AWS Cost Explorer

- AWS Cost Explorer allows you to visualize, understand, and manage your AWS costs and usage over time.
- Used to explore costs **after** they have been incurred.

### Questions

- What does AWS Budgets handle?
- What does AWS Cost Explorer handle?
- What is the difference between Budgets and Cost Explorer?

---

## AWS Support Plans

- **Basic**
  - null ;(
- **Developer**
  - General guidance: under 24 hours
  - System impaired: under 12 hours
  - Production system impaired: null
  - Production system down: null
- **Business**
  - General guidance: under 24 hours
  - System impaired: under 12 hours
  - Production system impaired: under 4 hours
  - Production system down: under 1 hours
- **Enterprise**
  - General guidance: under 24 hours
  - System impaired: under 12 hours
  - Production system impaired: under 4 hours
  - Production system down: under 1 hours
  - Business-critical system down: under 15 minutes

### Questions

- What are the differences between each AWS support plan?

---

## Resource Groups and Tags

### Tags

- Tags are key-value pairs attached to AWS resources.
- Metadata
- Tags can be inherited
- Contain specific information
  - Examples:
    - EC2 - Public and Private IP Addresses
    - ELB - Port Configurations
    - RDS - Database Engine, etc

### Resource Groups

- Resource groups make it easy to group resources using the tags assigned to them.
- Can group resources that share one or more tags
- Resource groups allow you to apply automation to resources tagged with specific tags. For example, we can stop all EC2 instances in a certain region by using resource group tags.
- Resource groups in combination with AWS Systems manager allow you to control and execute automation against entire fleets of EC2 instances, all at the push of a button.
- Resource Groups Contain Information such as
  - Region
  - Name
  - Employee ID
  - Department

### Tag Editor

- A global service that allows us to discover resources and to add additional tags to them as well.

### Questions

- What are tags?
- What are resource groups?
- Can you apply automation to resources tagged with specific tags? What is an example?
- What is Tag Editor, is it global?

---

## Consolidated Billing

- Allows you to get volume discounts on all of your accounts.
- Unused EC2 instances are applied across the group.
- CloudTrail is on a per account, per region basis. However, It can be aggregated to a single bucket belonging to the paying account.

### AWS Organizations

- AWS Organizations is an account management service that enables you to consolidate multiple AWS accounts into an organization that you create and centrally manage.
- AWS Organizations is global.
- You create organizational units and attach accounts to these units.
- Available in **two** feature sets:
  - Consolidated Billing
  - All features (full access)

### Organizations with Consolidated Billing

#### Structure

- Paying account > Test/Dev, Production, Back Office (linked accounts) > Monthly Bill

- Paying account is independent. **Cannot** access the resources of other accounts or block linked accounts from provisioning resources.
- Linked accounts are independent.
- Currently a limit of 20 linked accounts for consolidated billing.

#### Advantages of Consolidated Billing

- One bill per AWS account
- Very easy to track charges and allocate costs
- Volume pricing discount

#### S3 Practical Example

- Test/Dev uses 600GB
- Production uses 900GB
- Back office uses 500GB

- _Without consolidated billing:_

  - 600 x $0.03 = $18
  - 900 x $0.03 = $27
  - 500 x $0.03 = $15
  - Total Bill = \$60 for 2TB of storage

- _With consolidated billing:_
  - 1TB x \$0.03 = #30
  - next 1TB x \$0.0295 = &29.50
  - Total Bill = \$59.50

#### EC2 Practical Example

- Test/Div uses 6 on-demand instances (can use the 2 additional RI)
- Production has 5 reserve instances, uses 3
- Back office

### AWS Organizations Best Practices

- Always MFA root account.
- Always use a long and complex password on root account.
- **Paying account should be used for billing purposes only.** Do not deploy resources on paying account.

### CloudTrail

> You push out your CloudTrail logs from all your other accounts into a S3 bucket that is accessible from the paying accounts. This bucket will serve as the source of truth.

- Used to audit AWS services.
- Per AWS account and is enabled per region.
- Can consolidate logs using an S3 bucket:
  - Turn CloudTrail in paying account
  - Create bucket policy that allows cross-account access
  - Turn on CloudTrail in the other accounts and use the bucket in the paying account

### Questions

- What is the objective of AWS organizations?
- What are the two types of AWS organizations?
- Is AWS organizations global?
- What is a paying account, what **should not** be on a paying account?
- What is the current limit of linked accounts for consolidated billing?
- What are the 3 advantages of consolidated billing?
- What is a strategy that can be leveraged between CloudTrail and the organization's paying account?
- What is the relationship between policies, root account. organizational units, and aws accounts, in an organization?

---

## AWS Quick Start & AWS Landing Zone

- AWS Quick Start is a way of deploying environments quickly using CloudFormation templates built by AWS Solutions Architects who are experts in that particular technology.
- AWS Landing Zone is a solution that helps customers quickly set up a secure, multi-account AWS environment based on AWS best practices.

### Questions

- What is AWS Quick Start?
- What is AWS Landing Zone?

---

## AWS Calculators

- **AWS Simple Monthly Calculator** - Hosted on S3, allows you to build out an AWS environment and estimate the costs of that environment on a monthly basis. Not a comparison tool.
  - `https://calculator.s3.amazonaws.com/index.html`
- **AWS Total Cost of Ownership Calculator** - Determines the cost to have servers on premise, or co-location, versus having them on the cloud. _In-house vs on-premise._
  - `https://aws.amazon.com/tco-calculator/`
  - Breaks down calculations into **four parts: server costs, storage costs, network costs, IT labor costs.**

### Questions

- What does the AWS Simple Monthly Calculator do?
- What does the AWS Total Cost of Ownership Calculator do?
- What are the AWS TCO calculations broken down into?

---

# Security in the Cloud

### AWS Artifact

- AWS Artifact features a comprehensive list of access-controlled documents relevant to compliance and security in the AWS cloud.

### AWS Shared Responsibility Model

- While AWS manages the security _of_ the cloud, security _in_ the cloud is the responsibility of the customer . Customers retain control of what security they choose to implement to protect their own content, platform, applications, systems and networks, no differently than they would in an on-site data center.

#### Security Responsibilities:

- **Customer**

  - Customer Data
  - Platform, Applications, IAM
  - OS, Network, and Firewall Configuration
  - Client-side Data encryption, and data integrity authentication
  - Server-side encryption
  - Network Traffic Protection

- **AWS**

  - **Software**
    - Compute
    - Storage
    - Database (DBs like DynamoDB, used by Amazon, to hold _your_ information.)
    - Networking
  - **Hardware / AWS Global Infrastructure**
    - Regions
    - AZs
    - Edge locations

* For **EC2** it's the customers responsibility to keep the OS onwards secure. For RDS, S3, DynamoDB, ect. is always going to be Amazon's responsibility because we don't get access to the Operating System on those services.

### Questions

- What is AWS Artifact?
- Explain the shared responsibility model.
- What service OSs need to be handled by us, and which by AWS?

---

## WAF & Shield

### AWS WAF

> Hackers

- AWS WAF is a **web application firewall** that helps you protect your web applications from common web exploits that could affect application availability, compromise security, or consume excessive resources. Prevents cross-site scripting, sql injections, etc.

#### OSI Model Layers

1. Physical
2. Data Link
3. Network
4. Transport
5. Session
6. Presentation
7. Application (WAF)

### AWS Shield

> DDoS attacks

- AWS Shield is a managed Distributed Denial of Service (DDoS) protection service that safeguards web applications running on AWS. AWS Shield provides always-on detection and automatic inline mitigation that minimize application downtime and latency.

- **Two Tiers:**
  - Standard: Included.
  - Advanced: \$3,000 /month. Don't have to pay for the damage that DDoS causes.

### Questions

- What does WAF stand for?
- What does WAF protect against?
- Describe AWS Shield.
- What are the two tiers for AWS Shield, what are their features and prices?

---

## AWS Inspector, AWS Trusted Advisor

### AWS Inspector

> Installed on EC2 Instances and assesses the instance's security.

- Inspector is an _automated_ security assessment service that helps improve the security and compliance of applications deployed on AWS. Amazon Inspector automatically assesses applications for vulnerabilities or deviations from best practices. After performing an assessment, Inspector produces a detailed list of security findings prioritized by level of severity. These findings can be reviewed directly or as part of a detailed assessment report which is available via the Amazon Inspector console or API.

### AWS Trusted Advisor

> a TA looks at the entire AWS environment and gives a report.

- An online resource to help you reduce cost, increase performance, and improve security by optimizing your AWS environment. TA provides real-time guidance to help you provision your resources following AWS best practices.

- **Two Tiers:**
  - Core Checks and Recommendations - Free
  - Full Trusted Advisor - Business and Enterprise companies only

---

## CloudWatch vs AWS Config

### CloudWatch

- CloudWatch monitors performance.

- Host level metrics
  - CPU
  - Network
  - Disk
  - Status Check

### AWS Config

- Provides a detailed view of the configuration of AWS resources on your AWS account. The includes how the resources are related to one another and how they were configured in the past so that you can see how the configurations and relationships changed over time. Example: Security Group changes.

---

## Athena vs Macie

### Athena

- Athena is an interactive query service that allows you to analyse and query data located in S3 using standard SQL.
- Serverless, nothing to provision, pay per query / per TB scanned.
- No need to set up complex Extract/Transform/Load (ETL) processes.
- Works directly with data stored in S3, like data lakes.

#### What can it be used for?

- Can be used to query log files stored in S3.
- Generate business reports on data stored in S3.
- Analyse AWS cost and usage reports.
- Run queries on click-stream data.

### Macie

- Macie is a security service which uses machine learning and natural language processing to discover, classify, and protect sensitive data stored in S3.
- Uses AI to recognize if your S3 objects contain sensitive data such as PII.
- Utilizes dashboards, reporting, and alerts.
- Works directly with data stored in S3.
- Can analyze CloudTrail logs.
- Great for PCI-DSS and preventing ID theft.
