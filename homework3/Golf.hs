remove :: [a] -> Int -> [a]
remove list 0 = list
remove (x:list) count
  | length list > count = remove list (count - 1)
  | otherwise = []
