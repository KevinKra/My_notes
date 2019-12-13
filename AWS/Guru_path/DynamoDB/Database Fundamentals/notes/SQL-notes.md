# SQL notes

### Terms
- **Scalar Table** - a table with a single column and row.
- **Subquery** - A _nested_ query.
- **Aggregate** -


### Concepts

#### Inner Join
- Takes a left and right table and looks for matching rows based on a join condition `(ON)`. When the condition is satisfied, a joined row is produced.

#### Left Outer Join
- Operates similarly to an Inner Join, except that if a given row on the left table doesn't match anything, it still produces an output row. That output row consists of the left hand table row and a bunch of `NULLS` in place of the right hand row.

#### StringConcatenation
- `mems.firstname || ' ' || mems.surname`

### Questions
- What is a Scalar Table?
- What is a subquery?
- Describe an Inner Join.
- Can you inner join on the same source table?
- Describe a Left Outer Join.
- What is the difference between an Inner Join and a Left Outer Join?
- How do you conduct a three join?
- How do you concat strings?