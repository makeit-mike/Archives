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

-- chain 5
-- [5 16 8 4 2 1]
chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n 
    | even n = n:chain (div n 2)
    | odd n = n:chain (n*3 + 1)

------------------------
-- Lambdas
------------------------

-- Basically, anonymous functions that are used only once.

numLongChains :: Int
numLongChains = length $ 
                filter
                (\xs -> length xs > 15) 
                (map chain [1..100])

-- Oh that is cool. . . you can define your own operators
(->>) = flip ($)
numLongChains' = filter (\xs -> length xs > 15) (map chain [1..100])
                 ->> length

complexZipWith = zipWith (\a b -> (a * 30 + 3) / b) [5,4..1] [1..5]

complexZipWith' :: [Double] -> [Double] -> [Double]
complexZipWith' = zipWith (\a b -> (a * 30 + 3) / b)

pot = (+3) -- just let currying handle it all (preffered syntax)
kettle = \x -> x + 3 -- redundant lambda, avoid
kettle' x = x + 3 -- explicit definition

-- read.. Pot calling the Kettle black
black :: Int -> Bool
black x = (==) (pot x) (kettle x)

patternMatchedLambda = 
    map (\(a,b) -> a + b) (take 20 $ createTuples [1..]) -- [3,6,9,12,15,18,21,24,27,30,33,36,39,42,45,48,51,54,57,60]

-- *Main> patternMatchedNotLambda (take 20 $ createTuples [1,5..])
-- [3,15,27,39,51,63,75,87,99,111,123,135,147,159,171,183,195,207,219,231]
patternMatchedNotLambda = map smooshTuples

smooshTuples :: (Num a) => (a,a) -> a
smooshTuples (x,y) = x + y

-- *Main> take 5 $ createTuples [1..]
-- [(1,2),(2,4),(3,6),(4,8),(5,10)]
createTuples :: (Num a) => [a] -> [(a,a)]
createTuples = map tupleIt

tupleIt :: (Num a) => a -> (a,a)
tupleIt x = (x, x * 2)