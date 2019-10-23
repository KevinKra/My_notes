# Developer

## IAM

- IAM allows you to manage users and their level of access to the AWS and console.

#### Features

- Shared Access to AWS account
- Gives you centralized control of an AWS account
- Granular permissions
- Identity Federation (Facebook, LinkedIn)
- MFA
- Provides temporary access for users/devices and services, as necessary.
- Allows password rotation policy

#### Types

- **Users** - End users
- **Groups** - A collection of users under on set of permissions
- **Roles** - You create roles and assign them to AWS resources / users
- **Policies** - Document that defines one or more permissions

---

## DynamoDB

- A fast and flexible noSQL database service for all applications that need consistent, single-digit millisecond latency at any scale. It is a fully managed database and supports _both_ document and key-value data models. Its flexible data model (don't need to define schema upfront) and reliable performance make it a great fit for mobile, web, gaming, ad-tech, IoT, and many other applications.

#### Features

- Stored on SSD Storage
- Spread across 3 geographically distinct data centers
- Two Consistency Models:
  - Eventual Consistent Reads (default)
  - Strong Consistent Reads

#### Read Consistency

- **Eventually Consistent Reads:**
  - Consistency across all copies of data is usually reached within a second. Repeating a read after a short time should return the updated data.
- **Strongly Consistent Reads:**
  - A strongly consistent read returns a result that reflects all the writes that received a successful response prior to the read.

#### Format

- Tables
- Items (rows)
- Attributes (columns)
- Supports key-value and document data structures
  - documents can be written in **JSON, HTML, XML**

#### Querying

- Primary Keys

  - DynamoDB stores and retrieves data based on a primary key.

### _2 types of primary key:_

#### Partition Key

- Unique attribute (ex: userID)
- Value of the Partition key is input to an internal hash function which determines the partition or physical location on which that data is stored.
- If you are using a partition key as your primary key, then no two items can have the same partition key.

#### Composite Key

- Partition Key + Sort Key
- Ex: user posting multiple times to a forum.
- Primary key would ne a composite key consisting of a Partition Key (userID) and a Sort Key (timestamp of the post.)
- 2 Items may have the same Partition Key, but they must have a different Sort Key.
- All items with the same Partition Key are stored together, then sorted according to the Sort Key value.
- Allows you to store multiple items with the same Partition Key.

#### Access Control

- Authentication and Access Control is managed by AWS IAM.
- You can create an IAM user within your AWS account which has specific permissions to access and create DynamoDB tables.
- You can create an IAM role which enables you to obtain temporary access keys which can be used to access DynamoDB.
- You can also use a special IAM Condition to restrict user access to only their own records. A **condition** can be added to an IAM policy that restricts user access to only the items where the partition key matches the user's (accessing the db) userID.

### Exam tips:

- Amazon DynamoDB is a low latency NoSQL database.
- Consists of Tables, Items, and Attributes.
- Supports **both** document and key-value data models.
- Supported document formats are JSON, HTML, and XML.
- 2 types of Primary key - Partition key and the Composite Key.
- The composite key consists of a Partition Key and Sort Key.
- 2 Consistency Models: Strongly Consistent / Eventually Consistent.
- Access is controlled using IAM policies.
- Fine grained access control using IAM Condition parameter:
  `dynamodb:LeadingKeys` to allow users to access only the items where the partition key value matches their user ID.

---
