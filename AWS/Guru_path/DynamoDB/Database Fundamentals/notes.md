# Relational Databases

## SQL

### Structure
- **Tables** - collection of rows and tables.
- **Rows** - collection on _records_.
- **Columns** - Are fields, which store data for each record.

### keys
- **Candidate keys** - Any columns which can uniquely identify a row. `Employee ID` or `National ID` columns (provided each record is unique in its row) could serve as candidate keys.
- **Primary key** - _One_ candidate key, selected to provide unique identification of every row.
- **Foreign key** - Uniquely identifies a row in another table.
- **Composite primary key** - A key determined by combining two candidate keys.

### SQL Technical
- Query Parser
> Query Tree is built by breaking data into logical parts.
- Query Optimiser
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

- Row-level Partitioning - true db support. Define logic which hones row sets to specific servers (ie. even rows to one server, odd rows to another.) Benefit of this sharing approach is a near linear approach over additional servers. As the data set increases, we split the rows over more and more database servers. Though, like the previous solution there are performance hits for cross-table queries.

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
2. Helps establish tables and relationships between tables
3. Eliminates Redundancy
4. Eliminates Inconsistent Dependency

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

