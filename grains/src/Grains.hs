module Grains (square, total) where

square :: Integer -> Maybe Integer
square x
  | x <= 0 || x > 64 = Nothing
  | otherwise = Just $ 2 ^ (x - 1)


customSum :: [Maybe Integer] -> Integer
customSum [] = 0
customSum (x:xs) = case x of
                     Just x -> x + customSum xs
                     Nothing -> customSum xs


total :: Integer
total = customSum $ map square [1..64]
