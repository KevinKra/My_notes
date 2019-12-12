# Relational Databases

## SQL

### Structure
- **Tables** - collection of rows and tables.
- **Rows** - collection on _records_.
- **Columns** - Are fields, which store data for each record.

### Key Types
- **Candidate keys** - Any columns which can uniquely identify a row. `Employee ID` or `National ID` columns (provided each record is unique in its row) could serve as candidate keys.
- **Primary key** - _One_ candidate key, selected to provide unique identification of every row.
- **Foreign key** - Uniquely identifies a primary key in another table.
- **Composite primary key** - A key determined by combining two candidate keys.

### SQL Technical
- Query Parser
> Query Tree is built by breaking data into logical parts.
- Query Optimizer
> Determines the optimal solution for storing data. Selects the fastest and most efficient queries, resulting in an updated query tree, and a final Execution Plan.
- Relational Engine
> Executes the plan, and passes requests for specific rows and tables to the storage engine.
- Storage Engine
> Makes requests from hardware to pull in sections from the raw DB files from disc, memory, or cache. Data is then processed and returned back to the client by the relational database engine.

### Scaling

#### Vertical Scaling
- Increasing the hardware capabilities. SSD, CPU, etc. 

#### Horizontal Scaling
- Building out and leveraging additional resources like more instances, read-replicas (slaves), etc.

#### Sharding
- Splitting _a table_ across different database servers - Conceptually easy to implement, simply create different databases. Though, without database support, cross-table queries are impossible to carry out or can be extremely expensive in performance.

> Customer table is on one database, Staff table is held on another database.

- **Row-level Partitioning** - true db support. Defined logic which hones row sets to specific servers (ie. even rows to one server, odd rows to another.) Benefit of this sharing approach is a near linear approach over additional servers. As the data set increases, we split the rows over more and more database servers. Though, like the previous solution there are performance hits for cross-table queries.

> Customers and Staff tables are row-level partitioned by even / odd rows across different databases. More scalable, but same performance costs for cross-table queries.

### Questions:
- What is a candidate key?
- What is the difference between a candidate key and a primary key?
- What is a composite primary key?
- What are the general steps for SQL table generation?
- What is sharding? What are two different approaches to sharding?
- What is a slave instance, what is its relation to scaling?


## Data Normalization
- Normalization is a process which prepares data to be stored in a database. It helps establish tables and relationships between tables. It eliminates redundancy and inconsistent dependency.

1. Prepares the data to be stored in a database.
2. Establish tables and their relationships.
3. Eliminates Redundancy.
4. Eliminates Inconsistent Dependency.

> Takes chaotic data through states (or forms) and prepares them to be stored in a relational database.

### Normalization Forms

- **1NF:** 
  - Rule 1: We need a primary key. - each row can be identified uniquely.
  - Rule 2: No duplicate rows. - no duplicate primary key values.
  - Rule 3: No attributes which contain more than one item of information.

- **2NF:**
  - Rule 1: Data already in 1NF.
  - Rule 2: No partial dependencies on a composite key. ex: Description, Color, and Price columns, depend on _item #_, but not _order #_.

- **3NF:**
  - Rule 1: No dependencies on non-key attributes.

#### Benefits of Normalization

- **Cost** - No duplicated data = cheaper storage.
- **Speed** - less data = faster processing.
- **Integrity** - no data duplication = less consistency errors.
- **Faster Manipulation** - Update data once = cascades across all related records.

### Questions
- What is data normalization?
- What are the four objectives of data normalization?
- Explain first normal form.
- Explain second normal form.
- Explain third normal form.
- What are the benefits of normalization?

## NoSQL Fundamentals

- There isn't _one_ single NoSQL architecture.
- Two forms of NoSQL: Those that are aggregate orientated, those that aren't.
- Aggregate oriented database products deal with blocks of data in groups, that is their aggregate. This aggregate can be simple, a key value pair, or a large-complex JSON document. The premise, is that the database treats that aggregate (or object) as its base level data structure. If you and your database don't match aggregates you have a problem called **impedance mismatch**. If the data structures you work with in memory aren't the same ones you store, process, and retrieve, from the database platform, it makes for inefficient code and a worse product.


### Key differences between SQL & noSQL

