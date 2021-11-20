module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map, fromList, adjust)
data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

conv :: Char -> Nucleotide
conv 'A' = A
conv 'G' = G
conv 'C' = C
conv 'T' = T

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts [] = Right (fromList [(A, 0), (C, 0), (G, 0), (T, 0)])
nucleotideCounts fun@(x:xs)
  | elem x "ACGT" = either Left (Right . adjust (+1) (conv x)) $ nucleotideCounts xs
  | otherwise = Left fun
