-- Types and Typeclasses
-- Believe the Type

-- use :t {some function} in GHCI to view type info

-- Ints, the effecient int.
minInt :: Int
minInt = -2147483648

maxInt :: Int
maxInt = 2147483647

-- Integers, the much larger scope int, but less effecient
factorial :: Integer -> Integer  
factorial n = product [1..n] 

someInteger :: Integer
someInteger = factorial 50 -- 30414093201713378043612608166064768844377641568960512000000000000

-- Floats, slightly elevated ints... or... numbers with single precision.
circumference :: Float -> Float  
circumference r = 2 * pi * r  

someFloat = circumference 4.0 -- 25.132742

-- Doubles, floats... but double precision.
circumference' :: Double -> Double  
circumference' r = 2 * pi * r  

someDouble = circumference' 4.0  -- 25.132741228718345 

-- Bool, char, string/char arr
someBool = True || False
someBool' = read "True" || False
someChar = 'a'
someString = "abc"
someOtherString = ['a'..'z']
toString x = show x 

toInt :: String -> Int
toInt x = read x

--Enum Types
alphabet = ['a'..'z']
inequalities = [LT .. GT] -- [LT,EQ,GT]  
numbers = [1 .. 312]
oddNumbers = [1,3 .. 101]
evenNumbers = [1,2 .. 100]
letterAfterB = succ 'B' -- C

minInt' = minBound :: Int -- -2147483648 
maxChar = maxBound :: Char -- '\1114111'

-- Types

-- Eq (equality)
basicEq = 5 == 5 -- true
basicEq' = 5 /= 5 -- false

-- Ord (ordering)
basicOrd = 5 < 6 -- True
slightlyMoreComplexOrd = compare 124 13 -- GT

-- Show (representing value as strings)
basicShow = show 3 -- "3"
basicShow' = show $ 5 == 5 -- "True"

-- Read (opposite of show, representing strings as other types)

basicRead = read "True" || False -- Interprets "True" as a boolean
basicRead' = read "234" :: Int

-- Enum
alphabet = ['a'..'z']
ordTypes = [LT .. GT] -- [LT, EQ, GT]
numbers = [3 .. 40]
nextLetter = succ 'b'

-- Bounded
smallestInt = minBound :: Int -- -2.14 x 10^Big
largestBool = maxBount :: Bool -- True

-- Num
-- [Int, Integer, Float, Double, ..]