#### Relational Databases (SQL)
- Requires a carefully predefined Schema prepared in advance.
- Schema defines the columns and fields in a table, as well as the data types and any restrictions.
- Must have uniform columns/fields.
- Requires normalization.

#### Non-relational Database (noSQL)
- No enforced schema, provides great flexibility but the application needs to be aware of it.
- Does not need to have uniform columns/fields.
- Support 24/7 highly available applications, SQL databases sometimes need lengthy schema update operations, not so for noSQL.
- No need for normalization, or at least less so. 
- Data is represented in a much more atomic form, or something with close alignment with the object-nature or aggregate of the application.
- No Structured Query Language.

## Consistency Models

### ACID (SQL)

> A set of properties that govern how a relational database engine processes transactions.

- **Atomicity** - A process that describes how a relational database considers each transaction atomic. If a transaction, a sequel query, has a number have separate components (3 attributes are all updated,) then the transaction will either _succeed_ or _fail_ for all 3 interactions. You will **not** have a partial success completion of a transaction. A transaction is atomic, all or nothing.

- **Consistency** - On the completion of a transaction, the database is in a structurally sound state. Within relational databases, you can have restrictions on what data an attribute can contain. Consistency means that at the end of a transaction, all restrictions are met or the transaction does not run as a whole unit.

- **Isolation** - Transactions do not contend with one another. One sequel query runs, make changes to a database, and then completes. Your sequel query must behave in an expected manner regardless of the volume of parallel transactions happening currently in the engine.

- **Durability** - A successful transaction must permanently change the state of system _and_ before ending the state changes are recorded in a consistent transaction log. That means, memory caching or other techniques are valid, but you must complete a consistent log. If there is a power outage, there is a method to replay that transaction onto persistent storage **before it is marked as completed.** Before something can be reported as completed, it must be recorded.

#### ACID pros/cons
- Ensures consistent expected behavior of data transactions between applications.
- Massive costs: Limits performance (especially distributed performance,) and limits horizontal scaling.
- Fairly universal in the relational world.
- Focuses on data safety over performance.

### BASE (NoSQL)

> Basically Available. Database design philosophy that prizes availability over consistency of operations.

- Database should work most of the time.
- **Soft State** - stores don't have to be write consistent, nor do write-replicas have to be correct 100% of the time. 
- **Eventual Consistency** - states that elements of the database will demonstrate consistency at some point.
- Used by aggregate focused platforms: key-value, document, or column/family databases.
- Scalability is much more attainable. SQL databases sacrifice a huge amount of scalability in favor of consistency and the ability to handle relations across tables.

### Questions:
- What model (BASE / ACID) is favored for Relational and Non-relation databases?
- What does ACID break out to? What does each step mean?
- What are the design pros and cons of ACID?
- What does BASE mean?
- What are the design aspects of BASE?
- What is soft state?
- What is eventual consistency?
- What sacrifices does ACID make and how does it limit scalability in relation to BASE design?

# 4 Types of NoSQL Databases

## NoSQL Key-Value DB

- Data is stored in Key-Value pairs (duh.)
- The Key _must be unique_. Generally, the key is the only value in which data retrieval operations can function on.
- The value is generally schema-less during the whole life-cycle of the data.
- **The value block can, in some cases, contain attributes.** This practice is not standard across all NoSQL designs.
- In a _pure_ key-value store, the value is an atomic **opaque blob** of data and the database engine cannot perform any meaningful operations on.
- Attributes can be simple types, or even complex types like lists or arrays, and some can even hold nested value types.
- Some key/value databases only have keys and values, others can group keys and values into **perceived tables.** These tables do not have the built in explicit/implicit/assumed relationships. You cannot run SQL queries against them. Though, they are very lightweight, super fast, and scale very well horizontally as the key space can be split over several servers.

## Document DB

> Their design is converging with Key-Value stores

