# Chapter4 Defining functions

##  4.1 New from old

+   define new from old

    ```
    isDigit c = c >= '0' && c <= '9'
    ```
    
+   Conditional expressions

    ```
    abs n = if n < 0 then n else -n
    ```
    
    Unlike in some programming languages, conditional expressions
    in Haskell must always have an else branch, which avoids the well-known “dangling else” problem.
    
+   Guarded equations


        abs n | n >= 0 = n              
              | otherwise = -n

    
    The symbol ```|``` is read as “such that”, and the guard ```otherwise``` is defined in the
standard prelude simply by ```otherwise = True``` .


+   Pattern matching

    +   basic patterns
    
            True && b = b
            False && _ = False
    
    +   Tuple patterns
        
            fst (x, _) = x
            snd (_, x) = x
    
    +   List patterns
    
            test ['a', _, _] = True
            test _ = False
        
    +   Integer patterns
    
            pred 0 = 0
            pred (n + 1) = n
            

+   Lambda expressions

    nameless functions
    
    +   formalise the meaning of curried function definitions.
        
            add = \x -> (\y -> x + y)
            
    +   define functions that return functions as results by their very nature, rather than as a consequence of currying.
    
            const x _ = x
            const x = \_ -> x
            
    +   avoid having th name a function that is only referenced once.
    
            odds n = map (\x -> \x * 2 + 1) [0..n-1]

+	Sections     
	Functions such as + that are written between their two arguments are called **operators**. As we have already seen, any function with two arguments can be converted into an operator by enclosing the name of the function in single back quotes, such as ```7 div 2```.
	
	Any operator can be converted into a **curried function** that is written before its arguments by enclosing the name of the operator in parentheses.
	In general, if ```⊕``` is an operator, then expressions of the form ```(⊕)```, ```( x ⊕)```, and ```(⊕ y )``` for arguments ```x``` and ```y``` are called **sections**, whose meaning as functions
can be formalised using lambda expressions as follows:

		(⊕) = λx → (λy → x ⊕ y)
		(x ⊕) = λy → x ⊕ y
		(⊕ y) = λx → x ⊕ y


