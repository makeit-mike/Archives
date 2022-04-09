maximum' [] = error "empty"
maximum' [x] = x
maximum' (x:xs) 
	| x > maxtail = x
	| otherwise = maxtail
	where maxtail = maximum' xs

-- Cleaner
maximum2 [] = error "still empty"
maximum2 [x] = x
maximum2 (x:xs) = max x $ maximum2 xs

-- Given a num x, return a list containing only x. . . n times
replicate' n x 
	| n <= 0 = []
	| otherwise = x:replicate' (n-1) x

take' n _ 
	| n <= 0 = []
take' _ [] = []
take' n (x:xs) = x : take' (n-1) xs

reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

repeat' x = x:repeat' x -- be careful, this will never terminate.

repeatForSomeNumberOfTimes x n = take n $ repeat' x

-- Zip takes 2 lists, compresses them together, truncating the longer list.
-- zip [1,2,3] [2,3] returns [(1,2),(2,3)]
zip' :: [a] -> [b] -> [(a,b)]
zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = (x,y) : zip' xs ys

elem' a [] = False
elem' a (x:xs) 
	| a == x = True
	| otherwise = elem' a xs

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
	let smallerSorted = quicksort [a | a <- xs, a <= x]
	    biggerSorted = quicksort [a | a <- xs, a > x]
	in smallerSorted ++ [x] ++ biggerSorted
{-
	  [5    1    9    4    6    7    3]
=============================================
	[1   4  3]     [5]     [9    6    7]
	[1] [4  3]             [6  7] [9] 
	    [3][4]             [6][7]
	    [3]                   [7]
	1    3  4       5       6  7   9
-}
theAlphabet = quicksort "the quick brown fox jumps over the lazy dog" 

