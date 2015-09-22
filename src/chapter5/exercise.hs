sqrsum = sum [x * x | x <- [1..100]]

import Prelude hiding (replicate)
replicate :: Int -> a -> [a]
replicate n x = [x | y <- [1..n]]


pyths :: Int -> [(Int, Int, Int)]
pyths n = [(i,j,k) | i <- [1..n], 
		     j <- [1..n], 
                     k <- [1..n], 
		     i * i + j * j == k * k]



