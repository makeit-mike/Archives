import Text.Printf

-- Given some infinite series, return the sum of the series to a given iteration. 



series = {- 1 / -} [1.0,4.0..] 

seriesSum :: Integer -> String
seriesSum n = twoDecimalFormat $ sum $ take (fromIntegral n) $ map (recip) series

twoDecimalFormat :: Double -> String
twoDecimalFormat s = printf "%.2f" s :: String
