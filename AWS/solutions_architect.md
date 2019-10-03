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

- Amazon VPC - Amazon Virtual Private Cloud
- Amazon AZ - Availability Zone

### Questions:

_What is a region, an availability zone, and edge location?_

_Where is CloudFront data cached?_

- in Edge locations.

## IAM 101

- **Identity Access Management**, IAM allows you to manage users and their level of access to the AWS console. It is important to know for administrating a company's AWS account. Allows you to create users, groups, roles, etc. on the platform and provide permissions.

### IAM features

- Centralized control of your AWS account
- Shared access to your AWS account
- Granular permissions
- Identity federations, allows end-users to potentially log in using their Facebook account, LinkedIn, etc.
- Multifactor Authentication
- Provide temporary access for users/devices and services
- Allows password rotation policy
- Integrates with many different AWS services
- Supports PCI DSS Compliance, a compliance required for handling user data and money.

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

- IAM - Identity Access Management
- root account - account created when we first setup AWS account. It has complete Admin access.
- 2FA - two-factor authentication
- MFA - multi-factor authentication

### Questions:

- _Is IAM limited to regions or is it universal?_
- IAM is currently universal and does not apply to specific regions.

- _Do users have permissions when they're first created?_
- No, new users start with _NO_ permissions.

- _What are new users assigned when they're first created?_
- an Access Key ID, Secret Access Key.

- _Can you use the Access Key ID and Secret Access Key to login to the console?_
- No, it does allow access to AWS via APIs and the command line, or via programmatic access.

- _Describe how to disable or deactivate an access key_
- IAM > Users > Security Credentials Tab > Access Keys > Status > Make Inactive

- _Can you continue looking at the user's keys after they're generated?_
- No, if you lose them you need to regenerate them. Save the CSV file in a secure location.

- _Should you have MFA on your root account?_
- Yes.

- _Can you create and customize your password and pw policy rules?_
- Yes.

### Scenarios:
