import  Prelude hiding ((&&), head, tail)

True && b = b
False && _ = False

head (x : _) = x

tail (_ : xs) = xs

main = do
  print (True && False)
  print (head [1, 2, 3])
  print (tail [1, 2, 3])
