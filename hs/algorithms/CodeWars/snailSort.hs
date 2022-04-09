module Snail where

array = [[1,2,3],
         [4,5,6],
         [7,8,9]]
--snail(array) #=> [1,2,3,6,9,8,7,4,5]

middle :: [a] -> [a]
middle [] = []
middle [_] = []
middle [_,_] = []
middle xs = init $ tail xs

snail :: [[a]] -> [a]
snail [] = []
snail [x] = x
snail (x:xs) = let middleRows = init xs
               in x ++
                  map last xs ++
                  reverse (init (last xs)) ++
                  reverse (map head middleRows) ++
                  snail (map middle middleRows)

{-
snail' :: [[Int]] -> [Int]
snail' [] = []
snail' [x] = [x]
snail' (x:xs) = 


 	concat array !! 0
	+
	head . reverse . array !! 1
	head . reverse . array !! 2


 -}

