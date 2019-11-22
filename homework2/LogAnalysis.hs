{-# OPTIONS_GHC -Wall #-}
module LogAnalysis where

import Log

parseMessage :: String -> LogMessage
parseMessage [] = Unknown "This is not in the right format"

parseMessageType :: String -> (Maybe MessageType, String)

parseMessageType ['I'] = (Just Info, [])
parseMessageType ['W'] = (Just Warning, [])
parseMessageType message = 
  case (words message) of
    ("I":list) -> (Just Info, unwords list)
    ("W":list) -> (Just Warning, unwords list)
    ("E":potentialErrorNumber:list) -> (Just (Error(read potentialErrorNumber :: Int)), unwords list)
    _ -> (Nothing, message)
