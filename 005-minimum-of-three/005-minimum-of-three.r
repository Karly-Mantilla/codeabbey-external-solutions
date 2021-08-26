import Float
import IO
import List
import Read

getLines :: IO String
getLines = do
  x <- getContents
  return x

parseInt :: String -> Int
parseInt s = read s :: Int

getValues :: String -> Int
getValues str = result
  where
    array = words str
    constA = parseInt (array !! 0)
    constB = parseInt (array !! 1)
    constC = parseInt (array !! 2)
    result = min constC (min (constA) (constB))

main :: IO ()
main = do
  input <- getLines
  let
    values = split (=='\n') input
    dropData = drop 1 (init values)
    result = map (\x -> show (getValues x)) dropData
  putStrLn (unwords result)