# AWS Solutions Architect

> An Amazon certification

#### Exam blueprint

- 130 minutes in length
- 60~ questions
- Multiple Choice
- Results are between 100-1000 with a passing score of 720
- Qualification is valid for 2 years
- Scenario based questions

## Overview of AWS

### The History of AWS

- Why is AWS so powerful? Amazon allows companies to use amazons web servers(AWS) without risks associated with having to build home-grown servers. This allows for companies with tighter budgets to build into AWS and leverage all the integrated server scalability features that Amazon provides. Additionally, it reduces risks to the company because they no longer have to manage and maintain their own server farm.

- in 2003 Chris Pinkham and Benjamin Black presented a paper on what Amazons internal infrastructure should look like. They suggested selling it as a service and prepared a business case for it.

- SQS was launched in 2004, the very first service released by AWS.
- AWS as a business launched in 2006, targeting developers in Silicon Valley.
- by 2007, AWS had over 180,000 developers on the platform.
- by 2010, all of amazon.com moved over the AWS services.
- 2012 first re:Invent conference
- 2013 certifications released
- 2018 AWS launched Machine Learning certificates
- 2019 Alexa Specialty Beta Cert launched.

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

## IAM 101

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

  _an Access Key ID, Secret Access Key._

- **Can you use the Access Key ID and Secret Access Key to login to the console?**

  _No, it does allow access to AWS via APIs and the command line, or via programmatic access._

- **Describe how to disable or deactivate an access key**

  _IAM > Users > Security Credentials Tab > Access Keys > Status > Make Inactive_

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

## S3 101

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

### Objects

- **Key** - name of the object
- **Value data** - in the form of bytes
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
- **Transfer Acceleration** - Allows for fast, easy, and secure transfers of files over long distances between your end users and an S3 bucket. TA takes advantage of Amazon CloudFront's globally distributed edge locations. As the data arrives at an edge location, data is then re-routed to Amazon S3 over an optimized network or Amazon's backbone network.
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
