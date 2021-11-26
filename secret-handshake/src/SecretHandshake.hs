module SecretHandshake (handshake) where

import Data.Map (Map)
import qualified Data.Map as Map
import Data.Bits

lst = [(1,"wink"), (2,"double blink"), (4, "close your eyes"), (8, "jump")]

getOnlySecond [] = []
getOnlySecond (x:xs) = [snd x] ++ getOnlySecond xs

getActions :: Int -> [String]
getActions 0 = []
getActions y = getOnlySecond $ filter (\x -> ((.&.) (fst x) y) == (fst x)) lst

handshake :: Int -> [String]
handshake 0 = []
handshake n
  | ((.&.) n 16) == 16 = reverse y
  | otherwise = y
  where y = getActions n 
