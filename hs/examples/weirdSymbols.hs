
-- #1. The weird pipe/fmap symbol:
multListBy2 = (*2) <$> [1..3]
-- returns [2,4,6]
multListBy2' = fmap (*2) [1..3]
-- returns [2,4,6]

-- #2. Combinators
-- first... some definitions
--	arr :: (b -> c) -> a b c
--	first :: a b c -> a (b,c) (c,d) // useful for tuples
--	(***) :: a b c -> a b' c' -> a (b, b') (c c')
--	(&&&) :: a b c -> a b c' -> a b (c c')
--	(>>>) :: Category cat => cat a b -> cat b c -> cat a c
--		f >>> g = g . f
--	
