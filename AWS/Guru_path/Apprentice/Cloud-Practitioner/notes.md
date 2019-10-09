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
  > example: GoDaddy, Heroku, ElasticBeanStalk, etc.
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

## Load Balancers

- EC2 load balancers

### Types of LoadBalancers

- Application Load Balancers
  > Application aware and can make intelligent routing decisions. Layer-7 aware (Make Intelligent Decisions).
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

- What does a load balancer do?
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

### Route53 101

- Route53 is an AWS DNS service.
- DNS works on port 53 hence the name.
- Route53 is **Global**
- You can use Route53 to direct traffic and it can be used to register a domain name.
- DNS is a service computers use to resolve domain names to IP addresses.

---

### Elastic Beanstalk

- Allows for the provisioning of AWS resources in just a few clicks and easily deploying applications to the cloud.
- **Free Service**, though what they provision may not be.

---

### CloudFormation

- consists of stacks
- **Free Service**, though what they provision may not be.

---

### Amazon Cloud Whitepaper

#### Scalability

- **Scale up**
  > Upgrading the infrastructure currently being utilized by an account, example: Upgrading the EC2 instance from t family to m.
- **Scale out**
  > Adding multiple virtual machines behind an elastic load balancer (more common to scale out than scale up)
  - **Stateless Applications** - an application that doesn't hold state (lamba) and forgets after interaction.
  - **Distribute Load to Multiple Nodes** - RDS read-replicas are an example.
  - **Stateless Components** - The more stateless components, the easier it is to scale. Ex: Signing into a website, instead of storing user data on a webserver, store their data instead on the user's browser as a cookie.
  - **Stateful Components** - Storing information in a database.
  - **Implement Session Affinity** - _Sticky session_, putting a cookie in a user's browser. An ALB will detect the cookie and send the user to a specific EC2 instance.
  - **Implement Distributed Processing** - _Elastic Map Reduce_ Using fleets of EC2 instances to process extreme amounts of data.

#### Disposable Resources

- Instantiating compute resources
  - **Bootstrapping** - Helps in avoiding the need to repeat steps every single time between setups.
  - **Golden Images** - Taking an Image of an EC2 instance after it was set up and configured and then using that "golden image" to serve as the setup for additional EC2 Instances.
  - **Containers** - null
  - **Hybrid** - Hybrids of containers and EC2 instances

#### Infrastructure as Code

- CloudFormation

#### Automation

- Aim for things to be serverless, when everything is serverless you don't need to worry about infrastructure or your tools because they will take of themselves (Amazon's job is to maintain that infrastructure.)
- Infrastructure Management and Deployment
  - AWS Elastic Beanstalk
  - Amazon EC2 auto recovery
  - AWS Systems Manager
  - Auto Scaling

#### Alarms and Events

- Amazon CloudWatch alarms - example: billing alert.
- Amazon CloudWatch Events - **Proactive responses to events.** example: can be used to detect if images have been uploaded to S3, can trigger a Lamba function to create a watermark on the image.
- AWS Lamba Scheduled Events
- AWS WAF security automations

#### Loose Coupling

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
- **Anti-patterns**- _Where you wouldnt use a technology._ If no need for joins or complex transactions then use noSQL.

#### DynamoDB

- Scalable
- Push button scalability, autoscaling built in
- High Availability - Multi-AZ
- **Anti-patterns** - Data the requires joins or complex transactions, use a relational DB. If you have large binary files (video, audio, images) consider using S3.

#### Redshift

- Scalable
- High Availability - Multi-AZ
- **Anti-patterns** - Not meant for OLTP

#### Graph Databases

- Scalable
- High Availability
- Neptune

#### Data Lake

- A data lake is an architectural approach that allows you to store massive amounts of data in a central location so that it's readily available to be categorized, processed, analyzed, and consumed by diverse groups within your organization. Since data can be stored as-is, you do not have to covert it to a predfined schema, and you no longer need to know what questions to ask about your data beforehand.
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

### CloudFront - Write this section out

- Edge location is a location that caches data
- Origin is the origin of all the files that the CDN will distribute. Can be an instance of: S3 Bucket, EC2, Route53, Elastic Load Balancer
- Distribution is the name given to CDN which consists of a collection of Edge Locations
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
