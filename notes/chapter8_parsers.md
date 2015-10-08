# Functional parsers

A parser is a program that takes a string of characters, and produces some form
of tree that makes the syntactic structure of the string explicit.


    type Parser a = String -> [(a, String)]

this declaration states that a parser of type a is a function that
takes an input string and produces a list of results, each of which is a pair
comprising a result value of type a and an output string.


## Basic parsers

+   return
+   failure
+   item


## Sequencing

    p1 >>= \v1 ->
    p2 >>= \v2 ->
    .
    .
    .
    pn >>= \vn ->
    return (f v1 v2 ... vn)
    
is the same as:

    do v1 <- p1
       v2 <- p2
       .
       .
       .
       vn <- pn
       return (f v1 v2 .. vn)
