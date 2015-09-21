import Prelude hiding (abs)

abs n | n >= 0 = n
      | otherwise = -n

main = print (abs 10)
