{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module Lib
    ( someFunc
    ) where

import qualified Data.Text.IO as T
import Data.Aeson
import Data.Text
import GHC.Generics

data Person = Person { name :: Text
                     , age :: Int 
                     } deriving (Generic, Show)

instance FromJSON Person
instance ToJSON Person

someFunc :: IO ()
someFunc = do
    putStrLn $ "Joe's Age: " ++ show (age joe)
    putStrLn $ "Encode: " ++ show (encode joe)
    putStrLn $ "Decode: " ++ show l
    putStrLn $ "Name: " ++ show (maybe "" name l)
        where l = decode encodedJoe :: Maybe Person

helloWorld = T.putStrLn "Hello, World!"

joe = Person { name = "Joe", age = 12 }
encodedJoe = "{ \"name\": \"Joe\", \"age\": 12 }"