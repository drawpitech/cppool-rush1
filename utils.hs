isSorted :: Ord a => [a] -> Bool
isSorted list = and $ zipWith (<=) list (tail list)

sasb :: [lx] -> [lx]
sasb [] = []
sasb (head : second : tail) = second : head : tail

sc :: [la] -> [lb] -> ([la], [lb])
sc la lb = (sasb la, sasb lb)
