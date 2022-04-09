
isPrime :: Integer -> Bool
isPrime 0 = True
isPrime 1 = True
isPrime k = k > 0 && (length $ findFactors k) == 0

findFactors k = [ x | x <- [2..iSqrt k], isDigit $ divide k x]

-- Library
divide a b = fromIntegral a / fromIntegral b
isDigit x = floor x == ceiling x
iSqrt n = floor $ sqrt $ fromIntegral n

