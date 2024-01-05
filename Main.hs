{-
-- EPITECH PROJECT, 2024
-- rush1
-- File description:
-- Main
-}

module Main where

getOpers :: IO [String]
getOpers = getLine >>= return . words

exit :: [Int] -> [Int] -> IO ()
exit _ [] = putStrLn "OK"
exit la lb = putStr "KO: " >> print (la, lb)

execOper :: [Int] -> [Int] -> [String] -> IO ()
execOper la lb [] = exit la lb
execOper la lb (_:xs) = execOper la lb xs

main :: IO ()
main = getOpers >>= execOper la lb
    where la = []
          lb = []
