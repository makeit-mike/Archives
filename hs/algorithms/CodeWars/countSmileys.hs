module Smile where
import Test.Hspec

-- Given a list of "smiley" emoticons, return the number of valid smileys.
-- a smile is a string that consists of 
-- Eyes     ;  ;
-- Nose     -  ~   (or nothing)
-- Mouth    )  D

-- ex. :( is not valid.

-- BRUTE FORCE BABY!
countSmileys :: [String] -> Int
countSmileys = length . filter (\n -> filterBy n)

filterBy n = elem n validFaces

validFaces = [
        ":)",
        ":-)",
        ":~)",

        ";)",
        ";-)",
        ";~)",

        ":D",
        ":-D",
        ":~D",
        
        ";D",
        ";-D",
        ";~D"
    ]

-- More intuitive solution. Allows easier scalability
countSmileys2 :: [String] -> Int
countSmileys2 = length . filter filterBy2

filterBy2 [e,m] = elem e eyes && elem m mouth
filterBy2 [e,n,m] = elem n nose && filterBy2 [e,m]
filterBy2 _ = False

eyes = ":;"
nose = "-~"
mouth = ")D"

main = do
    countSmileys []                               `shouldBe` 0
    countSmileys [":D",":~)",";~D",":)"]          `shouldBe` 4
    countSmileys [":)",":(",":D",":O",":;"]       `shouldBe` 2
    countSmileys [";]", ":[", ";*", ":$", ";-D"]  `shouldBe` 1
    countSmileys [";", ")", ";*", ":$", "8-D"]    `shouldBe` 0 