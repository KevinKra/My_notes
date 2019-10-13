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
