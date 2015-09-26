## chapter 7 High-order functions

Formally speaking, a function that takes a function as an argument or returns a function as a result is called **higher-order**. 
In practice, however,because the term **curried** already exists for returning functions as results, 
the term higher-order is often just used for taking functions as arguments.


## foldr function

Many functions that take a list as their argument can be defined using the
following simple pattern of recursion on lists:

        f [] = v
        f (x : xs) = x ⊕ f xs
        
If we encapsulate this pattern of recursion for defining functions on lists, with the operator ``` ⊕ ``` and the value ```v``` as arguments, we get ```foldr```.

        foldr :: (a -> b -> b) -> b -> [a] -> b
        foldr f v [] = v
        foldr f v (x : xs) = f x (foldr f v xs)
