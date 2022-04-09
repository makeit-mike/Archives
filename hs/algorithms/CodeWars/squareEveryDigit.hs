module SquareDigit where
import Data.Char

squareDigit :: Int -> Int
squareDigit x = mult z
                $ toInt 
                $ concat
                $ map ( toString . (^2) . toInt ) 
                $ toCharArr 
                $ toString y
            where 
                y = if x < 0 then -(x) else x
                z = if x < 0 then -1 else (1)

mult a b = a * b

toCharArr = map (:[]) 

toString x = show x

toInt x = read x :: Int