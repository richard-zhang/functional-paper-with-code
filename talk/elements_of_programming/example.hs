remainder a b 
  | a - b >= b = let new_remain = remainder a (b + b) in if new_remain < b then new_remain else new_remain - b
  | otherwise = a - b
