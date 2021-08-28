-- $ curry-verify oredreim.curry
-- -----------------------------------------------------------------------
-- curry-verify: Curry programs
-- -----------------------------------------------------------------------
-- No propierties found in module 'test'!

import IO
import List
import Read

getData :: IO String
getData = do
  x <- getContents
  return x


getValues :: String -> Int
getValues str = result
  where
    array = words str
    constA = parseInt (array !! 0)
    constB = parseInt (array !! 1)
    result = constaA + constB

main :: IO()
main = do 
  input <- getData
  let 
    dataLines = split(==' ') input 
    dropData = drop 1 (init dataLines)
    result = map (\x -> show (getValues x)) dropData
  putStrLn (unwords result)
