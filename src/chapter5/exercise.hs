import Prelude hiding (replicate, length)
sqrsum = sum [x * x | x <- [1..100]]

replicate :: Int -> a -> [a]
replicate n x = [x | y <- [1..n]]


pyths :: Int -> [(Int, Int, Int)]
pyths n = [(i,j,k) | i <- [1..n], 
                     j <- [1..n], 
                     k <- [1..n], 
                     i * i + j * j == k * k]


factors :: Int -> [Int]
factors n = [x | x <- [1..n], n `mod` x == 0]

perfects :: Int -> [Int]
perfects n = [x | x <- [1..n], sum (init (factors x))  == x]

concat :: [[a]] -> [a]
concat xss = [x | xs <- xss, x <- xs]

length :: [a] -> Int
length xs = sum [1 | _ <- xs]

pairs :: [a] -> [(a, a)]
pairs xs = zip xs (tail xs)


sorted :: Ord a => [a] -> Bool
sorted xs = and [x <= y | (x, y) <- pairs xs]


positions :: Eq a => a -> [a] -> [Int]
positions x xs = [i | (y, i) <- zip xs [0..n], y == x]
		 where n = length xs - 1

scalar :: [Int] -> [Int] -> Int
scalar xs ys = sum [x * y | (x, y) <- zip xs ys]
