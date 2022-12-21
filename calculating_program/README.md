## Calculating Program: Lecture 1

* fold/unfold style of program calculation

### Introduction
* Teacher world: Specification =Proof=> Implementation
* Real world: Implementation =Proof=> Specification
* Calculating world: Specification =calculation=> Implementation

* Program calculation
  * A collection of approaches to derive a program from its specification

### Example 1

* Factorial

Rewrite
```Haskell
fac 0 = 1
fac (n+1) = (n+1) * fac n
```
to
```Haskell
fac' a n = a * fac n
fac' a 0 = a * fac 0
```
by using folding/unfolding techniques

### Example 2

* fibonacci

Rewrtie
```Haskell
fib 0 = 1
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)
```
to
```
twoFib n = (fib n, fib (n + 1))
```


### Summary

* start from specification (potentially inefficient program given as a set of recursive equations)
  * start from the first principle
* Introduce a new definition
* Instantiate a definition with specific arguments
* Unfold: rewrite by replacing **lhs** of a recursive equation with **rhs**
* Fold:   rewrite by replacing **rhs** of a recursive equation with **lhs**

