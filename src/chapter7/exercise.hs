import Prelude hiding (all, any, takeWhile, dropWhile, map, filter, curry, uncurry)
import Control.Exception
import Data.Char
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

-- exercise 3

map f = foldr (\x y -> f x : y) []
filter p = foldr (\x y -> if p x then x : y else y) []

-- exercise 4
dec2int = foldl (\x y -> 10 * x + y) 0

-- exercise 5
-- sum has type [Int] -> Int, not the same with others

-- exercise 6
curry :: ((a, b) -> c) -> a -> b -> c
curry f = \x -> \y -> f(x, y)

uncurry :: (a -> b -> c) -> (a, b) -> c
uncurry f = \(x, y) -> f x y

-- exercise 7
unfold p h t x | p x = []
               | otherwise = h x : unfold p h t (t x)

_int2bin = unfold(==0)(`mod` 2)(`div` 2)
_chop8 = unfold(null)(take 8)(drop 8)
_map f = unfold(null) (f . head) tail
_iterate f = unfold(\x -> False) id f


-- exercise 8

type Bit = Int

bin2int = foldr (\x y -> x + 2 * y) 0

int2bin 0 = []
int2bin n = n `mod` 2 : int2bin(n `div` 2)

make8 bits = take 8 (bits ++ repeat 0)

parity bits = if even . sum $ bits then 0 else 1

addparity bits = parity bits : bits

encode = concat . map (addparity . make8 . int2bin . ord)

chop9 [] = []
chop9 bits = take 9 bits : chop9 (drop 9 bits)

checkparity bits = if (parity . tail $ bits) == head bits then tail bits else error "parity error"

decode = map(chr. bin2int. checkparity) . chop9

transmit = decode . channel . encode
channel = id

main = do
  -- for exercise 3
  print (assert (map (+1) [1, 2, 3, 4] == [2, 3, 4, 5]) "passed")
  print (assert (filter even [1, 2, 3, 4] == [2, 4]) "passed")
  print (assert (dec2int [1, 9, 8, 9] == 1989) "passed")

