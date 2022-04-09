import Numeric (showHex, showIntAtBase)
import Data.Char (intToDigit)

-- Given an Integer, return the sum of the binary representation of the number.
-- ex:
-- Input, Binary, Sum
-- 0 -> 0 -> 0
-- 3 -> 11 -> 2
-- 10 - 10010 -> 2 

-- Brute force, readable, scalable.
countBits 0 = 0
countBits x = sum 
            $ map toInt 
            $ toCharArr  
            $ convertToBinary x

-- Recursive, elegant, lower LOC
countBits2 :: Int -> Int
countBits2 0 = 0
countBits2 n = mod n 2 + countBits ( div n 2 )

-- Library

convertToHex c = showHex c ""
convertToBinary b = showIntAtBase 2 intToDigit b ""
toCharArr = map (:[]) 
toInt x = read x :: Int
