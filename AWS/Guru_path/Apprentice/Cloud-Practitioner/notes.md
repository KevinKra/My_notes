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
