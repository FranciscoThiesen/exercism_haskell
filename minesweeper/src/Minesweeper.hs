module Minesweeper (annotate) where

import Data.Char(intToDigit)

checkMine :: [String] -> Int -> Int -> Bool
checkMine matrix x y
  | (x >= 0 && x < length matrix && y >= 0 && y < (length (matrix!!0))) = (matrix!!x)!!y == '*'
  | otherwise = False

calculateValue :: [String] -> Int -> Int -> Int
calculateValue matrix x y = length $ filter (\t -> checkMine matrix (x + fst t) (y + snd t)) (zip [-1, -1, -1, 0, 0, 1, 1, 1] [-1, 0, 1, -1, 1, -1, 0, 1])

calculateCharValue :: Char -> Int -> Char
calculateCharValue c x
  | c == '*' = '*'
  | otherwise = (if x == 0 then ' ' else intToDigit x)


getIndices :: String -> [Int]
getIndices string = [0..(length string - 1)]

calculateStringValue :: String -> [Int] -> String
calculateStringValue [] _ = []
calculateStringValue _ [] = []
calculateStringValue (x:xs) (y:ys) = [calculateCharValue x y] ++ calculateStringValue xs ys

-- Passar matriz, linha
getStringPerLine :: [String] -> Int -> String
getStringPerLine matrix x = calculateStringValue (matrix!!x) (map (calculateValue matrix x) (getIndices (matrix!!x)))

annotate :: [String] -> [String]
annotate matrix = map (getStringPerLine matrix) [0..(length matrix - 1)] 
