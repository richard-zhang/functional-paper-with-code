# [continuation: The swiss army knife of flow control](https://youtu.be/Ju3KKu_mthg)

## Scheme Syntax
* no operator overload
* lambda function
* immutable list: '(1,2,3,4)
* true: #t, false: #f

## stack and stack frame introduction
* stack frame
  * return address: the result of function
  * parameters
  * local variables

## continuation
* a continuation is where a function "cotinues on" to
  * refers to entire stack-frame of a process
* schema
  * save the **entirety of your current stack**
  * re-instantiate it at will with a **custom return value**

## continuation in Schema
* cotinuation are genreated by call/cc
* when a continuation is called with a single argument
  * gets rid of the current stack
  * replaces it with the stack contained in the continuation
  * performs the return of the function using the argument to the continuation
* invoking the continuation
  * re-instating the stack that was in place when the continuation was created
  * returning the argument to the same context that call/cc was called from
  * **the return value goes to call/cc's calling context**
* continuation is a procedure

## cooperative multithreading with continuation
* preemptive multithreading
  * CPU decide when to yield the resource
* cooperative multithreading
  * must yield explicitly

### API
* (thread-new proc)
* (thread-yield)
* (thread-end)

## Exception

simple exception handling

## logic programming