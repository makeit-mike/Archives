{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}

module Lib where

import           Data.Aeson
import           Data.Text
import qualified Data.Text.IO     as T
import           GHC.Generics
import           System.Directory

data Person =
  Person
    { name :: Text
    , age  :: Int
    }
  deriving (Generic, Show)

instance FromJSON Person

instance ToJSON Person

jsonFile1 = readFile "../../"

currDir = getCurrentDirectory

someFunc :: IO ()
someFunc = do
  putStrLn $ "Joe's Age: " ++ show (age joe)
  putStrLn $ "Encode: " ++ show (encode joe)
  putStrLn $ "Decode: " ++ show l
  putStrLn $ "Name: " ++ show (maybe "" name l)
  where
    l = decode encodedJoe :: Maybe Person

helloWorld = T.putStrLn "Hello, World!"

joe = Person {name = "Joe", age = 12}

encodedJoe = "{ \"name\": \"Joe\", \"age\": 12 }"
