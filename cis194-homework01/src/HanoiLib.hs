module HanoiLib
  ( MoveSheet(..)
  , emptySheet
  , toMoveSheet
  , testMoveSheet ) where

import           Control.Monad.Writer as W

newtype MoveSheet = MoveSheet [(String, String)] deriving (Show)

emptySheet = MoveSheet ([] :: [(String, String)])

toMoveSheet :: (String, String) -> MoveSheet
toMoveSheet (src, dest) = MoveSheet [(src, dest)]

instance Semigroup MoveSheet where
  (<>) = mappend

instance Monoid MoveSheet where
  mempty = emptySheet
  mappend (MoveSheet p) (MoveSheet q) = MoveSheet (p ++ q)

testMoveSheet :: IO ()
testMoveSheet = do
  let mvs = [("a", "c"), ("b", "d"), ("a", "c"), ("b", "d")]
  (_, MoveSheet mvs') <- W.runWriterT (mockMoves mvs)
  print mvs'
  where
    mockMoves :: [(String, String)] -> W.WriterT MoveSheet IO ()
    mockMoves [] = return ()
    mockMoves (mv:mvs) = do
      W.tell (toMoveSheet mv)
      mockMoves mvs
