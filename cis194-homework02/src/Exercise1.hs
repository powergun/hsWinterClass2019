{-# OPTIONS_GHC -Wall #-}

module Exercise1
  ( parseMessage
  , parseMessages
  ) where

import qualified Log
import           Text.Parsec
import           Text.Parsec.String

parseMessages :: String -> [Log.LogMessage]
parseMessages s =
  case parse (parseLogMessage `endBy` newline) [] s of
    Right ls -> ls
    Left _   -> []

parseMessage :: String -> Log.LogMessage
parseMessage s =
  case parse parseLogMessage [] s of
    Right l -> l
    Left _  -> Log.Unknown s

parseLogMessage :: Parser Log.LogMessage
parseLogMessage = do
  typeToken <- parseTypeToken
  many1 (char ' ')
  timeStamp <- parseTimeStamp
  many (char ' ')
  message <- many (noneOf ['\n'])
  return (Log.LogMessage typeToken timeStamp message)

parseTypeToken :: Parser Log.MessageType
parseTypeToken =
      (char 'I' >> return Log.Info)
  <|> (char 'W' >> return Log.Warning)
  <|> (char 'E' >> many1 (char ' ') >> many1 digit >>= \lv -> return (Log.Error (read lv :: Int)))

parseTimeStamp :: Parser Log.TimeStamp
parseTimeStamp = do
  stamp <- many1 digit
  return (read stamp :: Log.TimeStamp)
