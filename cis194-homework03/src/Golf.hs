module Golf
    ( skips
    , localMaxima
    , histogram
    ) where

import           Data.List

{-
This problem has two parts:

Part 1: select every n-th element from the given list
e.g. given (a, b, c, d), the 2nd elements are (b, d), computed by
> dropping the elements before b, which are the first n - 1 elements
> if there are remaining elements after b, repeat step 1

Part 2: repeatedly select n-th elements, from 1st to n-th, n
being the length of the given list. This is done by mapping the
length parameter [1..(length xs)] over the selection function
created in Part 1
-}
skips :: [a] -> [[a]]
skips xs = map (\n -> every n xs) [1..(length xs)]
  where
    every n xs = case drop (n-1) xs of
      (y:ys) -> y : every n ys
      []     -> []

{-
The local maxima problem can be simplified as:

For each three adjecant elements (called "triplets") (n-1, n, n+1),
if n > n - 1 and also n > n + 1, n is the a local maxima.

It uses transpose() function from Data.List to generate such "triplets",
from the original list.
e.g. given [a, b, c, d] the triplets are (a, b, c), (b, c, d) as
shown in the following columns (marked by ^)
    a b c d
  a b c d
a b c d
    ^ ^

Then it uses a filter lambda to discard those that do not pass
the local-maxima test.
-}
localMaxima :: [Integer] -> [Integer]
localMaxima xs = map (!! 1) $ filter (\[a, b, c] -> b > a && b > c) $ triplets
  where
    triplets = filter (\n -> length n == 3) $ transpose [xs, drop 1 xs, drop 2 xs]

histogram :: [Integer] -> String
histogram xs = ""
