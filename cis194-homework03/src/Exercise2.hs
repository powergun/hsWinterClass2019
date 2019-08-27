module Exercise2 (localMaxima) where

import           Data.List

{-
The local maxima problem can be simplified as:

For each three adjecant elements (called "triplets") (n-1, n, n+1),
if n > n - 1 and also n > n + 1, n is the a local maxima.

It uses transpose() function from Data.List to generate such
"triplets" from the original list.
e.g. given [a, b, c, d] the triplets are (a, b, c), (b, c, d) as
shown in the following columns (annotated by ^)
    | a b | c d
  a | b c | d    (dropping a)
a b | c d |      (dropping a, b)
drop  ^ ^   drop

Then it uses a filter lambda to discard those that do not pass
the local-maxima test.
-}
localMaxima :: [Integer] -> [Integer]
localMaxima xs = map (\(a,b,c) -> b) $ filter (\(a,b,c) -> b>a && b>c) (zip3 xs (drop 1 xs) (drop 2 xs))

