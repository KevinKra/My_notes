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
