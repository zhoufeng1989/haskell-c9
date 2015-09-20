import Prelude hiding (sum, product)
product [] = 1
product (x : xs) = x * product xs

sum [] = 0
sum (x : xs) = x + sum xs

double x = x + x


main = do
  print (product [1..5])
  print (sum [1..5])
  print (double (double 2))
