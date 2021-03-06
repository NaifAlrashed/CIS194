-- exercise 1-4

toDigitsRev :: Integer -> [Integer]

toDigitsRev 0 = []
toDigitsRev x 
  | isNegative x = []
  | isSingleInteger x = [x]
  | otherwise = (x `mod` 10):toDigitsRev (x `div` 10)
  
isNegative x = x < 0
isSingleInteger x = x >= 0 && x < 10

toDigits :: Integer -> [Integer]

toDigits x = reverse $ toDigitsRev x

doubleEveryOther :: [Integer] -> [Integer]

doubleEveryOther [] = []
doubleEveryOther (x:y:list) = x:(y * 2):doubleEveryOther list
doubleEveryOther (x:list) = x:list

sumDigits :: [Integer] -> Integer

sumDigits [] = 0
sumDigits (singleDigit:digits) = sumValueOfInteger singleDigit + sumDigits digits
  
sumValueOfInteger :: Integer -> Integer

sumValueOfInteger number
  | isSingleInteger number = number
  | otherwise = (number `mod` 10) + sumValueOfInteger (number `div` 10)
  
validate :: Integer -> Bool

validate creditCardNumber = (sumDigits $ doubleEveryOther $ toDigitsRev creditCardNumber) `mod` 10 == 0

-- exercise 5

type Peg = String
type Move = (Peg, Peg)

hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi 0 _ _ _ = []
hanoi numberOfDiscs peg1 peg2 peg3 = hanoi (numberOfDiscs - 1) peg1 peg3 peg2 ++ [(peg1, peg2)] ++ hanoi (numberOfDiscs - 1) peg3 peg2 peg1
