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
  | otherwise = (if x > 0 then c else intToDigit x)

annotate :: [String] -> [String]
annotate lst = map  
annotate board = error "You need to implement this function."
