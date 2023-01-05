## Glossory

* universal property
  * a property that **completely** chracterizes the functions
  * a central theme of these lectures

* categorical approach to datatypes
  * A model of computation is represented by a category
  * types and programs in the model are represented by the objects and arrows of that category
  * A type constructor in the model is represented by a functor on tha category

* Bifunctor

## Introduction

* explicit approach v.s. implicit approach
* explicity approach
  * implement it directly
  * but proving it might reuqire work
* implicit approach
  * come up with a universal property
  * the function is the **unique** solution to this property

* `fork (f, g) a = (f a, g a)`
* universal property of the fork
  * h = fork (f, g) iff exl . h = f ^ exr . h = g

