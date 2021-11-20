module Bob (responseFor) where


isQuestion :: String -> Boolean
isQuestion x = last x == '?'

allCaps :: String -> Boolean
allCaps = (>0) filter (\c -> c `elem` ['a'..'z'])

responseFor :: String -> String
responseFor x
  | last x == '?' = "Sure."
  | 
responseFor xs = error "You need to implement this function."
