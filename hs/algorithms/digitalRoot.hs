module DigitalRoot where

-- digitalRoot :: Int -> a
digitalRoot input =
  if length (show digRootSum) > 1
    then digitalRoot digRootSum
    else digRootSum
  where
    digRootSum = sum $ map (\x -> toIntFromStr [x]) (show input)

toIntFromStr :: String -> Int
toIntFromStr input = read input :: Int
