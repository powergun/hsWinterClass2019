module Exercise3
  ( xor
  , map'
  ) where

xor :: [Bool] -> Bool
xor bs = foldr (==) True bs

map' :: (a -> b) -> [a] -> [b]
map' _ []     = []
map' f (n:ns) = foldl (\acc elem -> acc ++ [f elem]) [f n] ns
