module Prime (nth) where


isPrime :: Int -> Bool
isPrime x 
  | x < 2 = False
  | x == 2 || x == 3 = True
  | otherwise = (==0) . length $ filter (\num -> mod x num == 0) (takeWhile (\num -> num * num <= x) [2..])

nth :: Int -> Maybe Integer
nth 0 = Nothing
nth n = Just $ toInteger ((filter (isPrime) [2..])!!(n - 1))
