import Prelude hiding (map, filter, all, any, takeWhile, dropWhile)
import Control.Exception

map :: (a -> b) -> [a] -> [b]
map f xs = [f x | x <- xs]

filter :: (a -> Bool) -> [a] -> [a]
filter p xs = [x | x <- xs, p x]

all :: (a -> Bool) -> [a] -> Bool
all f [] = True
all f (x : xs) = if f x then all f xs else False

any :: (a -> Bool) -> [a] -> Bool
any f [] = False
any f (x : xs) = if f x then True else any f xs

takeWhile :: (a -> Bool) -> [a] -> [a]
takeWhile f [] = []
takeWhile f (x : xs) = if f x then x : takeWhile f xs else []

dropWhile :: (a -> Bool) -> [a] -> [a]
dropWhile f [] = []
dropWhile f (x : xs) = if f x then dropWhile f xs else x : xs

main = do
  print (assert(map (*2) [1, 2, 3, 4] == [2, 4, 6, 8]) "passed")
  -- apply to nested list.
  print (assert(map (map (*2)) [[1, 2], [3, 4]] == [[2, 4], [6, 8]]) "passed")

  print (assert (filter (>5) [1..10] == [6..10]) "passed")

  print (assert (all (>2) [1..5] == False) "passed")

  print (assert (all (>0) [1..5] == True) "passed")

  print (assert (any (>4) [2..5] == True) "passed")

  print (assert (any (>5) [2..5] == False) "passed")

  print (assert (takeWhile (>2) [3, 4, 5, 2, 1] == [3, 4, 5]) "passed")

  print (assert (dropWhile (>2) [3, 4, 5, 2, 1] == [2, 1]) "passed")
