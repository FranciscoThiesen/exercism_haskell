module Pangram (isPangram) where
import Data.List (nub)
import Data.Char

isPangram :: String -> Bool
isPangram = (== 26) . length . nub . filter (\c -> c `elem` ['a'..'z']) . map toLower
