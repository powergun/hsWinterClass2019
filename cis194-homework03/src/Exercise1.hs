module Exercise1 (skips) where

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