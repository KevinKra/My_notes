# Algorithms and Data structures

#### index

[1. Asymptotic Analysis](<#asymptotic-analysis-(Big-O-Notation)>)

## Asymptotic Analysis (Big-O Notation)

> Simplified analysis of an algorithm's efficiency

- Determining the time and space complexity of a given algorithm independent of computer or language factors. The type of measurements determined with big-O are: Worst-case, average-case, best-case scenarios. Asymptotic analysis ignores constants, certain terms **dominate** others,

- **constant time** - Any math, assignment, calling operations etc. are examples of constant time `o(1)` operations.

```
let x = 10;
```

- **linear time** - Loops and iterations are linear time `o(n)` operations.

```
// o(1)
let x = 10 + 5
// o(n)
while (x >= 0) {
  console.log("counting down");
  x--;
}

// total time = o(1) + o(n) = o(n) or linear time.
```

- **quadratic time** - Nested for loops or nested linear time operations result in quadratic time `o(n^2)` operations.

```
// o(1) * 2 = o(1)
let y = 5
let z = 10

// o(n) * 2 = o(n^2) or quadratic time
for (let i = 0; i < y; i++) {
  for (let j = 0; j < z; j++) {
    console.log("hello world")
  }
}

// // total time = o(1) + o(n^2) = o(n^2) or quadratic time.
```

**summary:**

1. Complexity in terms of input size `N`
2. machine-independent
3. basic computer steps
4. expense in time and space

---

#### Questions:

- _What is Asymptotic Analysis?_

- _What are the types of measurement?_

- _What are the general rules regarding asymptotic analysis?_
