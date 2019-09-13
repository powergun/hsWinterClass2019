module Exercise3 (streamToList) where

newtype Stream a = Stream a

streamToList :: Stream a -> [a]
streamToList (Stream v) = repeat v

instance Show a => Show (Stream a) where
  show (Stream v) = "[" ++ show v ++ "..]"
