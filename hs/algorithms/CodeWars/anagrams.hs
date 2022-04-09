{-
    Title: Where my anagrams at?
    anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) => ['aabb', 'bbaa']
    anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) => ['carer', 'racer']
    anagrams('laser', ['lazing', 'lazy',  'lacer']) => []
-}

module Anagram where
import Data.List

anagrams :: String -> [String] -> [String]
anagrams w ws = filter (\x -> isAnagram w x) ws

isAnagram :: String -> String -> Bool
isAnagram x y = sort x == sort y


---

anagramsInline :: String -> [String] -> [String]
anagramsInline w ws = filter $ (sort w ==) . sort
