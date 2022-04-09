{-# LANGUAGE OverloadedStrings #-}
module Main where

import Lib 
import Database.PostgreSQL.Simple 

localPG :: ConnectInfo
localPG = defaultConnectInfo 
   { connectHost = "localhost" -- I am running from a docker container
   , connectDatabase = "postgres"
   , connectUser = "postgres"
   , connectPassword = "some unique password"
   }

select_add2 = "SELECT 1 + 1"

main :: IO ()
main = do
   conn <- connect localPG
   mapM_ print =<< (query_ conn select_add2 :: IO [Only Int])
