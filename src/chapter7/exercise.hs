import Prelude hiding (all, any, takeWhile, dropWhile)
-- exercise 1
g f p = map f . filter p

-- exercise 2
all p [] = True
all p (x : xs) = if p x then all p xs else False

any p [] = False
any p (x : xs) = if p x then True else any p xs

takeWhile p [] = []
takeWhile p (x : xs) = if p x then x : takeWhile p xs else []

dropWhile p [] = []
dropWhile p (x : xs) = if p x then dropWhile p xs else x : xs
