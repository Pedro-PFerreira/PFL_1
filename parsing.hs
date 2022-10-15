import Data.List.Split

import Data.Char
input = "3*x^2 + 2*y + 5*z + y - 7*y^2 + 4*x*y^2"

vars = splitOn " " input

lista = filter (/= " ") vars

removeFirst::[a] -> [a]
removeFirst [] = []
removeFirst [x] = []
removeFirst (x:xs) = xs

addSignal::[String] -> [[String]]
addSignal [] = []
addSignal (x:xs)
                | x == "+" = [x, head xs] : addSignal (removeFirst xs)
                | x == "-" = [x, head xs] : addSignal (removeFirst xs)
                | otherwise = ["+", x] : addSignal xs

res = addSignal lista

multiplyrem :: [[String]] -> [[String]]
multiplyrem = map (filter (/= "*"))


example = [["+", "3", "x", "2"], ["-", "4", "x", "2"], ["+", "3", "x", "1"]]

{-
-- Ultimate solution for splitting
splitOnAnyOf :: Eq a => [[a]] -> [a] -> [[a]]
splitOnAnyOf ds xs = foldl (\ys d -> ys >>= splitOn d) [xs] ds

miau = [x | x <-splitOnAnyOf [" "] "2 * x + y -z", x /= ""]
-}
