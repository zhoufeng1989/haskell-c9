import Prelude hiding (const)

add = \x -> \y -> x + y

const :: a -> (b -> a)
const x = \_ -> x

odds n = map (\x -> x * 2 + 1) [0..n-1]

main = do
  print ((\x -> x + x) 2)
  print (add 4 5)
  print (const 'a' 'b')
  print (odds 10)
