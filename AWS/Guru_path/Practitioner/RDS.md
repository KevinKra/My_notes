# AWS RDS

## RDS overview and Intro

- **R**elational **D**atabase **S**ervice

- RDS is a managed Relational Database Service in AWS. It provides greater flexibility and scalability than traditional alternatives. In RDS CPU, Storage, IOPs, Memory, are all split apart so they can be scaled independently.

#### Commercial Engines

- Oracle
- Microsoft SQL server

#### Open Source Engines

- MariaDB
- PostgreSQL
- mySQL

#### Cloud Engines

- Aurora

### Aim of RDS

- Lower the TCO (Total Cost of Ownership)
  - Offload routine database tasks like:
    - Provisioning
    - Patching
    - Backup
    - Recovery
    - Failure Detection
    - Repair
  - Enables you to focus on your core business
  - Leverage the maturity of AWS operations

### Self Hosted vs RDS

> RDS manages many overhead features

#### Self Hosted

1. Provision the hardware
2. Configure and harden your OS
3. Install, setup Database and Clustering
4. Create your database
5. Load your data
6. Tune your queries
7. Design and implement backup strategy
8. Perform patching
9. Perform software and hardware upgrades
10. Deal with failures.

#### RDS

1. Create your data
2. Load your database
3. Tune your queries

### Setting up RDS

- What to configure:
  - Database engine
  - License Model
  - DB Engine version
  - Database Instance Class
  - Multi-AZ Deployment
  - Storage type & size
  - Backups
  - Monitoring
  - Maintenance window

### Terminology

- **Database Instance** - Basic building block of RDS. An isolated database environment instance, can contain multiple user-created databases.
- **Database Engine Type** - Type of engine you'd like to run.
- **Database Instance Class** - Similar to EC2 types. Determines the CPU and Memory capacity. `db.m4.large`
- **MultiAZ** - aka **high availability**, database will be deployed in two AZs providing "high availability."
- **Read-Replicas** - Node which is part of a database instance, _handles only read queries_ which significantly reduces the traffic coming to the production database, or primary host.
- **Primary Host** - The host / node within a database instance that handles the traffic from the client.
- **Secondary Host** - The host / node within a database instance which is not actively handling write traffic for your application. Instead, secondary host serves as a redundancy layer that handles read traffic.
- **Aurora** - MySQL and PostgreSQL compatible relational database natively built for AWS.

### Environment Setup

1. pgAdmin
   > Allows us to connect to the postgreSQL server once we set it up.
2. Setup AWS environment
   - Create a new VPC with Public and Private subnets.
   - Create RDS Subnet Groups, one for public and one for private.

---

# Operating with RDS

### Database Engines

- Oracle
  - Enterprise
  - Standard
  - Standard Edition 1
  - Standard Edition 2
- SQL Server
  - Express
  - Web
  - Standard
  - Enterprise
- Aurora
  - MySQL 5.6
  - MySQL 5.7
  - PostgreSQL
- PostgreSQL
- MySQL
- MariaDB

### Database Engine Version

- PostgreSQL 9.3.12 - 10.4
- SQL Server 2008 -2017
- MySQL 5.5.45 - 5.7.21

### License Model

> Only applies to Oracle databases

### DataBase Instance Class

- 3 Instance Families
  - **T2/T3 Family**
    - Burstable Instances
    - 1-8 vCPU
    - 1-32GB RAM
    - Moderate Network Performance
  - **M3/M4 Family**
    - General Purpose Instances
    - 2-64 vCPU
    - 8-256GB RAM
    - High Performance Networking
  - **R3/R4 Family**
    - 2-64 vCPU
    - 16-488GB RAM
    - High Performance Networking

### MultiAZ Deployment

- Achieve High Availability in case of failure.
- Two Database Nodes running with replication.
- Primary and Standby in different AZs.

### Storage Types and Allocation

- Use AWS Volumes:
  - MySQL
  - MariaDB
  - PostgreSQL
  - Oracle
  - SQL Server
- Use Proprietary storage system:
  - Aurora

#### Types:

- **General Purpose (GP2)**

  - SSD Storage
  - Max 16TB
  - 3 IOPS per GB
  - Bursts to 3000 IOPS

- **Provisioned IOPS (IO1)**

  - SSD Storage
  - Max 16TB
  - Max 40k IOPS (20K for SQL)
  - I/O Intensive Workloads

- **Magnetic**
  - Magnetic Storage
  - Max 16TB
  - Supported for legacy DBs

### Pricing

> What makes up the pricing for RDS

- Database Engine and Version
- License Model
- Database Instance Class
- MultiAZ deployment
- Storage Type and Allocation

#### Database Identifier

- Identifies the Database Instance
- Unique for your account across the region

#### Credentials

- Master user account (varies across DB engines)
- **DO NOT** use these credentials in your application. Instead, create a specific user for your application.

---

## Networking configuration

#### VPC

- Virtual network you'd like to host the database in.
- VPC defines the virtual networking environments for this DB instance.

#### Subnet Group

- Selection of subnets within the VPC
- Subnet group that defines which subnets and IP ranges the DB instance can use in the VPC you selected

#### Public Accessibility

- DB Instance accessible from outside the VPC
- Allocates a public IP address to your RDS instance
- You need to allow outside access in your security groups

#### Availability Zone

- Any preference for AZ

#### VPC Security Groups

- Control the traffic in and out of your database instance
- Any preference for AZ

#### Database Name

- The name of the default database that will be created

#### Database Port

- TCP/IP Port that applications will use to connect to the database instance

#### DB Parameter Group

- A group of parameters which define the configuration of the database instance

#### DB Option Groups

- Optional functionality you would like to enable on the Database Instance

#### Encryption

- Encryption at rest for your Database Instance

#### Enhanced Monitoring

- EM metrics allow you to see how different processes or threads use the CPU
