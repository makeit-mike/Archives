------------------------
-- Curried Functions
------------------------

-- max 4 5 is the same as (max 4) 5
-- This is because every fn in haskell technically takes one parameter

divideBy10 :: (Floating a) => a -> a
divideBy10 = (/10) -- with Currying it automatically knows to apply the param 

isUpperAlpha :: Char -> Bool
isUpperAlpha = (`elem` ['A'..'Z'])

------------------------
-- Higher Order Functions
------------------------

applyTwice :: (t -> t) -> t -> t
applyTwice f x = f ( f x )

add3Twice :: Integer -> Integer
add3Twice = applyTwice (+3) 
add3TwiceToTen = add3Twice 10 -- > 16

zipWith' :: (t1 -> t2 -> a) -> [t1] -> [t2] -> [a]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

zipWithEx1 = zipWith' (+) [1,2,3] [4,5,6] -- > 5,7,9
zipWithEx2 = zipWith' max [1,4,6] [2, 2, 20] -- > 2 4 20
zipWithEx3 = 
    zipWith' (++) ["foo ", "bar "] ["fighters", "stool"] -- > foo fighters, bar stool

addEachItemAtIndex :: Num a => [a] -> [a] -> [a]
addEachItemAtIndex xs ys = zipWith' (+) xs ys
addEachExample = addEachItemAtIndex [1,2,3,4] [5,6,7,8] -- > [6,8,10,12]

flip' :: (a -> b -> c) -> b -> a -> c  
flip' f y x = f x y  
flipZip = flip' zip [1,2,3,4,5] "hello" -- > [('h',1),('e',2),('l',3),('l',4),('o',5)]

itemsGrThan3 = filter (>3) [1,2,3,4,5,6,0]

higherOrderQuickSort :: (Ord a) => [a] -> [a]
higherOrderQuickSort [] = []
higherOrderQuickSort (x:xs) =
    let smallerSorted = higherOrderQuickSort (filter (<=x) xs)
        biggerSorted = higherOrderQuickSort (filter (>x) xs)
    in smallerSorted ++ [x] ++ biggerSorted

largestDivisibleNumber = head (filter p [100000,99999..])
    where p x = mod x 3829 == 0


------------------------
-- Lambdas
------------------------

-- Basically, anonymous functions that are used only once.