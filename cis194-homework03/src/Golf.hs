module Golf
    ( skips
    ) where

skips :: [a] -> [[a]]
skips xs = map (\n -> every n xs) [1..(length xs)]
  where
    every n xs = case drop (n-1) xs of
      (y:ys) -> y : every n ys
      []     -> []
skips [] = []
