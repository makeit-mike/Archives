{-
    8. String to Integer (atoi)

    Input: s = "42"
    Output: 42

    Input: s = "   -42"
    Output: -42

    Input: s = "4193 with words"
    Output: 4193
-}

import Data.Char

stringToInt:: String -> Int
stringToInt = read . filter isDigit