import Data.Char

romanToInt :: String -> Int
romanToInt = sum . map (fromRomanNumeral)

fromRomanNumeral :: Char -> Int
fromRomanNumeral b
                | c == 'I' = 1
                | c == 'V' = 5
                | c == 'X' = 10
                | c == 'L' = 50
                | c == 'C' = 100
                | c == 'D' = 500
                | c == 'M' = 1000
                | otherwise = 0
            where c = toUpper b
