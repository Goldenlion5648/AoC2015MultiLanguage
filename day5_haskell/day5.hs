import Prelude
import Data.List
import System.IO
-- import Control.Monad
-- main = interact "test"
main = do
    contents <- getContents
    print (countValid (lines contents))
    -- let foo = "ugknbfddgicrmopn\njchzalrnumimnmhp"
    -- print (countValid (lines foo))


countVowel :: String -> Int
countVowel "" = 0
countVowel (c:cs) 
            | c == 'a' = 1 + countVowel cs
            | c == 'e' = 1 + countVowel cs
            | c == 'i' = 1 + countVowel cs
            | c == 'o' = 1 + countVowel cs
            | c == 'u' = 1 + countVowel cs
            | otherwise = countVowel cs

vowelCountGood :: String -> Bool
vowelCountGood s
            | x >=3 = True
            | otherwise = False
            where x = countVowel s 


nextMatches :: String -> Bool
nextMatches (x:xs)
            | length xs == 0 = False
            | x == head xs = True
            | otherwise = nextMatches xs

doesNotContainBlacklist :: String -> Bool
doesNotContainBlacklist (x:xs)
            | length xs == 0 = True
            | y == "ab" = False
            | y == "cd" = False
            | y == "pq" = False
            | y == "xy" = False
            | otherwise = doesNotContainBlacklist xs
            where y = [x] ++ [head xs]

meetsAllConditions :: String -> Bool
meetsAllConditions s = (vowelCountGood s) && (nextMatches s) && (doesNotContainBlacklist s)

boolToInt :: Bool -> Int
boolToInt b = if b == True then 1 else 0

countValid :: [[Char]] -> Int
countValid s = sum $ map boolToInt $ map meetsAllConditions s 
-- show lines
-- f :: [String] -> Int
-- f = show
