
import Data.Foldable (toList)
import qualified Data.Sequence as Seq
import Data.Sequence ((|>))
import Data.List as L

-- Uglier
windowsBySize :: Int -> [a] -> [[a]]
windowsBySize n0 = go 0 Seq.empty
  where
    go n s (a:as) | n' <  n0   =              go n' s'  as
                  | n' == n0   = toList s'  : go n' s'  as
                  | otherwise =  toList s'' : go n  s'' as
      where
        n'  = n + 1         
        s'  = s |> a        
        s'' = Seq.drop 1 s' 
    go _ _ [] = []

-- Simpler, uglier return set.
windowsBySize2 :: Int -> [a] -> [[a]]
windowsBySize2 n = map (take n) . L.tails

takeLengthOf :: [a] -> [b] -> [b]
takeLengthOf = zipWith (flip const)

-- matches the first sln.
windowsBySize3 :: Int -> [a] -> [[a]]
windowsBySize3 n xs = takeLengthOf (drop (n-1) xs) (windowsBySize2 n xs)
