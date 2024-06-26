{-
-- EPITECH PROJECT, 2024
-- rush1
-- File description:
-- Main
-}

module Main where

import System.Environment (getArgs)
import System.Exit (exitWith, ExitCode(ExitFailure))
import Text.Read (readMaybe)

import Utils (isSorted, sasb, sc, pa, pb, rarb, rr, rrarrb, rrr)

-- Retrieve input args using getArgs, then put it in a integers list using mapM (map Maybe) and readMaybe.
getLa :: IO (Maybe [Int])
getLa = getArgs >>= return . mapM readMaybe

-- Get the line containing the operations and parse it in a string list using words.
getOpers :: IO [String]
getOpers = getLine >>= return . words

-- Print the correct error message
err :: [Int] -> [Int] -> IO ()
err la lb = putStr "KO: " >> print (la, lb)

-- Check if the list is sorted and exit with the correct message
exit :: [Int] -> [Int] -> IO ()
exit la [] | isSorted la = putStrLn "OK"
           | otherwise = err la []
exit la lb = err la lb

-- Execute the operations from the list of operations on the lists
execOper :: ([Int], [Int]) -> [String] -> IO ()
execOper (la, lb) ("sa":xs) = execOper (sasb la, lb) xs
execOper (la, lb) ("sb":xs) = execOper (la, sasb lb) xs
execOper (la, lb) ("sc":xs) = execOper (sc la lb) xs
execOper (la, lb) ("pa":xs) = execOper (pa la lb) xs
execOper (la, lb) ("pb":xs) = execOper (pb la lb) xs
execOper (la, lb) ("ra":xs) = execOper (rarb la, lb) xs
execOper (la, lb) ("rb":xs) = execOper (la, rarb lb) xs
execOper (la, lb) ("rr":xs) = execOper (rr la lb) xs
execOper (la, lb) ("rra":xs) = execOper (rrarrb la, lb) xs
execOper (la, lb) ("rrb":xs) = execOper (la, rrarrb lb) xs
execOper (la, lb) ("rrr":xs) = execOper (rrr la lb) xs
execOper (la, lb) [] = exit la lb
execOper _ _ = exitWith (ExitFailure 84)

-- Execute the operations from the list of operations on the lists
-- Fails if the list of arguments is Nothing
exec :: Maybe [Int] -> [String] -> IO ()
exec (Just la) op = execOper (la, []) op
exec _ _ = exitWith (ExitFailure 84)


main :: IO ()
main = do op <- getOpers
          la <- getLa
          exec la op
