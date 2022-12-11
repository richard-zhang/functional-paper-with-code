module Fold where

-- |

-- >>> dropWhile id [False, True, False, True]
-- [False,True,False,True]
--
-- >>> dropWhile'' id [True, True, True, True, False, True]
-- [False,True]

-- dropWhile using foldl
dropWhile' f [] = []
dropWhile' f (x : xs) = if f x then dropWhile' f xs else x : xs

dropWhile'' p = fst . foldr f ([], [])
  where
    f x (drop, orig) = (if p x then drop else x: orig, x : orig)

h f g y xs = foldr (g y) (f y) xs
-- hlint will actully give you hint of the equivalent fold form amazing
-- h f g y = foldr (g y) (f y)
