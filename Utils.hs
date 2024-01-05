module Utils where

isSorted :: Ord a => [a] -> Bool
isSorted list = and $ zipWith (<=) list (tail list)

sasb :: [lx] -> [lx]
sasb (first : second : rest) = second : first : rest
sasb lx = lx

sc :: [la] -> [lb] -> ([la], [lb])
sc la lb = (sasb la, sasb lb)

-- Take the first element of l1 and prepend it to l2
papb :: [lx] -> [lx] -> ([lx], [lx])
papb (lxHead : lxTail) (lyHead : lyTail) = (lxTail, lxHead : lyHead : lyTail)
papb lx ly = (lx, ly)

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
