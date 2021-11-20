module CollatzConjecture (collatz) where
import Data.Maybe

adding :: Integer -> Maybe Integer -> Maybe Integer
adding x y =
    case y of
      Just value -> Just $ x + value
      Nothing -> Nothing


collatz :: Integer -> Maybe Integer
collatz x
    | x <= 0 = Nothing 
    | x == 1 = Just 0
    | mod x 2 == 0 = adding 1 (collatz (x `div` 2))
    | otherwise = adding 1 (collatz (3 * x + 1))
