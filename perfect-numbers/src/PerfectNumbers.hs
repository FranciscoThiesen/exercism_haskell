module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

decide :: Int -> Classification
decide x
  | z < x = Deficient
  | z == x = Perfect
  | otherwise = Abundant
  where z = foldr (+) 0 (filter (\y -> mod x y == 0) [1..x-1])

classify :: Int -> Maybe Classification
classify x
  | x <= 0 = Nothing
  | otherwise = Just (decide x)
