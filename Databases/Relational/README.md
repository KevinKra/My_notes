# SQL

> Structured Query Language, a programming language.

### Preferences

- **SQLite** - Great for experiments and local development, never use in production.
- **MySQL** - Popular and widely available, but avoid it if you can.
- **PostgreSQL** - The best choice for both development and production.
- **MS SQL Sever, Oracle** - Trusting production stack to a closed-source code is a non-starter.

### SQLite

- Most databases store data in a hidden-away part of a computer's filesystem. You'd never interact with the data directly, rather you would use tools provided by the database engine.
- SQLite instead stores its data in a plain-text file. This makes it incredibly easy to move, rename, delete, and transfer.s
- SQLite is built into MacOS X.
- SQL commands are not case sensitive. Convention is to write SQL instructions in UPPERCASE.

### Commands

- `sqlite3 name.sqlite3`
- `CREATE TABLE fruits(id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR(31), quantity INT)`
- `INSERT INTO fruits(name, quantity) VALUES ('bananas', 12);`
- `SELECT * FROM fruits;`
- `ctrl + d` - escape
- `.mode column`
- `.header on`

#### Scoping Data

- `SELECT * FROM fruits WHERE name='apples';`
- `SELECT * FROM fruits WHERE quantity=18;`

#### Calculating Data

- `SELECT * FROM fruits WHERE LENGTH(name)=7;`

#### Limited Selection

- `SELECT * FROM fruits WHERE id=3`

#### Removing Rows

- `DELETE FROM fruits WHERE name='oranges';`

#### Updating Rows

- `UPDATE fruits SET quantity=22 WHERE name='bananas';`

#### Adding Columns to a table

- `ALTER TABLE fruits ADD COLUMN country_of_origin VARCHAR(127);`

#### Ordering

- `SELECT * FROM fruits ORDER BY name;`
