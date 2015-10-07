import Data.Char
import Control.Exception

type Bit = Int

bin2int = foldr (\x y -> x + 2 * y) 0

int2bin 0 = []
int2bin n = n `mod` 2 : int2bin(n `div` 2)

make8 bits = take 8 (bits ++ repeat 0)

encode = concat . map (make8 . int2bin . ord)

chop8 [] = []
chop8 bits = take 8 bits : chop8 (drop 8 bits)

decode = map(chr. bin2int) . chop8

transmit = decode . channel . encode
channel = id

main = do
  print (assert (bin2int [1, 0, 1, 1] == 13) "passed")
  print (assert (int2bin 13 == [1, 0, 1, 1]) "passed")

