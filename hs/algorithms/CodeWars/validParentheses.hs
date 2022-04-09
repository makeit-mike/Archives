module Parentheses where

{-
    Valid Parentheses
        Write a function that takes a string of parentheses, and determines if the order of the parentheses is valid. 
        The function should return true if the string is valid, and false if it's invalid.

    Examples
        "()"              =>  true
        ")(()))"          =>  false
        "("               =>  false
        "(())((()())())"  =>  true

    Constraints
        0 <= input.length <= 100
        Along with opening (() and closing ()) parenthesis, input may contain any valid ASCII characters. 
        Furthermore, the input string may be empty and/or not contain any parentheses at all. 
        Do not treat other forms of brackets as parentheses (e.g. [], {}, <>).
-}

validParentheses :: String -> Bool
validParentheses s = parseParens s 0 0

-- inputS, countL, countR
parseParens :: String -> Int -> Int -> Bool
parseParens s l r =  if length s == 0 then l == r else 
                     if r2 > l then False else parseParens (tail s) l2 r2
                        where 
                            h = s !! 0
                            l2 = if h == '(' then l + 1 else l
                            r2 = if h == ')' then r + 1 else r