# Chapter 3 Types and classes

A **type** is a name for a collection of related values.    
We use the notation ```v :: T``` to mean that ```v``` is a value
in the type ```T``` , and say that ```v``` “has type” ```T```. 

In Haskell, every expression must have a type, which is calculated prior
to evaluating the expression by a process called **type inference**.   
In practice, type inference detects a very large class of program errors, and is one of the most useful features of Haskell.

## Basic types

+   Bool   
    logic values, contains ```True``` and ```False```

+   Char   
    single characters

+   String   
    sequences of characters.

+   Int    
    fixed-precision integers.

+   Integer    

    arbitrary-precision integers. 

    Apart from the different memory requirements and precision for numbers
    of type Int and Integer , the choice between these two types is also one     of performance. 
    In particular, most computers have built-in hardware for processing
fixed-precision integers, whereas arbitrary-precision integers must usually be processed using the slower medium of software, as sequences of digits.

+   Float    
    single-precision floating-point numbers.      
    
    The term floating-point comes from the fact that the number of digits permitted after the decimal point depends upon the magnitude of the number.
