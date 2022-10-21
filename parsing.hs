import Data.List.Split

import Data.Char
k = "3*x^2 + 2*y + 5*z + y - 7*y^2 + 4*x*y^2"

elimSpaces :: String -> String -> [String]
elimSpaces list target = splitOn target list

z = "42*z^2"

extractCoef:: String -> String
extractCoef [] = []
extractCoef x = if head x /= '*' then head x : extractCoef (tail x) else []