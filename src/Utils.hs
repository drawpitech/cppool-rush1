{-
-- EPITECH PROJECT, 2024
-- rush1
-- File description:
-- Utils
-}

module Utils where

isSorted :: Ord a => [a] -> Bool
isSorted [] = True
isSorted list = and $ zipWith (<=) list (tail list)

sasb :: [lx] -> [lx]
sasb (first : second : rest) = second : first : rest
sasb lx = lx

sc :: [la] -> [lb] -> ([la], [lb])
sc la lb = (sasb la, sasb lb)

pa :: [lx] -> [lx] -> ([lx], [lx])
pa lx (lyHead : lyTail) = (lyHead : lx, lyTail)
pa ly [] = (ly, [])

pb :: [lx] -> [lx] -> ([lx], [lx])
pb (lxHead : lxTail) ly = (lxTail, lxHead : ly)
pb [] ly = ([], ly)

rarb :: [lx] -> [lx]
rarb [] = []
rarb (lxHead : lxTail) = lxTail ++ [lxHead]

rr :: [lx] -> [ly] -> ([lx], [ly])
rr lx ly = (rarb lx, rarb ly)

rrarrb :: [lx] -> [lx]
rrarrb [] = []
rrarrb lx = last lx : init lx

rrr :: [lx] -> [lx] -> ([lx], [lx])
rrr lx ly = (rrarrb lx, rrarrb ly)
