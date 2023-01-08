## Thought

* implementation in OCaml
* a module signature
  * with required property

1. implement two category of the same signature
2. implement a functor
3. a program written in one category can be automatically transformed to program written in another category
   * since program only compose of syntactic vocabulary

* type-level programming

* module in OCaml
* PPX in OCaml?
  * to implement the automatic conversion?

## Talk
* cannot overload lambda
  * eliminate lambda function using operator like
    * const k
    * id
    * apply
    * curry
* abstract algebra for functions-like things
  * category
    * identity
    * composition
  * cartesian
    * exl
    * exr
    * fork
  * cocartesian
    * inl
    * inr
    * join
  * Exponential (First-class "function") - CartesianClosed
    * apply
    * curry (a, b) `k` c -> a `k` (b => c)
    * uncurry
  * NumCat
    * enhancement from symbolic overloading that only means function to
    * overloading in function like things