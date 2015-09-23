import Prelude hiding ((*))
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n -1)


(*) :: Int -> Int -> Int
m * 0 = 0
m * n = m + m * (n - 1)
