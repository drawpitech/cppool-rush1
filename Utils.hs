module Utils where

isSorted :: Ord a => [a] -> Bool
isSorted list = and $ zipWith (<=) list (tail list)

sasb :: [lx] -> [lx]
sasb (first : second : rest) = second : first : rest
sasb lx = lx

sc :: [la] -> [lb] -> ([la], [lb])
sc la lb = (sasb la, sasb lb)


