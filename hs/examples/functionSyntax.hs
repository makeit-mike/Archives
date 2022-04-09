-- Pattern Matching isTrue :: Bool -> Bool isTrue True = True
isTrue _ = False

luckyNumber :: (Eq a, Num a) => a -> String
luckyNumber 7 = "So lucky."
luckyNumber _ = "That isn't lucky."

sayMe :: (Eq a, Num a) => a -> String
sayMe 1 = "One!"  
sayMe 2 = "Two!"  
sayMe 3 = "Three!"  
sayMe 4 = "Four!"  
sayMe 5 = "Five!"  
sayMe x = "Not between 1 and 5"  

factorial :: (Eq t, Num t) => t -> t
factorial 0 = 1
factorial n = n * factorial (n - 1)

addVectors :: (Num a, Num b) => (a, b) -> (a, b) -> (a, b)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

-- this is an implementation of the Head function
firstElemInList :: [a] -> a
firstElemInList [] = error "empty list."
firstElemInList (x:_) = x  

sumTuplesInList :: [(Int, Int)] -> [Int]
sumTuplesInList xs = [a+b | (a,b) <- xs]  -- ghci> sumTuplesInList [(1,30),(4,6)]  ==> [31,10]

-- Just use fmap 99% of the time.
sumTuplesInList' :: [(Int, Int)] -> [Int]
sumTuplesInList' = fmap (\(x,y) -> x+y)

lengthOfList :: [a] -> Int
lengthOfList [] = 0
lengthOfList (_:xs) = 1 + lengthOfList xs

sumOfList [] = 0
sumOfList (x:xs) = x + sumOfList xs

-- Guards
isAGoodNumber :: (Int) -> String
isAGoodNumber a
	| a == 22 = "Pretty good"
	| a > 22 = "Kinda good"
	| otherwise = "Not good"

max' a b | a > b = a | otherwise = b

initials firstname lastname = [f] ++ "." ++ [l] ++ "."
   	where (f:_) = firstname
   	      (l:_) = lastname

-- Where
calculateBmi :: (RealFloat a) => [(a, a)] -> [a]
calculateBmi xs = [bmi w h | (w, h) <- xs]
	where bmi weight height = weight / height ^ 2

-- Lets
cylinder r h = 
   let sideArea = 2 * pi * r * h
       topArea = pi * r ^2
   in sideArea + 2 * topArea

-- Cases
head'' xs = case xs of 
		[] -> error "still empty"
		(x:_) -> x
