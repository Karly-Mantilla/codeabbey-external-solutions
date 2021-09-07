import Data.Matrix
import Control.Lens
import Data.List (intercalate,sort)

-- * Support lenses
rows :: (Applicative f) => ([a] -> f [a]) -> Matrix a -> f (Matrix a)
rows f m = fmap fromLists $ sequenceA $ map f $ toLists m  

columns :: (Applicative f) => ([a] -> f [a]) -> Matrix a -> f (Matrix a)
columns f m = fmap (transpose . fromLists) $ sequenceA $ map f $ toLists $ transpose m  

-- * Game logic
parse :: (Num a, Eq a) => [a] -> [a]
parse = take 4 . (++ repeat 0) . parse' . filter (/=0)
 where parse' [] = []
       parse' [a] = [a]
       parse' (a:b:as) | a == b = (a*2) : parse as
                       | otherwise = a : parse' (b:as) 
move :: (Num a, Eq a) => Char -> Matrix a -> Matrix a
move 'L' = rows %~ parse 
move 'R' = rows . reversed %~ parse
move 'U' = columns %~ parse
move 'D' = columns . reversed %~ parse
move _ = id

moveSeq = flip $ foldl (flip move) 

-- * 
main = do
    matrix <- fmap (fromList 4 4 . map read . words . intercalate " ") $ sequence $ replicate 4 getLine 
    moves <- fmap (concat . words) getLine
    putStrLn $ unwords $ reverse $ map show $ funn 2 [0] $ sort $ toList $ moveSeq moves matrix
 where funn _ acc [] = acc
       funn n (a:as) (v:vs) = case compare n v of
        LT -> funn (n*2) (0:a:as) (v:vs)
        EQ -> funn n (a+1 : as) (vs)
        GT -> funn n (a:as) (vs)
