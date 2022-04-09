map :: (a -> b) -> [a] -> [b]  
map _ [] = []  
map f (x:xs) = f x : map f xs  

filter :: (a -> Bool) -> [a] -> [a]  
filter _ [] = []  
filter p (x:xs)   
    | p x       = x : filter p xs  
    | otherwise = filter p xs

quicksort [] = []
quicksort (x:xs) =
	let smallerSorted = quicksort $ filter (<=) xs
	    biggerSorted = quicksort $ filter (>) xs
	in smallerSorted ++ [x] ++ biggerSorted
