{-
    For this exercise you will be strengthening your page-fu mastery. 
    You will complete the PaginationHelper class, which is a utility class helpful for querying paging information related to an array.

    The class is designed to take in an array of values and an integer indicating how many items will be allowed per each page.
    The types of values contained within the collection/array are not relevant.
    The following are some examples of how this class is used:
        collection   = ['a','b','c','d','e','f']

        itemsPerPage = 4

        itemCount collection itemsPerPage       `shouldBe` 6

        pageCount collection itemsPerPage       `shouldBe` 2

        pageItemCount collection itemsPerPage 0 `shouldBe` Just 4 -- four of six items
        pageItemCount collection itemsPerPage 1 `shouldBe` Just 2 -- the last two items
        pageItemCount collection itemsPerPage 3 `shouldBe` Nothing -- page doesn't exist

        pageItemCount [1,2,3,4,5,6], 4, 0 = > 4
                    0 = [1,2,3,4]
                    1 = [5,6]
                    .. = null
                        where pageStartIndex = (0+1) * 4 = 4 ([5..])



        pageIndex collection itemsPerPage  0    `shouldBe` Just 0 -- zero based index
        pageIndex collection itemsPerPage  5    `shouldBe` Just 1 
        pageIndex collection itemsPerPage 20    `shouldBe` Nothing
        pageIndex collection itemsPerPage (-20) `shouldBe` Nothing
-}

type Collection a = [a]
type ItemsPerPage = Int

itemCount :: Collection a -> Int
itemCount = length

pageCount :: Collection a -> ItemsPerPage -> Int
pageCount xs n = length $ (toPages n xs)

pageItemCount :: Collection a -> ItemsPerPage -> Int -> Maybe Int
pageItemCount xs n page 
                        | page >= pageCount xs n = Nothing 
                        | otherwise = Just $ length $ toPages n xs !! (page) 

pageStartIndex :: Collection a -> ItemsPerPage -> Int -> Maybe Int
pageStartIndex xs ipp page 
                        | x > (length xs) = Nothing 
                        | otherwise =  Just x
                            where x = (page) * ipp

pageIndex :: Collection a -> ItemsPerPage -> Int -> Maybe Int
pageIndex [] n item = Nothing
pageIndex xs n item
  | item < 0 = Just 0 
  | itemCount xs <= item = Nothing
  | otherwise = Just $ div item n
                    
toPages :: Int -> [a] -> [[a]]
toPages _ [] = []
toPages n xs = as : toPages n bs 
  where (as,bs) = splitAt n xs