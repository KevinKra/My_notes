# Algorithms and Data structures

#### Index

[1. Asymptotic Analysis](<#asymptotic-analysis-(Big-O-Notation)>)

## Asymptotic Analysis (Big-O Notation)

> Simplified analysis of an algorithm's efficiency in time and space.

- Determining the time and space (memory cost) complexity of a given algorithm independent of computer or language factors. The type of measurements determined with big-O are: Worst-case, average-case, best-case scenarios. Asymptotic analysis ignores constants and certain terms **dominate** others.

- **Input Size** - running time depends on input size for instance, larger arrays will take longer to sort. We measure _time_efficiency_ as a function of input size.

- **Orders of Magnitude** - asymptotic analysis ignores constants and instead focuses on the most dominant terms. Logarithmic solutions are the most optimal. From most optimal to least: `log n`, `n`, `n log n`, `n^2`, `n^3`, `2^n`, `n!`

- **Sorting algorithms** - sorting arrays of `n` elements using naive algorithms (time proportional to `n^2`) to the best algorithms (time proportional to `n log n`). Currently, CPUs generally process up to 10^8 operations per second. The better the algorithm, the fast it can be solved by the CPU. As an example, if we wanted to sort all of the mobile phones in India, say 10^9 (or 1 billion), a _naive_ n^2 solution would required 10^18 operations (or 10^9 \*\* 2). Since the CPU runs at `10^8`, that would result `10^10` seconds, or 300+ years, to resolve the problem. On the other hand, a `n log n` algorithm would solve it in `3 x 10^10` operations, or in 5 minutes.

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

#### Keywords:

- Big-O measurements
- input time
- naive solution
- Constant time
- Linear time
- Quadratic time

---

#### Questions:

- _What is Asymptotic Analysis?_

- _What are the types of measurement?_

- _What are the general rules regarding asymptotic analysis?_

- _Explain the difference between constant, linear, and quadratic time._

- _Describe a real-world example in which algorithm efficiency matters._

- _What are the orders of magnitude regarding `t(n)` solutions to `n` input sizes?_
