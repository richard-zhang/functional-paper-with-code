# [Refeflection in C++](https://youtu.be/YXIVw6QFgAI)

## Reflection
* Ability of a program to observe its own code and shape its behavior accordingly
  * in the context of C++: Ability of a template to query details of its tempalte params and shape its definition accordingly

## Design by reflection
* reflection proper
* insertion
  * code generation driven reflected information

### Recipe
1. extract information from types (e.x. does it have certain method, a vritual destructor)
2. process informatioin (constexpr|val)
3. insertion

## Top-level motivation
* more (correct) behaviors from fewer lines of code (increasing leverage)
* problem: code inflation, millions lines of code
* problem: "boilerplate": actual business logic is hidden from boilerplate code

## Powerset interface
* have one interface with lots of functions
  * each operation is optionalliy implemented
  * choose to implement subset of intefaces
* instead serval small interfaces with simple operations

## Ingredient for static reflection
* consteval
* compile time
  * new
  * allocator
  * vector
  * string

## Current C++ reflection proposal
* reify operator ^
  * ^T reify type T to runtime value
  * this runtime value contain all the information relating to type T
  * the runtime type has the type `std::meta::info`, the reified values
* reflect operator [:e:]
  * [::] convert the runtime type e to a type
* axoims
  * [:^T:] = T, ^[:e:] = e

## Example: Print the name of an enum

* switch statement
```cpp
#include <meta>

template<typename T> requires(std::is_enum_v<T>)
std::string to_string(T value)
{
    switch(value)
    {
        template for (constexpr auto e : std::meta::members_of(^T)) {
            case [:e:]: return std::string(std::meta::name_of(e));
        }
        default: return "<unnamed>";
    }
}
```
* mixing switch and if-then-else using **compile time** algorithm selection



## Reference

* virtual destructor
  * destruct things in proper order

* private inheritance? for calgraph

* inheritence from public type