halve :: [a] -> ([a], [a])
halve xs = (take (length xs `div` 2) xs, drop (length xs `div` 2) xs)


safetail :: [a] -> [a]
safetail xs = if null xs then [] else tail xs


safetail2 :: [a] -> [a]
safetail2 xs | null xs = []
	     | otherwise = tail xs


safetail3 :: [a] -> [a]
safetail3 [] = []
safetail3 (_ : xs) = xs


mult :: Num a => a -> a -> a -> a
mult = \x -> \y -> \z -> x * y * z
