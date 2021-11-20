module Luhn (isValid) where

import Data.Char(digitToInt)

digitSum :: String -> Int
digitSum str = foldr (+) 0 $ map digitToInt str

double :: Int -> Int
double x
  | x * 2 < 10 = 2 * x
  | otherwise = 2 * x - 9

process :: String -> Int -> Int -> Int
process [] cur_id cur_sum = cur_sum
process (x:xs) cur_id cur_sum
  | mod cur_id 2 == 1 = process xs (cur_id + 1) $ cur_sum + double (digitToInt x) 
  | otherwise = process xs (cur_id + 1) $ cur_sum + (digitToInt x)  

stripSpaces :: String -> String
stripSpaces [] = ""
stripSpaces (x:xs)
  | x == ' ' = stripSpaces xs
  | otherwise = (stripSpaces xs) ++ [x]

hasInvalidChars :: String -> Bool
hasInvalidChars [] = False
hasInvalidChars (x:xs)
  | elem x ['0'..'9'] = hasInvalidChars xs
  | otherwise = True

isValid :: String -> Bool
isValid x = ((==0) $ mod (process (stripSpaces x) 0 0) 10) && (length (stripSpaces x) > 1) && (hasInvalidChars (stripSpaces x) == False)
