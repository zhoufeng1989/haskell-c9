import Prelude hiding (foldr, sum, product, or, and, length, (++), reverse)
import Control.Exception

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr f v [] = v
foldr f v (x : xs) = f x (foldr f v xs)


sum = foldr (+) 0
product = foldr (*) 1
or = foldr (||) False
and = foldr (&&) True
length = foldr (\ _ n -> 1 + n) 0
-- (++ys) = foldr (:) ys
(++) xs ys = foldr (:) ys xs

reverse :: [a] -> [a]
reverse = foldr (\ x xs -> xs ++ [x]) []


main = do
  print (assert (sum [1, 2, 3] == 6) "passed")
  print (assert (product [2, 3, 4] == 24) "passed")
  print (assert (or [False, True] == True) "passed")
  print (assert (and [False, True] == False) "passed")
  print (assert (length [1, 3, 4, 5] == 4) "passed")
  print (assert ([1, 2, 3] ++ [4] == [1, 2, 3, 4]) "passed")
  print (assert (reverse [1, 2, 3] == [3, 2, 1]) "passed")
