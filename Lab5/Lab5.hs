module Lab5 (main, third_last, every_other, is_cyclops, domino_cycle, tukeys_ninther) where

main :: IO ()
main = do
  putStrLn "Hello, world!"
  let test = [1, 2, 3, 4, 5]
  let result = third_last test
  print result -- should print 3

  let test2 = 103
  let result2 = is_cyclops test2
  print result2 -- should print True

  

{--
    Add your functions for lab 3 below. Function and type signatures are
    provided below, along with dummy return values.
    Add your code below each signature, but to not modify the types.

    Test your code by running 'cabal test' from the lab3 directory.
--}

third_last :: [a] -> a
third_last [] = error "Not 3 elems"
third_last [_] = error "Not 3 elems"
third_last [_, _] = error "Not 3 elems"
third_last (x:_:_:[]) = x
third_last (_:xs) = third_last xs

{--

third_last (x : _ : _ : []) = x Base Case: looking for a list with exactly 3 elements

third_last (_ : xs) = third_last xs Removes head, and gets tail until it meets the base case

--}

every_other :: [a] -> [a]
every_other [] = [] 
every_other [x] = [x]
every_other (x:_:xs) = x : every_other xs

{--

The (x:_:xs) part: 

x takes the first elem, skips the second, and sets xs as the tail

--}

is_cyclops :: Int -> Bool
is_cyclops n =
  let dig = show n
      len = length dig
      midIndex = (len - 1) `div` 2
  in len `mod` 2 == 1 && dig !! midIndex == '0' && all (/= '0') (take midIndex dig ++ drop (midIndex + 1) dig) 

  {--

let dig = show n N is converted into a string using show

midIndex = (len - 1) `div` 2 Finds the middle index (for odd)

in len `mod` 2 == 1 && dig !! midIndex == '0' && all (/= '0') (take midIndex dig ++ drop (midIndex + 1) dig)

First checks if the number is odd

Second checks if the middle digit is 0

take midIndex dig ++ drop (midIndex + 1) dig Takes all the digits expect the middle

all (/= '0') Checks if any number is 0 

If all true returns true, if one false, returns false

--}

domino_cycle :: [(Int, Int)] -> Bool

domino_cycle [] = False
domino_cycle [(a, b)] = a == b
domino_cycle ((a, b):(c, d):xs) = b == fst (head xs) && domino_cycle ((c, d):xs ++ [(a, b)])

{--

domino_cycle [] = False Empty list

domino_cycle [(a, b)] = a == b One domino, then for it to be a cycle a must = b 

domino_cycle ((a, b):(c, d):xs) = b == fst (head xs) && domino_cycle ((c, d):xs ++ [(a, b)])

if the input has > two dominos, check if the second domino starts with the same number as the first end

if yes, call domino_cycle on the rest with the first domino at the end

if no, no cycle, False

--}



tukeys_ninther :: (Ord a, Num a) => [a] -> a
tukeys_ninther items = head items
