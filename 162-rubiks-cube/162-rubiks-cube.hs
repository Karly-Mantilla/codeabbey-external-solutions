import Control.Lens ((^.))
import Diagrams.RubiksCube.Move
import Diagrams.RubiksCube.Model
import Data.List (any)
import Data.Traversable

stepR :: RubiksCube a -> RubiksCube a
stepR c = c ^. move R

stepL :: RubiksCube a -> RubiksCube a
stepL c = c ^. move L

stepF :: RubiksCube a -> RubiksCube a
stepF c = c ^. move F

stepU :: RubiksCube a -> RubiksCube a
stepU c = c ^. move U

stepD :: RubiksCube a -> RubiksCube a
stepD c = c ^. move D

stepB :: RubiksCube a -> RubiksCube a
stepB c = c ^. move B

makeStep s r =
  case s of
    "B" -> stepB r
    "F" -> stepF r
    "U" -> stepU r
    "D" -> stepD r
    "L" -> stepL r
    "R" -> stepR r

initialRubiksCube :: RubiksCube Int
initialRubiksCube = RubiksCube (Cube f b l r u d)
  where
    f = Side 7 8 9 4 5 6 1 2 3
    b = pure 0
    l = pure 0
    r = pure 0
    u = pure 0
    d = pure 0

searchNumber :: Int -> RubiksCube Int -> String
searchNumber num cub
  | containsSide _frontSide = "F"
  | containsSide _backSide  = "B"
  | containsSide _leftSide  = "L"
  | containsSide _rightSide = "R"
  | containsSide _upSide    = "U"
  | containsSide _downSide  = "D"
  where
    containsSide fn = foldl(\r x -> r || x == num) False (side fn)
    side fn = fn (_cube cub) 

main = do
  getLine
  commands <- words <$> getLine
  let rotatedCube = foldl (\cmd cube -> makeStep cube cmd) initialRubiksCube commands  
  putStrLn $ unwords $ [searchNumber n rotatedCube | n <- [1..9]]