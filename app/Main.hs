module Main where

import MementoMori

import Data.Time
import Text.Read
import Text.Printf
import System.Environment
import System.Exit

main :: IO ()
main = do
  args <- getArgs
  now <- getCurrentTime
  let processed = argsToDate args now
  case processed of
    Left err -> do
      putStrLn err
      exitFailure
    Right age -> do
      printf "%.4f\n" age
      exitSuccess

convertArgs :: [String] -> Either String [Int]
convertArgs strs
  | len >= 3 = sequence $ fmap (readEither :: String -> Either String Int) $ take 3 strs
  | otherwise = Left("required at least length 3 list of ints")
  where len = length strs


intsToDate :: [Int] -> UTCTime -> Float
intsToDate ints time =
  let (y:m:d:_) = ints
      yInteger = toInteger y
      day = fromGregorian yInteger m d
  in  ageFloat day time


argsToDate :: [String] -> UTCTime -> Either String Float
argsToDate strs time =
  let converted = convertArgs strs
  in  case converted of
    Left err -> Left err
    Right valid -> Right (intsToDate valid time)
