module Exercise3
  ( xor
  , map'
  , myFoldl
  ) where

xor :: [Bool] -> Bool
xor bs = foldr (==) True bs

map' :: (a -> b) -> [a] -> [b]
map' _ []     = []
map' f (n:ns) = foldl (\acc elem -> acc ++ [f elem]) [f n] ns

myFoldl :: (a -> b -> a) -> a -> [b] -> a
myFoldl f z xs = foldr step id xs z
    where step x g a = g (f a x)
