module Lab6 (main, DigitalTime (..)) where

main :: IO ()
main = do
    putStrLn "Hello, world!"

    let time1 = DigitalTime (10, 30, 45)
    let time2 = DigitalTime (10, 30, 45)
    let time3 = DigitalTime (10, 30, 30)
    
    print $ show (time1 == time2) -- Shoulde be True
    print $ show (time1 == time3) -- Should be False

    

{--
    Add your functions for lab 6 below. Function and type signatures are 
    provided below, along with dummy return values.
    Add your code below each signature, but to not modify the types.
       
    Test your code by running 'cabal test' from the lab3 directory.
--}
    
data DigitalTime = DigitalTime (Int, Int, Int)

instance Show DigitalTime where 

  show (DigitalTime (h, m, s)) =
    
    let 
      hh = if h < 10 then "0" ++ show h else show h --if hours > 12, mins and secs > 60 then what? return false?
      mm = if m < 10 then "0" ++ show m else show m
      ss = if s < 10 then "0" ++ show s else show s
    in
      "<" ++ hh ++ ":" ++ mm ++ ":" ++ ss ++ ">"

instance Eq DigitalTime where

  (DigitalTime (h1, m1, s1)) == (DigitalTime (h2, m2, s2)) 
    | h1 == h2 && m1 == m2 && s1 == s2 = True
    | otherwise = False

instance Ord DigitalTime where
  compare (DigitalTime (h1, m1, s1)) (DigitalTime (h2, m2, s2))
    | h1 /= h2 = compare h1 h2 -- /= not equal to 
    | m1 /= m2 = compare m1 m2
    | s1 /= s2 = compare s1 s2
    | otherwise = EQ
    
instance Num DigitalTime where
  (+) (DigitalTime (h1, m1, s1)) (DigitalTime (h2, m2, s2)) =

    let totalSeconds = (s1 + s2) `mod` 60 
        totalMinutes = (m1 + m2 + ((s1 + s2) `div` 60)) `mod` 60 --insted of recalcualting, can take the remainder after mod?
        totalHours = (h1 + h2 + ((m1 + m2 + ((s1 + s2) `div` 60)) `div` 60)) `mod` 12 -- not 24 time
    in DigitalTime (totalHours, totalMinutes, totalSeconds) 

  --(-) (DigitalTime (h1, m1, s1)) (DigitalTime (h2, m2, s2)) =
    --let 
       -- totalSeconds = (s1 - s2) `mod` 60

        --check if need to barrow? carry part

        --totalMinutes = (m1 - m2 - CARRY PART ) `mod` 60

       --check if need to barrow? carry part

        --totalHours = (h1 - h2 - CARRY PART ) `mod` 12

  -- in DigitalTime (totalHours, totalMinutes, totalSeconds)

  fromInteger sec =
    let
      total = fromInteger sec
      hrs = total `div` 3600 -- = one hour
      mins = (total `mod` 3600) `div` 60
      secs = total `mod` 60
    in
      DigitalTime (hrs, mins, secs)
  
