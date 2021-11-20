module Anagram (anagramsFor) where
import Data.MultiSet (MultiSet, fromList)
import Data.Char

isAnagram :: String -> String -> Bool
isAnagram a b = ((fromList (map toLower a)) == (fromList (map toLower b))) && (map toLower a) /= (map toLower b) 

anagramsFor :: String -> [String] -> [String]
anagramsFor xs xss = filter (\x -> isAnagram x xs) xss
