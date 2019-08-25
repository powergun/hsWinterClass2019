module Golf
    ( skips
    , localMaxima
    ) where

import           Data.List

skips :: [a] -> [[a]]
skips xs = map (\n -> every n xs) [1..(length xs)]
  where
    every n xs = case drop (n-1) xs of
      (y:ys) -> y : every n ys
      []     -> []

localMaxima :: [Integer] -> [Integer]
localMaxima xs = map (!! 1) $ filter (\[a, b, c] -> b > a && b > c) $ triplets
  where
    triplets = filter (\n -> length n == 3) $ transpose [xs, drop 1 xs, drop 2 xs]
