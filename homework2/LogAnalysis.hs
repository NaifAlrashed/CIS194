{-# OPTIONS_GHC -Wall #-}
module LogAnalysis where

import Log

parse :: String -> [LogMessage]
parse logs = map parseMessage (lines logs)

parseMessage :: String -> LogMessage

parseMessage message =
  case parseMessageType message of
    (Nothing, _) -> Unknown "This is not in the right format"
    (Just messageType, restOfMessage) ->
      case parseTimeStamp restOfMessage of
        (Nothing, _) -> Unknown "This is not in the right format"
        (Just timeStamp, whatsLeftOfMessage) -> LogMessage messageType timeStamp whatsLeftOfMessage
            

parseMessageType :: String -> (Maybe MessageType, String)

parseMessageType ['I'] = (Just Info, [])
parseMessageType ['W'] = (Just Warning, [])
parseMessageType message = 
  case (words message) of
    ("I":list) -> (Just Info, unwords list)
    ("W":list) -> (Just Warning, unwords list)
    ("E":potentialErrorNumber:list) -> (Just (Error(readInt potentialErrorNumber)), unwords list)
    _ -> (Nothing, message)
    
parseTimeStamp :: String -> (Maybe TimeStamp, String)

parseTimeStamp message =
  case words message of
    (potentialTimeStamp:list) -> (Just $ readInt potentialTimeStamp, unwords list)
    _ -> (Nothing, message)
    
parseRestOfMessage :: String -> (Maybe String, String)

parseRestOfMessage [] = (Nothing, [])
parseRestOfMessage message = (Just message, [])
    

readInt :: String -> Int
readInt = read
