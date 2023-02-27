## Talk

* elements of programming
  * STL on generic programming
    * understand the algorithm and data structures in the most abstract form
  * use mathematical notation to explain the concept
  * write a book in a style of mathematical textbook
    * axiom, lemma
* target
  * addresses programmer who aspire to a deeper understanding of their discipline
  * deeper understanding is not appreciated

* a small subset of C++ instead of using pseudo code

* principles
  * a chain of algorithms
  * algorithmic decomposition

* a generic algorithm to calculate the remainder  
  * inductive case is from n to 2n instead of n to n - 1
  * a generic algorithm that can apply to
    * natural number
    * line segments
    * nonnegative real number
  * generic algorithm
    * based on overloading
    * not only on syntax but also semantics requirement on operators
  * `+` operator
    * associative, commutative
    * anti-example: overloading `+` for string type break commutative rule
  * archimedean monoid is the type that can be applied to remainder algorithm
    * archimedean monoid is a concept
    * concept
      * a collection of syntactic and semantic requirement
      * a set of types satisfying these requirement
      * a set of algorithms enabled by these requirements
      * 1. affiliated types, operations, axioms
    * type is a way to interpret bits

* interesting critics on not using memories
  * a section for how to program with memory
    
