module CasingStrings where
import Data.List.Split
import qualified Data.Char as Char

-- read: split all words in string by spaces,
--   capatalize every word array
--   combine array back into a string.
toJadenCase :: String -> String
toJadenCase [] = []
toJadenCase js = unwords $ map capitalizeWord $ splitOnSpace js

toPascalCase :: String -> String
toPascalCase [] = []
toPascalCase pc = concatMap capitalizeWord $ splitOnSpace pc

toCamelCase :: String -> String
toCamelCase [] = []
toCamelCase cc = concat(head s : map capitalizeWord (tail s))
            where  s = splitOnSpace cc

-- Library
lowerCaseWord :: String -> String
lowerCaseWord = map Char.toLower

capitalizeWord :: String -> String
capitalizeWord [] = []
capitalizeWord (head:tail) = Char.toUpper head : map Char.toLower tail

splitOnSpace :: String -> [String]
splitOnSpace = splitOn " "