module JoinList
  ( JoinList(..)
  -- , (+++)
  , tag
  ) where

data JoinList m a = Empty
                  | Single m a
                  | Append m (JoinList m a) (JoinList m a)
                  deriving (Eq, Show)

(+++) :: Monoid m => JoinList m a -> JoinList m a -> JoinList m a
(+++) a b = a

tag :: Monoid m => JoinList m a -> m
tag (Single m a)       = m
tag (Append _ lhs rhs) = tag lhs `mappend` tag rhs
tag _                  = mempty

