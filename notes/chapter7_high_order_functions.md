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

## foldl function

        foldl :: (b -> a -> b) -> b -> [a] -> b
        foldl f v [] = v
        foldl f v (x : xs) = foldl (f v x) xs

## composition operator

The higher-order library operator ```.``` returns the composition of two functions
as a single function, and can be defined as follows:

        (.) :: (b → c) → (a → b) → (a → c)
        f . g = λx → f (g x )

Composition can be used to simplify nested function applications, by reducing parentheses 
and avoiding the need to explicitly refer to the initial argument.
For example, using composition the definitions

        odd n = not (even n)
        twice f x = f (f x)
        sumsqreven ns = sum (map (**2) (filter even ns))

can be rewritten more simply:

        odd = not . even
        twice f = f . f
        sumsqreven = sum . map (**2) . filter even

** the difference between ```$``` and ```.```

The ```$``` operator is for avoiding parenthesis. Anything appearing after it will take precedence over anything that comes before.

        putStrLn(show(1 + 1)

can be rewritten as:

        putStrLn $ show $ 1 + 1
        putStrLn . show $ 1 + 1

in fact:

        >  :type (.)
        (.) :: (b -> c) -> (a -> b) -> a -> c
        >  :type ($)
        ($) :: (a -> b) -> a -> b
