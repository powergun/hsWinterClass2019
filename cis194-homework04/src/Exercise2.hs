module Exercise2
  ( Tree(..)
  , foldTree
  , height
  ) where


data Tree a = Leaf
            | Node Integer (Tree a) a (Tree a)
            deriving (Show, Eq)

endNode :: a -> Tree a
endNode v = Node 0 Leaf v Leaf

foldTree :: [a] -> Tree a
foldTree []     = Leaf
foldTree (x:xs) =
  let (half0, half1) = splitAt (length xs `div` 2) xs
      t = Node 0 (foldTree half0) x (foldTree half1)
  in calculateHeight t

height :: Tree a -> Integer
height Leaf           = 0
height (Node h _ _ _) = h

calculateHeight :: Tree a -> Tree a
calculateHeight Leaf = Leaf
calculateHeight n@(Node _ Leaf _ Leaf) = n
calculateHeight (Node h l v r) = Node (1 + max (height l) (height r)) l v r
