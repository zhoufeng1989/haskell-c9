import Prelude hiding (foldl, sum, product, or, and, length, (++), reverse)
import Control.Exception

foldl :: (b -> a -> b) -> b -> [a] -> b
foldl f v [] = v
foldl f v (x : xs) = foldl f (f v x) xs

sum = foldl (+) 0
product = foldl (*) 1
or = foldl (||) False
and = foldl (&&) True
length = foldl (\ n _ -> n + 1) 0
reverse = foldl (\ xs x -> x : xs) []
(++) xs ys = foldl (\ xs x -> x : xs) ys (reverse xs)


main = do
  print (assert (sum [1, 2, 3] == 6) "passed")
  print (assert (product [2, 3, 4] == 24) "passed")
  print (assert (or [False, True] == True) "passed")
  print (assert (and [False, True] == False) "passed")
  print (assert (length [1, 3, 4, 5] == 4) "passed")
  print (assert ([1, 2, 3] ++ [4] == [1, 2, 3, 4]) "passed")
  print (assert (reverse [1, 2, 3] == [3, 2, 1]) "passed")
