### Sections

- [Resources](#resources)
- [Foundations](#foundations)

# Foundations

[](#foundations)

## Asymptotic Analysis (Big-O)

- Big-O is used in computer science to describe the performance or complexity of an algorithm and the asymptotic behavior of a function, or how quickly it grows. Big-O specifically describes the worst-case scenario, and can be used to describe the execution time required or the space used (in memory) by an algorithm.

- `T(n) = 4n^2 - 2n + 2`, ignoring constants and slower growing terms results in the asymptotic analysis of the function results in T(n) grows at the _order of n^2_.

### Type Overview

#### O(1) Constant

- An algorithm that will always execute in the same time (or space) regardless of input data.

#### O(n) Linear

- An algorithm whose performance _will grow linearly and in direct proportion to the input size._ A for loop is an example of an O(n) operation. Though a desired value may be find early in the traversal process, asymptotic analysis always assumes the worst-case / upper-limit for a given algorithm.

#### O(log(n)) Logarithmic

- An algorithm that has logarithmic growth, or the inverse of exponential growth. An example would be a binary search where each subsequent iteration over a data set is halved. Any increase to the size of a data set would have minimal impact on the operational expense in time in regards to a logarithmic solution. Note, binary searches require a sorted a list.

#### O((log(n))^c) Polylogarithmic

- Polylogarithmic and logarithmic functions are exactly the same. The logarithms differ only by a constant factor and the big-O notation ignores that. Similarly, logs with different constant bases are equivalent.

#### O(n^2) Quadratic

- An algorithm whose performance is directly proportional to the square size of the input data set. Nested loops are an example of a quadratic algorithm. _Additional nested iterations will result in O(n^3), O(n^4), etc._

#### O(n^c) Polynomial

- An algorithm that is significantly slower than an exponential solution, though still not typically ideal.

#### O(c^n) Exponential

- An algorithm whose growth doubles with each addition to the input data set. The growth curve is exponential, starting off very shallow, then exploding. An example would be the recursive calculation of Fibonacci numbers.

### Superpolynomials and Subexponentials

- A function that grows faster than any power of n is called **superpolynomial.** A function that grows slower than an exponential function of the form `c^n` is called **subexponential.** An Algorithm can require time that is both superpolynomial and subexponential. Examples of this include algorithms known for integer factorization.

### 4 Important Rules of Big-O

1. **Different steps get added.** If an algorithm has two steps, `O(a)` and `O(b)`, add the run times together and get `O(a+b)`.
2. **Always drop constants.** If an algorithm has two sibling iterators, one finding the min and the other finding the max of an array, it would not be an `O(2n)` solution. Rather, dropping the constant 2, makes it an `O(n)` operation. It would be fundamentally doing the same thing as a single iterator doing both operations inside of its block.
3. **Different inputs => different variables.** If there are different inputs, two arrays for instance, walking through them would be considered `O(a * b)` **not** `O(n^2)`.
4. **Drop non-dominant terms.** More dominant terms matter, for instance `O(n^2)` is more dominant than `O(n)`.

### Questions

1. Describe Constant algorithms.
2. Describe Linear algorithms.
3. Describe Quadratic algorithms.
4. Describe Exponential algorithms.
5. Describe Logarithmic algorithms.
6. Describe Polylogarithmic algorithms.
7. What the the four important rules of Big-0, explain each.

---

### Resources:

[](#resources)

- [CodeChef](https://www.codechef.com/certification/data-structures-and-algorithms/prepare#foundation) - the foundation of this readme.
- [KhanAcademy](https://www.khanacademy.org/computing/computer-science/algorithms#intro-to-algorithms) - Algorithm overview.
- [rob-bell](https://rob-bell.net/2009/06/a-beginners-guide-to-big-o-notation/) - Big-O
