module Theory where

main = do
  putStrLn "Read the comments to view ramblings."
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
    with my generalizations.`
-}
