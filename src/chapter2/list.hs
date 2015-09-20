import Prelude hiding (last, init)
last (x : []) = x
last (x : xs) = last xs

init xs = take (length xs -1) xs
