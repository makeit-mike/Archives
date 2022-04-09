import Data.List

removeSmallestSorted :: [Int] -> [Int]
removeSmallestSorted = tail . sort

removeSmallest :: [Int] -> [Int]
removeSmallest xs = delete ( head $ sort xs  ) xs