-- Ex 1
applyTwice :: (t -> t) -> t -> t
applyTwice f x = f ( f x )

add3Twice :: Integer -> Integer
add3Twice = applyTwice (+3) 
--ghci> add3Twice 10 -> 16

-- Ex 2
zipWith' :: (t1 -> t2 -> a) -> [t1] -> [t2] -> [a]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

addEachItemAtIndex :: Num a => [a] -> [a] -> [a]
addEachItemAtIndex xs ys = zipWith' (+) xs ys
--ghci> addEachItemAtIndex [1,2,3,4] [5,6,7,8] -> [6,8,10,12]

-- Ex 3
flip' :: (a -> b -> c) -> b -> a -> c  
flip' f y x = f x y  
--ghci> flip' zip [1,2,3,4,5] "hello" 
--      -> [('h',1),('e',2),('l',3),('l',4),('o',5)]