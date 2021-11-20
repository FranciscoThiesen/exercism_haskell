module SumOfMultiples (sumOfMultiples) where

canDiv :: [Integer] -> Integer -> Bool
canDiv [] _ = False
canDiv (x:xs) y
  | x == 0 = canDiv xs y
  | (div y x) * x == y = True
  | otherwise = canDiv xs y 


sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples _ 0 = 0
sumOfMultiples factors limit = foldl (+) 0 (filter (canDiv factors) [1..limit - 1])
