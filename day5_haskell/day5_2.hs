import Prelude
import Data.List
import System.IO
-- import Control.Monad
-- main = interact "test"
main = do
    contents <- getContents
    print (contents)
    -- let foo = "qjhvhtzxzqqjkmpb\nuurcxstgmygtbstg"
    -- print (countValid (lines foo))
    print (countValid (lines contents))

countValid :: [[Char]] -> Int
countValid c = sum (map boolToInt (map isValid c))

boolToInt :: Bool -> Int
boolToInt b = if b == True then 1 else 0

isValid :: [Char] -> Bool
isValid c = hasStringTwice c && repeatsWithOneBetween c

hasStringTwice :: [Char] -> Bool
hasStringTwice (x:xs) 
                | length xs == 0 = False
                | (([x] ++ ([head xs])) `isInfixOf` (tail xs)) == True  = True
                | otherwise = hasStringTwice xs

repeatsWithOneBetween :: [Char] -> Bool
repeatsWithOneBetween (x:y:xs)
                | length xs == 0 = False
                | x == (head xs) = True
                | otherwise = repeatsWithOneBetween ([y] ++ xs)