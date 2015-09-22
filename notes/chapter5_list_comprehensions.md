# Chapter5 List comprehension

## 5.1 Generators.

A list comprehension can be used to construct new list from existing one. In ```[ x ** 2 | x <- [1..5]]```, the symbols ```|``` and ```<-``` are read as **such that** and **is drawn from**, and the expression```x <- [1..5]``` is called a **generator**.

## 5.2 Guards

List comprehensions can also use logical expressions called **guards** to filter the values produced by earlier generators.ex, ```[x | x <- [1..10], even x]```
