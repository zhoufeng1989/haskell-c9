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

## List types

A **list** is a sequence of elements of the same type, with the elements being
enclosed in square parentheses and separated by commas. We write ```[ T ]``` for
the type of all lists whose elements have type ```T```.

+   The type of a list conveys no information about its length.```[False, True]``` and ```[False, True, True]``` both have type ```[Bool]```.
+   There are no restrictions on the type of the elements of a list.
+   There is not restriction that a list must have a finite length.


## Tuple types

A **tuple** is a finite sequence of components of possibly different types, with the
components being enclosed in round parentheses and separated by commas.
We write ```(T 1 , T 2 , . . . , T n )``` for the type of all tuples whose ith components have type ```T``` i for any ```i``` in the range ```1``` to ```n```.

The number of components in a tuple is called its **arity**. The tuple ```()``` of
arity zero is called the **empty tuple**, tuples of arity two are called **pairs**, tuples of arity three are called **triples**, and so on.    
Tuples of arity one, such as ```( False )```,
are not permitted because they would conflict with the use of parentheses to
make the evaluation order explicit, such as in ```(1 + 2) ∗ 3```.

+   the type of a tuple conveys its **arity**.
+   there are no restrictions on the types of the components of a tuple.
+   note that tuples must have a **finite arity**, in order to ensure that tuple types can always be calculated prior to evaluation.


## Function types

A **function** is a mapping from arguments of one type to results of another type.    
We write ```T1 → T2``` for the type of all functions that map arguments of type ```T1``` to results of type ```T2``` .

Note that there is no restriction that functions must be total on their argu-
ment type, in the sense that there may be some arguments for which the result
is not defined. For example, the result of the library function head that selects the first element of a list is undefined if the list is empty.


## Curried functions

Functions take their arguments one at a time are called **curried**.    
curried functions are also **more flexible** than functions on tuples, because useful functions can
often be made by partially applying a curried function with less than its full complement of arguments.

To avoid excess parentheses when working with curried functions, two
simple conventions are adopted.     

+   The function arrow ```→``` in types is assumed to associate to the right.    
    ```Int -> Int -> Int``` means ```Int -> (Int -> Int)```.

+   function application, which is denoted silently using spacing, is
assumed to associate to the left.     
    ```mult x y z ``` means ```((mul x y) z)```.

Unless tupling is explicitly required, all functions in Haskell with multiple
arguments are normally defined as curried functions.

## Polymorphic types
A type that contains one or more type variables is called **polymorphic** (“of many forms”).      
Type variables must begin with a lower-case letter, and are usually simply named ```a , b , c``` , and so on.

## Overloaded types.

A type that contains one or more class constraints is called **overloaded**, as is an expression with such a type.     
Class constraints are written in the form ```C a``` , where ```C``` is the name of a class and ```a``` is a type variable.

For any type ```a``` that is a instance of the class ```Num``` of numeric types,
the function ```(-)``` and ```(*)``` has type ```a → a → a```.

    ```
    (-) :: Num a => a -> a -> a
    (*) :: Num a => a -> a -> a
    ```
    
## Basic classes.
class is a collection of **types** that support certain **overloaded operations** called **methods**.

+   Eq (equality types)

    This class contains types whose values can be compared for equality and
inequality using the following two methods:    
    
        ```
        (==) :: a → a → Bool
        (!=) :: a → a → Bool
        ```
        
+   Ord (ordered types)   
   
    This class contains types that are instances of the equality class **Eq** , but in addition whose values are totally (linearly) ordered, and as such can be compared and processed using the following six methods:

        ```
        (<) :: a → a → Bool
        (≤) :: a → a → Bool
        (>) :: a → a → Bool
        (≥) :: a → a → Bool
        min :: a → a → a
        max :: a → a → a
        ```

+   Show (showable types)  

    This class contains types whose values can be converted into strings of characters using the following method:
    ```show :: a -> String```.
    
+   Read (readable types)

    This class is dual to Show , and contains types whose values can be converted from strings of characters using the following method:
    ```read :: String → a```
    
+   Num (numeric types)

    This class contains types that are instances of the equality class **Eq** and showable class **Show** , but in addition whose values are numeric, and as such can be processed using the following six methods:
    
        ```
        (+) :: a → a → a
        (−) :: a → a → a
        (∗) :: a → a → a
        negate :: a → a
        abs :: a → a
        signum :: a → a
        ```
        
    Note that the Num class does not provide a **division method**, but as we shall now
see, division is handled separately using two special classes, one for integral
numbers and one for fractional numbers.

+   Integral (inegral types)

    This class contains types that are instances of the numeric class ```Num```,
    but in addition whose values are integers, and support the methods of
    integer division and integer remainder:

        ```
        div :: a -> a -> a
        mod :: a -> a -> a
        ```

+   Fractional (fractional types)

    This class contains types that are instances of the numeric class
    ```Num```,but in addition whose values are non-integral, and support the methods
    of fractional division and fractional reciprocation:

        ```
        (/) :: a -> a -> a
        recip :: a -> a
        ```
