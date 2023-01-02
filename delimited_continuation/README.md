# Paper About Continuation

## Delimited Continuation in operating systems

### Introduction
* Definition of Delimited Continuation
  * continuation
    * evaluation context, a function map results to answers
  * delimited : may be reused and composed
    * the continuation produces an intermediate answer
    * rather than the final answer
* continuation should be used **explicitly** in Operating System
  * user program mades a system call to kernel
    * execution context of user program is a continuation
    * a continuation is a function that mapped the kernel reply to the outcome of the user process

### Example Cat

Intorduce two important high level function in **delimited** continuation
  * shift
  * reset

* difference between delimited continuation and continuation
  * A continuation is delimited when 
    * it produces an intermediate answer
    * rather the final outcome of the entire computation.
