import List
import Integer
import IO
import Prelude

parseInt :: String -> Int
parseInt str = read str :: Int

getLines :: IO String
getLines = do
  dataLine <- getContents
  return dataLine

getGCD :: Integral a => a -> a -> a
getGCD a b
  | b == 0     = abs a
  | otherwise  = getGCD b (a `mod` b)

operateValues :: Int -> Int -> Int -> Int -> Int 
operateValues numA numB ind acc =
  if ind >= numB then acc `div` numB
  else let
    gcdValue = getGCD  ind numB
    sumAcc = acc + (numA ^ gcdValue)
  in
  operateValues numA numB (ind + 1) sumAcc

getValues :: [[Char]] -> Int
getValues arr = result
  where
    numA = parseInt (arr !! 0)
    numB = parseInt (arr !! 1)
    result = operateValues numA numB 0 0

main :: IO ()
main = do
  input <- getLines
  let
    values = (split (== '\n') input)
    dropData = drop 1 (init values)
    cleanData = map words dropData
    result = map (\x -> show (getValues x)) cleanData
  putStrLn (unwords result)