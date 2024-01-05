{-
-- EPITECH PROJECT, 2024
-- rush1
-- File description:
-- Main
-}

module Main where

import System.Environment (getArgs)

import Utils (isSorted, sasb, sc, papb, rarb, rr, rrarrb, rrr)
import System.Exit (exitWith, ExitCode(ExitFailure))

getLa :: IO [Int]
getLa = getArgs >>= return . map read

getOpers :: IO [String]
getOpers = getLine >>= return . words

err :: [Int] -> [Int] -> IO ()
err la lb = putStr "KO: " >> print (la, lb)

exit :: [Int] -> [Int] -> IO ()
exit la [] | isSorted la = putStrLn "OK"
           | otherwise = err la []
exit la lb = err la lb

execOper :: ([Int], [Int]) -> [String] -> IO ()
execOper (la, lb) ("sa":xs) = execOper (sasb la, lb) xs
execOper (la, lb) ("sb":xs) = execOper (la, sasb lb) xs
execOper (la, lb) ("sc":xs) = execOper (sc la lb) xs
execOper (la, lb) ("pa":xs) = execOper (papb lb la) xs
execOper (la, lb) ("pb":xs) = execOper (papb la lb) xs
execOper (la, lb) ("ra":xs) = execOper (rarb la, lb) xs
execOper (la, lb) ("rb":xs) = execOper (la, rarb lb) xs
execOper (la, lb) ("rr":xs) = execOper (rr la lb) xs
execOper (la, lb) ("rra":xs) = execOper (rrarrb la, lb) xs
execOper (la, lb) ("rrb":xs) = execOper (la, rrarrb lb) xs
execOper (la, lb) ("rrr":xs) = execOper (rrr la lb) xs
execOper (la, lb) [] = exit la lb
execOper _ _ = exitWith (ExitFailure 84)

main :: IO ()
main = do op <- getOpers
          la <- getLa
          execOper (la, lb) op
       where lb = []
