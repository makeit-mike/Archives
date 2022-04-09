 -- Longest substring without repeating characters
 -- e1: abcabcbb -> 3
 -- e2: bbb -> 1
 -- e3: ae -> 2
 
import Data.Set as S
import Data.Map as M
-- import Data.List

longestSubstring1 :: String -> String
longestSubstring1 xs = maximumBy (comparing length) $ P.map (takeWhileUnique S.empty) $ tails xs
             where
                takeWhileUnique _ [] = []
                takeWhileUnique seen (x : xs) = if x `S.member` seen
                    then []
                    else x : takeWhileUnique xs (x `S.insert` seen)


longestSubstring2 :: String -> String
longestSubstring2 = spanExtract . maximumBy (comparing spanLength) . mapAccumL step (M.empty, 0) . zip [0..]
  where 
      step (seen, curLeft) (curRight, x) = (( M.insert x curRight seen, max curLeft $ maybe 0 (+1) $ M.lookup x seen), (curLeft, curRight) )