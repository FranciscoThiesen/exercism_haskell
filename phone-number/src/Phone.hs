module Phone (number) where

cleanString :: String -> String
cleanString [] = []
cleanString (x:xs)
  | x >= '0' && x <= '9' = [x] ++ cleanString xs
  | otherwise = cleanString xs

stripCountryCode :: String -> String
stripCountryCode [] = []
stripCountryCode (x:xs) = if x == '1' then xs else (x:xs)

isValidString :: String -> Bool
isValidString [] = False
isValidString x
  | length x == 10 && (x!!0) > '1' && (x!!3) > '1' = True
  | otherwise = False


number :: String -> Maybe String
number [] = Nothing
number x
  | isValidString y = Just y
  | otherwise = Nothing
      where y = (stripCountryCode $ cleanString x) 
