import           Data.Char as C
import           Data.List as L


-- One Liner
isPangram :: String -> Bool
isPangram a = length
                (filter (\x -> notElem x (map (toLower) a)) $ ['a'..'z'])
                == 0


-- Better long term

lowerString = map (toLower)

checkLength i s = length s == i

filterAlphabet a = filter (\x -> notElem x (map (toLower) a)) $ ['a'..'z']

t1 = "The quick brown fox jumps over the lazy dog."
t2 = "Pack my box with five dozen liquor jugs."
t3 = "Not every sentence is a a pangram. An example"
