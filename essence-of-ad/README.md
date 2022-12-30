# The simple essence of Automatic Differentiation

## Background Knowledge

* $f$ is linear map
$$
\begin{aligned}
f(au) &= af(u) \\
f(u+v) &= f(u) + f(v)\\
\end{aligned}
$$
* we also called it a linear transformation

* [Derivative as a linear map](https://math.stackexchange.com/questions/621949/understanding-the-derivative-as-a-linear-transformation)
  * i.e. Derivative is a **local** approximation of functions by **linear function**
  * Derivative is a matrix (Jacobian matrix)
  * Given a function a $f : R^n \rightarrow R^m$, its derivative is a $m\times n$ matrix
* Derivative of function $f$ at a point $a$ need to satisfy two condition
  1. it's a linear transformation $y = \mathbb{A}x + \mathbb{B}$
  2. at point a, $y(a) = f(a)$
* Hence, the best approximation is linear transformation defined as
$$
\begin{aligned}
y &= Df(a)(x - a) + f(a) \\
y - f(a) &= Df(a)(x - a) \\
y^* &= Df(a)x^* \\
\end{aligned}
$$
where Df(a) is the derivative of $f$ at $a$ and it's a matrix

* homomorphic
  * A and B are homomorphic, there is homomorphism from A to B
  * homomorphism is structure preserving map

* generalization of chain rules of derivative
  * Given
$$
\begin{aligned}
y &= f(g(x)) \\
A &= Df \\
B &= Dg \\
\end{aligned}
$$
  * therefore, at point any point a, we have the following linear approximation
$$
\begin{aligned}
y &= C(x - a) + f(g(a)) \tag{by definition}\\
\text{where } C &= AB\\
\end{aligned}
$$

* For all linear function $f$, given any $a$, $\mathcal{D} f a = f$
  * make senses since linear function itself is its own best local linear approximation.

* Category
  * A collection of Objects
  * A collection of morphism for each A, B from the collection of objects
  * Each object has identity morphism
  * Morphism can be composed

* Functor law
$$
\begin{aligned}
F \space id &= id \\
F \space (g . f) &= F \space g . F \space f
\end{aligned}
$$

* Additive
  * required for Co-cartesian categories
  * required for jam operation
```Haskell
class Additive a where
  zero :: a
  (+) ::
```

* [biproduct category](https://ncatlab.org/nlab/show/biproduct)

* vector space A over a scalar field s
  * vector space
  * field

## Introduction

* Contribution
  * Define a category of derivative-augmented functions
  * Calculate a correct-by-construction AD implementation from the homomorphic **specification**
  * define several AD variation from different representations of linear map
    * functions that satisfying linearity
    * generalized matrices
    * continuation-based transformations (useful in implementing RAD)
    * dualized version (useful in implementing )
* All algorithms in this paper are free of mutation and hence naturally parallel

## Key question

* What's homomorphic specification?
* Continuation based RAD?
* What makes it free of mutation?

## Putting the piece together
* construct a vanilla function category in Haskell
$$\mathcal{C} \space a \rightarrow b$$
* define a differentiable function category in Haskell
$$D \space a\rightarrow (b \times a \multimap b)$$
* assume there is a functor $\hat{\mathcal{D}}$ from C to D
* compute the composition and identity morphism of D using equation derived from functor laws
* using equational reasoning

* The trick is to specify category instances via a functor

### Construction of D


$$
\begin{aligned}
\textbf{newtype} \text{ D a b} &= \text{D } (a \rightarrow b \times (a \multimap b)\\
\mathcal{D} &:: (a \rightarrow b) \rightarrow a \rightarrow (a \multimap b) \\
\mathcal{D}^{+} &:: (a \rightarrow b) \rightarrow (a \rightarrow b \times (a \multimap b))\\
\hat{\mathcal{D}} &:: (a \rightarrow b) \rightarrow \text{D a b}\\
\end{aligned}
$$

### Enrichment of D category
* D category is a
  * Monoidal category (a `k` b) -> (c `k` d) -> ((a `k` c) -> (b `k` d))
  * Cartesian category
    * exl
    * exr
    * dup
  * Cocartesian cateogory
    * inl
    * inr
    * jam
  * derived high-level operator
$$
\begin{aligned}
\triangle &:: a `k` c \rightarrow a `k` d \rightarrow a `k` (c \times d)\\
\triangledown &:: c `k` a \rightarrow d `k` a \rightarrow (c \times d) `k` a\\
\text{join} &:: (c 'k' a \times d `k` a) -> (c \times d `k` a)\\
\text{unjoin} &:: (c \times d `k` a) -> (c `k` a\times d `k` a)\\
\text{fork} &:: (a `k` c \times a `k` d) -> (a `k` c \times d)\\
\text{unfork} &:: (a `k` c \times d) -> (a `k` c \times a `k` d)\\
\end{aligned}
$$

## Generalizing Automatic Differentiation
* insight
  * the sequential and parallel composition of D rely respectively on sequential and parallel composition of linear map
  * factor out the **linear map**

## Representation of Linear Map
* We can have different representation of linear map $\multimap$
  * $\rightarrow$
  * matrices

## Reverse Mode AD (RAD)
* efficient implementation requires
  * separate the association used in formulating a differentiable function
  * from the associations used to compose its derivatives
* fully left association of composition
* Cont category
```Haskell
newtype Cont r k a b = Cont ((b `k` r) -> (a `k` r))
```
## Related Work

* insight
  * reverse mode: primal data-flow graph is transformed to an **adjoint** graph
    * adjoint means reverse
    * addition node become fanout node
  * the main implementation challenges:
    * multiple use of variables in the primal data-flow graph (fanout)
    * must be converted into **addition** in the reverse mode
  * three category D, Cont, Dual
    * precise specification of instances via functoriality
    * the calculation of implementation from these specifications

## Conclusion