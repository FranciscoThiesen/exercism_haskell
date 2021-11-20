module DNA (toRNA) where

isValid :: String -> Bool
isValid = (==0) . length . filter (\c -> notElem c "GCTA")

translate x
  | x == 'G' = 'C'
  | x == 'C' = 'G'
  | x == 'T' = 'A'
  | x == 'A' = 'U'


toRNA :: String -> Either Char String
toRNA x
  | isValid x == True = Right $ map (translate) x
  | otherwise = Left $ head $ filter (\c -> notElem c ['G', 'C', 'T', 'A']) x
