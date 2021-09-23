import Data.Char

main = do
  n <- readLn :: IO Int
  readPairs n

readPairs :: Int -> IO ()
readPairs 0 = return ()
readPairs n = do
  array <- getLine
  let xs = map read $ words array :: [Float]
  let a = head array
  let b = array !! 1
  let c = array !! 3
  let d = array !! 4
  putStr $ validation a b c d
  putStr " "
  readPairs (n-1)

validation :: Char -> Char -> Char -> Char -> String
validation a b c d
  | b == d || a == c = "Y"
  | abs ((ord d - 48) - (ord b - 48)) == abs ((ord c - 96) - (ord a - 96)) = "Y"
  | otherwise = "N"