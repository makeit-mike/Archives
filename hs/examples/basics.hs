import           Data.List

-- BASICS: ARITHMETIC
add :: Num a => a -> a -> a
add x y = x + y

subtract :: Num a => a -> a -> a
subtract x y = x - y

mult :: Num a => a -> a -> a
mult x y = x * y

doubleMe :: Num a => a -> a
doubleMe x = 2 * x

doubleUs :: Num a => a -> a -> a
doubleUs x y = doubleMe x + doubleMe y

raise :: Num a => a -> Integer -> a
raise x y = x ^ y

isNotEqual :: Eq a => a -> a -> Bool
isNotEqual x y = x /= y

isEqual :: Eq a => a -> a -> Bool
isEqual x y = x == y

succMaxPlusOne :: (Num a, Enum a, Ord a) => a -> a -> a -> a
succMaxPlusOne x y z = succ x + max y z + 1 -- same as (succ x) + (max x y) + 1

doubleIfSmallerThan :: (Ord a, Num a) => a -> a -> a
doubleIfSmallerThan x y =
  if x < y
    then doubleMe x
    else x

doubleIfGreaterThan :: (Ord a, Num a) => a -> a -> a
doubleIfGreaterThan x y =
  if x > y
    then doubleMe x
    else x

--- BASICS: LISTS
myFavList :: [Integer]
myFavList = [4, 8, 15, 16, 23, 42]

-- Note, using ++ is an o(n) operation, which can add complexity if you
-- are just wanting to add elements to a string or list.
myOtherList :: [Integer]
myOtherList = myFavList ++ [1, 2, 3] --[4,8,15,16,23,42,1,2,3]

stringsAsList :: [Char]
stringsAsList = "Hello" ++ "World" -- HelloWorld

stringFromList :: [Char]
stringFromList = ['l', 'i', 's', 't'] ++ [' ', 'o', 'k'] -- "list ok"

appendToBeginning :: [Char]
appendToBeginning = 'A' : " instantaneous operation"

appendToBeginning' :: [Integer]
appendToBeginning' = 1 : [2, 3, 4, 5, 6]

readingByIndex :: Integer
readingByIndex = myFavList !! 3 -- returns 4th elm of list

listOfLists :: [[Integer]]
listOfLists = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

firstElem :: [a] -> a
firstElem = head

allButFirst :: [a] -> [a]
allButFirst = tail

lastElem :: [a] -> a
lastElem = last

allButLast :: [a] -> [a]
allButLast = init

lenOfList :: [a] -> Int
lenOfList = length

isListNull :: [a] -> Bool
isListNull = null

getFirstTwoItems :: [a] -> [a]
getFirstTwoItems = take 2

dropFirstThreeItems :: [a] -> [a]
dropFirstThreeItems = drop 3

getMinInList :: (Foldable t, Ord a) => t a -> a
getMinInList x = minimum x

getMaxInList :: (Foldable t, Ord a) => t a -> a
getMaxInList x = maximum x

addAllInList :: (Foldable t, Num a) => t a -> a
addAllInList x = sum x

multAllInList :: (Foldable t, Num a) => t a -> a
multAllInList x = product x

containsL :: Eq a => a -> [a] -> Bool --Something about Type Classes
containsL x y = elem x y

-- BASICS: RANGES
oneToTwenty :: [Integer]
oneToTwenty = [1 .. 20]

aToZ :: [Char]
aToZ = ['a' .. 'z']

evenNumbers :: [Integer]
evenNumbers = [2,4 ..]

oddNumbers :: [Integer]
oddNumbers = [1,3 ..]

capAToZ :: [Char]
capAToZ = ['A' .. 'Z']

evenToForty :: [Integer]
evenToForty = [2,4 .. 40]

someSeries :: [Double]
someSeries = [0.1,0.3 .. 1]

circularList :: [Integer]
circularList = cycle [1, 2, 3] -- inf list 1,2,3,1,2,3...

infFives :: [Integer]
infFives = repeat 5

-- Elem Function
elem' :: (Eq a) => a -> [a] -> Bool
elem' _ [] = False
elem' y (x:xs) =
  if y == x
    then True
    else elem' y xs

-- Perhaps a cleaner way to show this
elem'' :: (Eq a) => a -> [a] -> Bool
elem'' _ []     = False
elem'' y (x:xs) = (y == x) || elem' y xs

removeDuplicates :: (Eq a) => [a] -> [a]
removeDuplicates [] = []
removeDuplicates (x:xs) =
  if elem x xs
    then removeDuplicates xs
    else x : removeDuplicates xs

-- Probably a cleaner way to show this
removeDuplicates' :: (Eq a) => [a] -> [a]
removeDuplicates' [] = []
removeDuplicates' (x:xs)
  | elem x xs = removeDuplicates' xs
  | otherwise = x : removeDuplicates' xs
-- Categories
{-
    A Category is a collection of the following:
        objects
        morphisms
        composition

    A Category has the following laws
        associativity [ f . (g . h) == (f . g) h ]
        closivity     [ if f: A->B and g: B->C, then there is some  h: A->C ]
        identity      [ id(A): A->A, id(B): B-> B, etc ]
                      [ for g: A->B, (g . id(A)) == (id(B) . g) == (g) ]

    In the realm of Haskell, the Hask category maps to the following:
        Objects are represented with Haskel types
        Morphisms are represented with functions
        Composition is represented with (.)

    ... and I am sure there is more that I do not understand,
    feel free to submit an issue or comment if you notice something wrong
    with my generalizations.

-}
