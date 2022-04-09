
-- Given 2 integers a and b, return the sum of every number from a to b
-- ex. getSum 1 4 shouldBe 10
--     1 + 2 + 3 + 4 = 10

getSum:: Int -> Int -> Int
getSum a b = sumList c
    where c = if a < b then [a .. b] else [b .. a]

sumList:: [Int] -> Int
sumList [] = 0
sumList (x:xs) = x + sumList xs 