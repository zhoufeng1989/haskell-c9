import Prelude hiding (replicate)
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