- At a very high level, Document DB stores are very similar to NoSQL Key-Value stores. But the values, or **documents**, are stored in a structured document encoding such as XML, JSON, or BSON (a binary version of JSON.) In a Document stored DB, the key value would be encoded as a document with its value comprised of **rich data**. The rich structure, essentially an object of key-values itself, is what makes document stores different than NoSQL Key-Value stores.
- The rich data allows for data structures to be _nested_ within document stores.
- Some high level differences, **the Document is the aggregate.** You work with document objects, your data model is documents, and you interact with documents. When it comes to scaling, the database spreads documents across its partitions, servers, or nodes.
- You should use document stores if you're working with data that can be grouped in a document.
- Document stores are not suitable for large-scale social networks or location aware applications with massive social components.
- Unlike pure key-value stores you _can_ interact with the document structure. For instance, you can search all documents for certain values. Documents can be interacted with based on certain attributes and some documents can even be built based on certain attribute values.
- Able to reference other documents. Allows for basic system of relationship or attachment reuse.
- All documents need a unique key.
- MongoDB is a popular Document DB.

## Column Family DB

- Data is grouped and stored around columns and not rows.

### Row vs Column

#### Rows
- Row base databases are much better at single record processing. Better for smaller databases. 
- Not suitable for large scale or high frequency row-subset queries, ex: a few fields are required over every row or SQL aggregate functions are used requiring them to traverse over every row and waste data retrieval allocation.

#### Columns
- Faster and more efficient data access if you don't operate at an object level, If you need to update values across objects and aggregates a column based data-store is more efficient.
- Improved compression, values stored in columns are of the same type and often have very few distinct values relative to the amount of relative data rows being considered.
- Better Parallel Processing - Columns can be partitioned can individually or in groups and can be run on several discrete nodes. DB platform can partition queries so that dedicated resources handle processing of operations on specific columns.
- Generally used when huge quantities of data need to be stored for later aggregate based analysis.

## Graph Style DB

- Equally considered with Data and Relationships, making them different than other noSQL database platforms.
- Strong emphasis on relationships.
- Relationships are fluid and persistent. 
- In relational databases, relationships are derived from primary and foreign keys. These are calculated at query time, via the SQL processing engine, which is cpu and memory intensive. This poses a problem for people using relations as a core feature of the database.
- Many-to-Many relationships are easy to implement, and encouraged, with Graph DBs.
- Models the real-life social/relational type links without modelling changes.
- Extremely useful when context or relations between things, nodes, and objects, is the core of the product.
- Don't have the concept of SQL, instead many have a comparable language that serves that function.
- Rapidly gaining in popularity especially web-apps with a social or relationship component.

#### Core concepts
- **Nodes** - _Things or nouns._
- **Properties** - Key value pairs.
- **Relationships** - Relationships between nodes, _verbs_. PersonA(node) works-at(relationship) PlaceB(node). Relationships always have a start and end node.
- **Labels** - Allows for rudimentary typing, or labeling, of objects.

### Questions:
- Describe a Key-Value NoSQL DB.
- Describe the features of a _pure_ Key-Value DB.
- What is an opaque blob.
- What is a perceived tabled.
- Describe a Document based DB.
- What languages can a document be stored in?
- What is rich data and how does this make document DBs different than Key-Value DBs?
- What are document stores suitable/not suitable for?
- What are column DBs suitable for in comparison to row based DBs?
- Describe a Graph Style DB.
- What are the core components of a Graph Style DB?


## SECTION NOTES
- What is a candidate key?
- What is the difference between a candidate key and a primary key?
- What is a composite primary key?
- What is sharding? What are two different approaches to sharding?
- What is a slave instance, what is its relation to scaling?
- What is data normalization?
- What are the four objectives of data normalization?
- Explain first normal form.
- Explain second normal form.
- Explain third normal form.
- What are the benefits of normalization?
- What model (BASE / ACID) is favored for Relational and Non-relation databases?
- What does ACID break out to? What does each step mean?
- What are the design pros and cons of ACID?
- What does BASE mean?
- What are the design aspects of BASE?
- What is soft state?
- What is eventual consistency?
- What sacrifices does ACID make and how does it limit scalability in relation to BASE design?
- Describe a Key-Value NoSQL DB.
- Describe the features of a _pure_ Key-Value DB.
- What is an opaque blob.
- What is a perceived tabled.
- Describe a Document based DB.
- What languages can a document be stored in?
- What is rich data and how does this make document DBs different than Key-Value DBs?
- What are document stores suitable/not suitable for?
- What are column DBs suitable for in comparison to row based DBs?
- Describe a Graph Style DB.
- What are the core components of a Graph Style DB?

---

# DynamoDB Basics


