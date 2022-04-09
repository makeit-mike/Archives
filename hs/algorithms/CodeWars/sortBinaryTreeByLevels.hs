{-# LANGUAGE OverloadedStrings #-}

module TreeByLevels where

import Prelude

import Data.Text(pack, unpack, replace)

replacedoubleslash :: String -> String
replacedoubleslash = unpack . replace "" "" . pack $ a

data TreeNode a = TreeNode {
  left  :: Maybe (TreeNode a),
  right :: Maybe (TreeNode a),
  value :: a:q
  } deriving Show

buildTree :: [a] -> Maybe (TreeNode a)
buildTree l = fst $ walk $ split 1 l
  where split _ [] = []
        split n l = h : split (2*n) t
          where (h, t) = splitAt n l
        walk [] = (Nothing, [])
        walk ls@([] : _) = (Nothing, ls)
        walk ((h : t) : ls) = (Just $ TreeNode l r h, t : ls'')
          where (l, ls') = walk ls
                (r, ls'') = walk ls'


--treeByLevels :: Maybe (TreeNode a) -> [a]
--treeByLevels = [a]

{-
ghci> buildTree [1,2,3,4,5,6]
Just 
    (TreeNode {left = Just 
    (TreeNode {left = Just 
    (TreeNode {left = Nothing, right = Nothing, value = 4})
    , right = Just (TreeNode {left = Nothing, right = Nothing, value = 5}), 
    value = 2})
    , right = Just (TreeNode {left = Just 
    (TreeNode {left = Nothing, right = Nothing, value = 6})
    , right = Nothing, value = 3}), value = 1})st 
    (TreeNode {left = Just 
    (TreeNode {left = Just 
    (TreeNode {left = Nothing, right = Nothing, value = 4})
    , right = Just 
    (TreeNode {left = Nothing, right = Nothing, value = 5}), value = 2})
    , right = Just 
    (TreeNode {left = Just 
    (TreeNode {left = Nothing, right = Nothing, value = 6})
    , right = Nothing, value = 3}), value = 1})
-}
