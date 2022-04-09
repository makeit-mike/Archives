import Data.List (sort, reverse, sortBy, map, group, head, length)
import Data.Ord (comparing)
import Data.Char (toLower)
import Data.Function (on)

top3 :: [Char] -> [[Char]]
top3 =  take 3 . orderWordsByOccurence

orderWordsByOccurence :: [Char] -> [String]
orderWordsByOccurence = filter (/= "") .
                        filter (not . allApostrophes) .
                        map (\(x,y) -> x) .
                        countWordOccurences

countWordOccurences :: [Char] -> [(String, Int)]
countWordOccurences =  sortBy (on (flip compare) snd ) .
                        map (\x -> (head x, length x)) . 
                        group . 
                        sort . 
                        words .
                        map (\x -> if elem x (['a'..'z'] ++ "\' ") then x else ' ') .
                        map toLower 

allApostrophes :: String -> Bool
allApostrophes = allCharsMatch '\''

allCharsMatch :: Char -> String -> Bool
allCharsMatch c = and . map (== c)