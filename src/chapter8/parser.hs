module Parsing where

import Data.Char
import Control.Monad
newtype Parser a =  P (String -> [(a,String)])

parse :: Parser a -> String -> [(a, String)]
parse (P p) inp = p inp

instance Monad Parser where
  return v = P (\inp -> [(v, inp)])
  p >>= f = P (\inp -> case parse p inp of
                      [] -> []
                      [(v, out)] -> parse (f v) out
              )

failure :: Parser a
failure = P (\inp -> [])

item :: Parser Char
item = P (\inp -> case inp of
                 [] -> []
                 (x : xs) -> [(x, xs)]
         )

p :: Parser (Char, Char)
p = do x <- item
       item
       y <- item
       return (x, y)

sat p = do x <- item
           if p x then 	return x else failure
digit = sat isDigit
