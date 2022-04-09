
-- Functions in haskell technically only take one parameter.
-- How does everything else work? Simple... Magic!

-- Ex 1
a :: Integer
a = max 4 5 -- return 5

a' :: Integer
a' = (max 4) 5 -- also 5

-- Ex 2
mult :: Num a => a -> a -> a
mult x y = x * y 

multByTwo :: Integer -> Integer
multByTwo = mult 2

multTwoByNine :: Integer
multTwoByNine = multByTwo 9

compareWithHundred :: Integer -> Ordering
compareWithHundred = compare 100

isAlpha :: Char -> Bool
isAlpha = (`elem` ['a'..'z']++['A'..'Z'])

