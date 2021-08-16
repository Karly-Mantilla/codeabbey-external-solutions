import IO
import List
import Read

getLines :: IO String
getLines = do
  x <- getContents
  return x

parseInt :: String -> Int
parseInt s = read s :: Int

getValues :: [[Prelude.Char]] -> [Prelude.Char]
getValues arr = result
  where
    num = parseInt (arr !! 0)
    strWord = (arr !! 1)
    result = moveStr num strWord

moveStr :: Prelude.Int -> [a] -> [a]
moveStr x y = do
  let revy = reverse y
  if x > 0 
    then ((drop x y)++(take x y)) 
    else reverse ((drop (x*(-1)) revy)++(take (x*(-1)) revy))

main :: IO ()
main = do
  input <- getLines
  let
    values = split (=='\n') input
    dropData = drop 1 (init values)
    cleanData = map words dropData                                                                                     
    result = map (\x -> (getValues x)) cleanData
  putStrLn (unwords result)