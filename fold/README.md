# fold

A tutorial on the universality and expressiveness of fold

* Reading this to prepare my work on applying recursion schemes

## fold

Two usages of folds

* proof principle
  * avoid the need for inductive proof
* definition principle
  * transform **recursive** functions into definitions using fold

## Universal property of fold (Proof Principle)

Proving function involving folds doesn't need explicit inductive step. E.x.

To prove: `g = fold f init`
only need to prove two equations without recursion
1. `g [] = init`
2. `g (x:xs) = f x (g xs)`

## Fusion property of fold

* using universal property to calculate the condition where the fusion property is true

```haskell
h . fold g w = fold f v
```
by universal property
1. `(h . fold g w) [] = v` therefore `h w = v`
2. `(h . fold g w) (x : xs) = f x ((h . fold g w) xs)`
   * lhs:`h (fold g w (x : xs)) = h (g x (fold g w xs))`
   * rhs:`f x (h (fold g w xs))`
   * therefore: `h (g x y) = f x (h y)`

* can use fusion property to prove as well

`map f . map g = map (f . g)`
* map look like linear map => from category of function composition to ...
  * `.` is addition
* can also be proved using fusion property

Conclusion: many proof can be simplified using fusion property of map. If not, using the universal property.

## Universality as a definition principle
* universality = definition of fold
* Key insight: to transform a recursive program on list using fold, we need to calculate the `f` using the universal property

Example. Use universality property to compute foldl
## Greater expressive power of fold

* function as a first class value

* tuple as a first class value

## Using fold to generate tuples

* Implementation of dropWhile
* Generalization of function primitives
* h is recursive function on list
```hs
h y [] = f y
h y (x:xs) = g y x (h y xs)
```
* h primitive recursion
```hs
h y [] = f y
h y (x:xs) = g y x xs (h y xs)
```
not possible convert h to foldr directly but possible to do indirectly using tuple.
### Step
* `k y xs = (h y xs, xs)` similar to `dropWhile' p xs = (dropWhile p xs, xs)`
* represent k in fold using universal property
```
k y [] = j
k y (x:xs) = i x (k y xs)
```
* generalizing `h y xs` to `z`
  * if one side contains a free variable make sure to represent the function indirectly so that this free variable can be bounded.
  * i.e. this free variable will show in both side of equations when simplifying universal properties.


## Using fold to generate function

* expressing left fold in terms of right fold
  * if right_fold's accumulator has type `b`
  * then left_fold's accumulator has type `b -> b`
* tail recursion and continuation passing style are closely related

## Ackermann’s function
A total computable function that is not primitive recursive
* Total function defined for every element in X
* primitive recursive
  * a computer program whose loops are all "for" loops
```
A(0, n) = n + 1
A(m+1, 0) = A(m, 1)
A(m+1, n+1) = A(m, A(m+1, n))
```
* In higher order functional language like Haskell, Ackermann's function is **primitive recursion**
  * mutual recursion?


## quote
* The structural equivalence between right fold and cons.
> A list in Haskell is a spine made of cons calls and a nil at the end. Because if you change cons to a binary operation and nil to a value you can visually see that a fold corresponds to substituting the constructors by functions.

* **fold** is a recursive operator
> Such repetition in common pattern recursion or common pattern of inductive proof can be avoided by introducing special **recursion operator** and **proof principle** that encapsulate the common patterns, allowing us to concentrate on the parts that are different for each application.

* Pros and cons of using fold
> Programs written using fold can be less readable than program written using explicit recursion, but can be constructed in a systematic manner, and better suited to **transformation** and proof.