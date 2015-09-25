import Prelude hiding ((*), product, length)
import Control.Exception
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n -1)


(*) :: Int -> Int -> Int
m * 0 = 0
m * n = m + m * (n - 1)

product :: [Int] -> Int
product [] = 1
product (x : xs) = x * product xs

length :: [a] -> Int
length [] = 0
length (_ : xs) = 1 + length xs

main = do
    print (assert (factorial 5 == 120) "passed")
    print (assert (5 * 54 == 270) "passed")
    print (assert (product [1, 2, 3] == 6) "passed")
    print (assert (length [1, 2, 3, 4, 5] == 5) "passed")
