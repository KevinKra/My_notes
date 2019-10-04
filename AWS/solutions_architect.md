# AWS Solutions Architect Associate

> An Amazon certification

## Index

a. [AWS Overview](#overview-of-aws)

b. [IAM](#iam-101)

c. [S3](#s3-101)

d. [EC2](#ec2-101)

e. [Databases](#databases-on-aws)

f. [Review Section](#review-section)

#### Exam blueprint

- 130 minutes in length
- 60~ questions
- Multiple Choice
- Results are between 100-1000 with a passing score of 720
- Qualification is valid for 2 years
- Scenario based questions

## Overview of AWS <a name="overview-of-aws"></a>

### The History of AWS

- Why is AWS so powerful? Amazon allows companies to use Amazon's Web Servers(AWS) without risks associated with having to build home-grown servers. This allows for companies with tighter budgets to build into AWS and leverage all the integrated server scalability features that Amazon provides. Additionally, it reduces risks to the company because they no longer have to manage and maintain their own server farm.

- in 2003 Chris Pinkham and Benjamin Black presented a paper on what Amazons internal infrastructure could look like. They suggested selling it as a service and prepared a business case for it.

- SQS was launched in 2004, the very first service released by AWS.
- AWS as a business launched in 2006, targeting developers in Silicon Valley.
- by 2007, AWS had over 180,000 developers on the platform.
- by 2010, all of amazon.com moved over the AWS services.
- 2012 first re:Invent conference
- 2013 certifications released
- 2018 AWS launched Machine Learning certificates
- 2019 Alexa Specialty Beta certification launched.

### AWS Platform

- **AWS Global Infrastructure** - Amazon's global infrastructure and servers around the world. As of 2019 there are 24 regions and 72 availability zones.
- **Availability Zone** - an AZ is a data center, or cluster of data centers, that are comprised of many servers that support the AWS cloud. In many cases, there are several geographically isolated data centers that protect the network from issues that may knock any one specific center out.
- **Regions** - A geographical area that consists of 2 or more availability zones.
- **Edge Location** - Edge locations are endpoints for AWS which are used for caching content. Caches files and content from distant regions and holds them in a closer edge location facility.

- **Amazon VPC** - Amazon Virtual Private Cloud, which is _part of Networking services_ is a virtual network dedicated to a single AWS account. It is isolated from other virtual networks in the AWS cloud, providing compute resources with robust and secure networking functionality.

### Content to focus on for certification

- Security, Identity, and Compliance
- Network & Content Delivery
- Compute
- Storage
- Databases

### Keywords:

- **Amazon VPC** - Amazon Virtual Private Cloud
- **Amazon AZ** - Availability Zone

### Questions:

- **What is a region, an availability zone, and an edge location?**

- **Where is CloudFront data cached?**

  _in Edge locations._

---

## IAM 101 <a name="iam-101"></a>

- **Identity Access Management**, IAM allows you to manage users and their level of access to the AWS console. It is important to know for administrating a company's AWS account. Allows you to create users, groups, roles, etc. on the platform and provide permissions.

### IAM features

- Centralized control of your AWS account
- Shared access to your AWS account
- Granular permissions
- Identity federations, allows end-users to potentially log in using their Facebook account, LinkedIn, etc.
- Multi-factor Authentication
- Provide temporary access for users/devices and services
- Allows password rotation policy
- Integrates with many different AWS services
- Supports PCI DSS Compliance, a compliance required for handling user data and money.

#### IAM Permissions

- **Users** - End users such as employees
- **Groups** - A collection of users, each user will inherit the permissions of the group.
- **Policies** - Policies are made up of documents called Policy documents. These documents are in JSON (JavaScript Object Notation) format and give permissions to what a User/Group/Role is able to do.
- **Roles** - You create roles and assign them to AWS resources. The resources then can communicate with other AWS services.

#### Hands on

- Policy example (AdministratorAccess)

```
// Allow the user to have access to all (*) actions on all (*) resources
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
}
```

### Keywords:

- **IAM** - Identity Access Management
- **root account** - account created when we first setup AWS account. It has complete Admin access.
- **2FA** - two-factor authentication
- **MFA** - multi-factor authentication
- **Billing Alarm** - An billing limit you set that will trigger an alarm once its been reached.
- **Users**
- **Groups**
- **Policies**
- **Roles**

### Questions:

- **Is IAM limited to regions or is it universal?**

  _IAM is currently universal and does not apply to specific regions._

- **Do users have permissions when they're first created?**

  _No, new users start with NO permissions._

- **What are new users assigned when they're first created?**

  _an Access Key ID and a Secret Access Key._

- **Can you use the Access Key ID and Secret Access Key to login to the console?**

  _No, but it does allow access to AWS via APIs and the command line, or via programmatic access._

- **Describe how to disable or deactivate an access key**

  _console > IAM > Users > Security Credentials Tab > Access Keys > Status > Make Inactive_

- **Can you continue looking at the user's keys after they're generated?**

  _No, if you lose them you need to regenerate them. Save the CSV file in a secure location._

- **Should you have MFA on your root account?**

  _Yes._

- **Can you create and customize your password and pw policy rules?**

  _Yes._

- **How would you alert users in the event their billing limit has been reached?**

  _You can create a billing alarm in CloudWatch. Services > CloudWatch > Billing > Create Alarm_

### Scenarios:

- **You need to protect your account from being over-billed. How can you accomplish this?**

---

## S3 101 <a name="s3-101"></a>

> Before taking the exam read the S3 FAQS

- **Simple Storage Service**. One of the oldest services on AWS. It provides developers and IT teams with secure, durable, and highly-scalable object storage. S3 is easy to use with a simple web services interface that allows you to store and retrieve information from anywhere in the world.

### S3 Features

- S3 is **Object-based**, ie allows you to upload files.
- Files can range between 0 Bytes to 5 terabytes.
- There is unlimited storage.
- Files are stored in Buckets (directory). Must have a unique name.
- S3 is a universal name space. Names must be unique globally.
- When you upload a file to S3 you will receive an HTTP 200 code.
- Tiered Storage
- Life-cycle Management. Allows files to be moved around.
- Versioning
- Encryption
- MFA Delete
- Secure data using **Access Control Lists** and **Bucket Policies**

### S3 Objects

- **Key** - name of the object
- **Value** - data in the form of bytes
- **Version ID** - important for versioning
- **Metadata** - Data about the data
- **SubResources** - Access Control Lists, Torrent

### How does data consistency work for S3?

- Read after write for POSTs of new objects. As soon as you upload a file, you can read it.
- Eventual consistency for overwrite PUTs and DELETEs, if you wait a few moments you will be able to read the latest version.

### S3 Guarantees

- 99.99% availability guaranteed by Amazon and 99.999999999% durability. (Remember 11 9s).

### S3 Storage Classes / Tiers

- **S3 Standard** - 99.99% availability and 99.999999999% durability. Data is stored redundantly across multiple devices in multiple facilities and is designed to sustain the loss of 2 facilities concurrently.
- **S3 - IA** - Infrequently Accessed. For less frequently accessed data, but requires rapid access when needed. Lower fee than S3 standard, but you are charged a retrieval fee.
- **S3 One Zone - IA** - Infrequently Accessed. A much cheaper IA option but lacks the multiple AZ data resilience.
- **S3 Intelligent Tiering** - Leverages machine learning to automatically move data to most cost-effective access tier, without performance impact or operational overhead.
- **S3 Glacier** - Secure, durable, low-cost storage class for data archiving. You can reliably store any amount of data at costs that are cheaper than on-premises solutions. Retrieval times are configurable, can range from minutes to hours.
- **S3 Glacier Deep Archive** - Amazon S3's lowest-cost storage class. Retrieval time byte latency of 12 hours is acceptable.

### S3 Charges for

- **Storage**
- **Requests**
- **Storage Management Pricing**
- **Data Transfer Pricing**
- **Transfer Acceleration** - Allows for fast, easy, and secure transfers of files over long distances between your end users and an S3 bucket. TA takes advantage of Amazon CloudFront's globally distributed edge locations. As the data arrives at an edge location, data is then re-routed to Amazon S3 over an optimized network / Amazon's backbone network.
- **Cross Region Replication** - Allows for data to be automatically replicated in another region. Allows for increased availability and provides disaster durability.

### Keywords:

- **RRS** - Reduced Redundancy Storage

### Questions:

- **What is the consistency (reading) ability for new file POSTs and existing file PUTs and DELETEs?**
  _Newly posted files can immediately be read, however editing or deleting existing files will need a brief moment to update the resource and make it readable._

- **What are the S3 Storage Classes / Tiers and what defines each tier?**

- **What are the availability and durability markings for S3 standard?**

- **What are the expenses involved with using S3 services**

- **What are the features of S3?**

- **What are the suitable types of data that can be stored on S3?**
  _It is designed to store files, not serve as a database host or installing OS._

- **What type of response does S3 send out?**

- **Can MFA be used in relation to S3?**
  _Yes, it can be used to protect from the deletion of files._

- **What are the key fundamentals of S3 data?**
  _There is a key, value, versionID, metadata, and sub-resources (Access Control Lists/permissions, Torrent)_

- **Explain the steps to make a file in a bucket public**

- **What happens when you make a bucket / object public?**
  _Everyone will have access to one or all of the following: read this object, read and write permissions._

- **Can the storage class be changed on the object and also on a bucket level?**
  _Yes, both buckets and individual objects can have their storage classes modified._

### S3 Security and Encryption

- By default, all newly created buckets are **private**. You can setup access control to your buckets using **Bucket Policies**, **Access Control Lists**. Additionally, S3 buckets can be configured to create access logs, which cause all requests to be logged and sent to an S3 Bucket on the same account or even on another account.

#### Encryption

- **Encryption in transit** - HTTPS is an example of encryption in transit. Achieved by **SSL/TLS**.
- **Encryption at Rest** - Can be handled server-side (amazon helps here), or client-side, where you the developer encrypt the object yourself and upload it to S3.

#### Server Side Encryption

1. **S3 Managed Keys - SSE-S3**, amazon automatically manages the keys (encryption / decryption) for you.
2. **AWS Key Management Service, Managed Keys - SSE-KMS**, developer and amazon manage the keys together.
3. **Server Side Encryption with Customer provided keys - SSE-C**, Give amazon your own keys, that you manage, and you can use them to encrypt your S3 objects.
4. Client side encryption. Encrypt client side and upload to S3.

### S3 Version Control

#### Features

- Stores all versions of an object, including all writes even if you delete the object.
- Great back-up tool
- Once enabled, **versioning cannot be disabled**, only suspended.
- Integrates with **Lifecycle** rules.
- **Versioning comes with with MFA delete capability** which provides another layer of security.

### Questions:

- **What happens when you utilize versioning in S3?**
  _New versions will be added with default public access set to off or private. The latest version and all previous versions will have a combined footprint in the database._

- **What happens if you delete a versioned file?**
  _A new version with a delete marker will appear. The bucket may look empty, but if you show all versions you will see previous versions (and the delete marker version) in your bucket_

- **How would you restore an object with versioning if you've already deleted it?**
  _Simple, delete the version with the delete marker and it will roll back to the latest (pre-delete) version._

### S3 Lifecycle Management and Glacier

- Lifecycles allow you to set rules to manage your objects, they can be automated to transition to tiered storage, and eventually they can be automatically set to expire based on retention needs. In short, in lifecycles automate the moving of objects between different storage tiers and can be used in conjunction with versioning (can be applied to current and previous versions).

---

## EC2 101 <a name="ec2-101"></a>

- **Elastic Compute Cloud**, Amazon EC2 is a web service that provides resizable compute capacity in the cloud. Amazon EC2 reduces the time required to obtain and boot new server instances to minutes, this provides for the ability to quickly scale capacity both up and down as your computing requirements change. The EC2 solution is drastically faster than traditional server solutions where setting up and deploying physical servers could take days or even months and the costs would all be upfront. EC2 allows for provisioning servers in the cloud and takes mere minutes to complete.

### Pricing Models Instances

- **On demand** - No commitment model that allows you to pay by the hour or even second.
- **Reserved** - Provides a capacity reservation and offers a significant discount on the hourly charge for an instance. **Contract terms are 1 or 3 year terms.**
- **Spot** - Enables you to bid on excess EC2 capacity. Amazon will drop the price on EC2 instances to encourage people to use that surplus capacity. You would set price you're willing to bid at and when the prices for the EC2 instances lowers you will have access to those additional resources. As the on-demand demand goes up, the prices for those instances will go up and if they pass your price point you will lose access to them until the next occurrence of reduced prices. It's essentially a market for buying into extra resources when they're in supply.
- **Dedicated Host** - Physical EC2 server dedicated for your use. Dedicated hosts can help you reduce costs by allowing you to use your existing server-bound software licenses.

#### On Demand Pricing

> Ideal for:

- Users that want low cost and flexibility of EC2 without any up-front payment or long-term commitment.
- Applications with short term, spiky, or unpredictable workloads that _cannot_ be interrupted.
- Applications being developed or tested on Amazon EC2 for the first time.

#### Reserved Pricing

> Ideal for:

- Applications with steady state or predictable usage.
- Applications that require reserved capacity.
- Users are able to make upfront payments to reduce their total computing cost even further.

**3 Types:**

- **Standard Reserved Instances** - Offer up to 75% off on-demand instances. The more you pay up front and the longer the contract the greater the discount.
- **Convertible Reserved Instances** - Offer up to 54% off on-demand instances and allow you to change from one reserved **EC2 Instance type** to another.
- **Scheduled Reserved Instances** - Available to launch within the time windows you reserve. This option allows you to match your capacity reservation along a predictable recurring schedule.

#### Spot Pricing

> Ideal for:

- Applications that have flexible start and end times
- Applications that are only feasible at very low compute prices
- Users with urgent computing needs for large amounts of additional capacity.
- If your spot instance is terminated by EC2, you will not be charged for partial hour usage. If you terminate the instance yourself, you will be charged for any hour which the instance ran.

#### Dedicated Host Pricing

- Useful for regulatory requirements that may not support multi-tenant virtualization.
- Great for licensing which does not support multi-tenancy or cloud deployments (like Oracle licensing).
- Can be purchased On-demand
- Can be purchased as a Reservation for up to 70% off the on-demand price.

### EC2 Instance Types

> Required knowledge for Professional Cert

**Family & Gen#** - **Speciality** - **Use case**

F1 - Field Programmable Gate Array - Genomics research, financial analytics, real-time video processing, big data, etc.

I3 - High Speed Storage - NoSQL DBs, Data Warehousing, etc.

G3 - Graphics Intensive - Video Encoding, 3D Application streaming

H1 - High Disk Throughput - MapReduce-based workloads, distributed file systems such as HDFS and MapR-FS

T3 - Lowest Cost, General Purpose - Web Servers, small DBs

D2 - Dense Storage - Fileservers, Data Warehousing, Hadoop

R5 - Memory Optimized - Memory Intensive Apps/DBs

M5 - General Purpose - Application Servers

C5 - Compute Optimized - CPU intensive Apps/DBs

P3 - Graphics/General Purpose GPU - Machine Learning, Bit Coin Mining, etc.

X1 - Memory Optimized - SAP HANA / Apache Spark, etc.

Z1D - High compute capacity and a high memory footprint - Ideal for Electronic Design Automation (EDA) and certain relational databases with high per-core licensing costs.

A1 - Arm-based workloads - Scale-out workloads such as web servers

U-6tb1 - Bare Metal - Bare metal capabilities that eliminate virtualization overhead.

**Mnemonic**

> FIGHT DR MCPXZ AU

F - for FPGA

I - for IOPS

G - Graphics

H - High Disk Throughput

T - Cheap general purpose

D - for Density

R - for RAM

M - Main choice for general purpose apps

C - for Compute

P - Graphics

X - Extreme Memory

Z - Extreme Memory && CPU

A - Arm-based workloads

U - Bare Metal

### SSH into EC2 Instance and Setup Webserver

#### Steps (Mac):

1. `cd downloads`
2. `mkdir SSH`
3. `mv <KeyPair> SSH` - move .pem file to SSH directory
4. `cd SSH`
5. `CHMOD 400 <KeyPair>` - lockdown file
6. `ssh ec2-user@<our-ip-address> -i <KeyPair>` - Gain access to ec2 user account.

7. yes
8. permanently adds your ip address to the list of known hosts for the EC2 Instance.

9. `sudo su` - Elevates privileges from ec2-user to root
10. `yum update -y` - looks for OS updates
11. `yum install httpd -y` - installs Apache, turns EC2 instance into a webserver.
12. `cd /var/www/html` - Anything put in here will essentially be a website.
13. `nano index.html` - Create html doc in nano text editor
14. `service httpd start` - launches the webserver so you can visit the website.
15. `chkconfig on` - automatically starts the httpd service if your ec2 instance reboots.

### Keywords:

- **AMI** - Amazon Machine Image

### Questions:

- **Explain EC2.**

- **How many different instance price models are there and what are their details?**

- **How many types of reserved instances exist and what are their details?**

- **What are the EC2 types and their respective use cases?**

- **Is termination protection on or off by default?**
  _By default EC2 termination protection is off_

- **On an EBS-backed instance, is the default action to delete the root EBS volume when the instance is deleted?**
  _Yes. If you terminate your EC2 instance you're also going to terminate your virtual HDD as well. Can be changed to not do this._

- **Can the EBS Root Volumes of your DEFAULT AMI's be encrypted?**
  _No, but third party tools (like bit locker) can be used to encrypt the root volume_

- **Can additional EC2 instance volumes be encrypted?**
  _Yes._

- **Which EC2 volume is the device OS installed onto?**
  _The root volume_

---

## Databases on AWS <a name="databases-on-aws"></a>

- Relational databases have existed since the 1970s, they are a series of interconnected tables with one-to-one, one-to-many, and many-to-many (that utilize join tables) relationships. Relational databases consist of tables or **collections** which themselves consist of rows. Rows, or **documents**, consist of key-value pairs or **fields**.

#### Six relational databases on AWS

- SQL Server (Microsoft)
- Oracle
- MySQL
- PostgreSQL
- Amazon Aurora
- MariaDB

#### RDS has two key features (RDS - Relational Database Services)

- **Multi-AZ** - for disaster recovery. If we lost access to one AZ amazon would detect that and update the DNS to point to the secondary address's IP address.
- **Read Replicas** - For performance. Every time you do a write to a database, the write will be automatically copied to the other database. However, there is no automatic fail-over from one database to the other database holding the copies. You would need to create a new url and point your EC2 instance to point at replica. Replicas are useful for scaling your database, if your website becomes extremely popular you could point half of your instances to read from the replica. **You can have five copies of read-replicas.**

### DynamoDB

- Amazon DynamoDB is a fast and flexible noSQL database service. It is designed for applications that need consistent, single-digit millisecond latency at any scale. It is a fully managed database and **supports both document and key-value data models.** Its flexible data model and reliable performance make it a great fir for mobile, web, gaming, ad-tech, IoT, and many other applications.

#### Features

- Stored on SSD storage
- Spread across 3 geographically distinct data centers
- **Eventual Consistent Reads** (Default) - consistency is reached across all copies of data usually within 1 second. For applications that _don't_ need immediate write to read consistency.
- **Strongly Consistent Reads** - When you write to DynamoDB table and you need to read that data within or less than 1 second. Essentially, will return a result that reflects all writes that received a successful response prior to the read. For applications that need immediate write to read consistency.

## Review Section

> This section is designed to provide a comprehensive review of the entire lesson. Questions are written more as statements or keywords and designed to be talked about by yourself or with a partner. You should aim to speak confidently about the topics and review material when needed. Be honest with your results.

- What risks does AWS mitigate for businesses?
- Why is AWS suitable for both small start ups and large companies?
- When was AWS launched?
- What were AWS certificates released?
- What is AWS Global infrastructure?
- What is an Availability Zone?
- What is an AWS Region?
- What are Edge Locations?
- Explain Amazon VPC.
- Where is CloudFront data cached?
- What does IAM stand for, what is its purpose?
- What are identity federations?
- What are the 4 IAM permission types?
- Explain each IAM permission type.
- What format are policy documents written in?
- What does JSON stand for?
- What is a billing alarm?
- What is a root account, what permissions does it have?
- Explain the steps to setup a billing alarm.
- Is IAM limited to a region or is it universal, why?
- Do users have permissions when they're first created?
- What are users assigned when they're first created?
- Can you use the Access Key ID and Secret Access Key to login into the console?
- Explain the process to disable or deactivate an access key.
- Can you continue to look at a user's keys after they're generated?
- Should you have MFA on your root account?
- Explain the process for creating and customizing password policy rules.
- How would you protect your account from being over-billed?
- What does S3 stand for?
- Describe S3.
- S3 is Object based. What does that mean?
- What is the file size range for files uploaded to S3?
- Does S3 allow unlimited storage?
- What is the name used for directories in S3?
- What is the name of data stored in S3 directories?
- S3 is a universal name space, what does that mean?
- What kind of response do you receive when you upload a file to S3?
- Explain tiered storage.
- Explain life-cycle management in S3.
- Explain versioning in S3.
- Explain encryption in S3.
- What does MFA Delete mean and why is it important?
- What are Access Control Lists and Bucket Policies, what are they for?
- S3 Objects have several (5) values associated with them, what are they?
- What is data consistency?
- How does data consistency work in S3?
- What is S3's guarantee?
- What are the S3 Storage classes / S3 Storage tiers.
- Explain S3 Standard, what it is suitable for?
- Explain S3 - IA, what it is suitable for?
- Explain S3 One Zone - IA, what it is suitable for?
- Explain S3 Intelligent Tiering, what benefits does it provide?
- Explain S3 Glacier, what it is suitable for?
- Explain S3 Glacier Deep Archive, what it is suitable for?
- What 5 things does S3 charge for?
- What is transfer acceleration, how does it work?
- What is cross region replication, how does it work?
- What does RRS stand for?
- Can MFA be used in S3, in what regard?
- What is S3 designed for, is it suitable for databases?
- What happens if you make a bucket / object public?
- Can buckets and objects have their respective storage classes modified?
- What is the default public setting for new buckets?
- What can you use to control access to your bucket?
- Can access logs be created for buckets? Where can the logs be stored?
- What is encryption in transit, what is an example?
- SSL/TLS are used for what type of encryption?
- What is Encryption at Rest, what two environments can it be handled?
- What are the four types of server-side encryption?
- Explain SSE-S3.
- Explain SSE-KMS.
- Explain SSE-C.
- Explain Client Side encryption.
- What is S3 Version Control.
- Can S3 versioning be disabled once initiated?
- Can S3 versioning be suspended?
- Can S3 versioning be integrated with lifecycles rules?
- Can S3 versioning come with MFA delete capability?
- What happens when you utilize versioning in S3?
- What happens if you delete a versioned file?
- How would you restore an object with versioning if you've already deleted it?
- What do S3 Lifecycles accomplish, how would they interact with versioning?
- What does EC2 stand for?
- What does EC2 accomplish?
- What were the challenges that EC2 solved?
- What are the 4 pricing models for EC2?
- Explain each EC2 pricing model in detail.
- What is the On Demand model suitable for?
- What is the Reserved model suitable for?
- What are the 3 types of reserved instances?
- What is the Sport Pricing model suitable for?
- What is the Dedicated Host model suitable for?
- What is the EC2 Instance Type mnemonic phrase?
- What are the 14 EC2 Instance types, what are they suitable for?
- Relational databases are comprised of what?
- What 6 relation databases are supported by AWS?
- What does RDS stand for?
- What are the two key features that RDS provides?
- Explain Multi-AZ.
- Explain Read Replicas.
- What is DynamoDB?
- What are the 4 features of DynamoDB?
- Is EC2 termination protection on or off by default?
- On an EBS-backed instance, is the default action to delete the root EBS volume when the instance is deleted?
- Can the EBS Root Volumes of your DEFAULT AMI's be encrypted?
- Which EC2 volume is the device OS installed onto?
