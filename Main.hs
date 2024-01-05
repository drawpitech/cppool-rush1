{-
-- EPITECH PROJECT, 2024
-- rush1
-- File description:
-- Main
-}

module Main where

import System.Environment (getArgs)
import System.Exit (exitWith, ExitCode(ExitFailure))
import Utils (isSorted)

getLa :: IO [Int]
getLa = getArgs >>= return . map read

getOpers :: IO [String]
getOpers = getLine >>= return . words

err :: [Int] -> [Int] -> IO ()
err la lb = putStr "KO: " >> print (la, lb) >> exitWith (ExitFailure 84)

exit :: [Int] -> [Int] -> IO ()
exit la [] | isSorted la = putStrLn "OK"
           | otherwise = err la []
exit la lb = err la lb

execOper :: [Int] -> [Int] -> [String] -> IO ()
execOper la lb [] = exit la lb
execOper la lb (_:xs) = execOper la lb xs

main :: IO ()
main = do op <- getOpers
          la <- getLa
          execOper la lb op
       where lb = []
