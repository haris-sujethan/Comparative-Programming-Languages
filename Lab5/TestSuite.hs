module Main where
    import Test.HUnit
    import qualified Lab5
    import qualified System.Exit as Exit

    main = do
         status <- runTestTT tests
         if failures status > 0 then Exit.exitFailure else return ()
-- run tests with:
--     cabal test

-- here are some standard tests
-- you should augment them with your own tests for development purposes

    third_last = Lab5.third_last
    every_other = Lab5.every_other
    is_cyclops = Lab5.is_cyclops
    domino_cycle = Lab5.domino_cycle
    tukeys_ninther = Lab5.tukeys_ninther
    
    tests = test [
                 
      "1. [1, 2, 3]" ~: 1 ~=? third_last [1, 2, 3],
      "1. [1, 2, 3, 4]" ~: 2 ~=? third_last [1, 2, 3, 4],
      "1. [1, 2, 3, 4, 5]" ~: 3 ~=? third_last [1, 2, 3, 4, 5],
      "1. [1, 2, 3, 4, 5, 6]" ~: 4 ~=? third_last [1, 2, 3, 4, 5, 6],
      "1. [1, 2, 3, 4, 5, 6, 7]" ~: 5 ~=? third_last [1, 2, 3, 4, 5, 6, 7],
      
      "2. [1]" ~: [1] ~=? every_other [1],
      "2. [1, 2]" ~: [1] ~=? every_other [1, 2],
      "2. [1, 2, 3]" ~: [1, 3] ~=? every_other [1, 2, 3],
      "2. [1, 2, 3, 4]" ~: [1, 3] ~=? every_other [1, 2, 3, 4],
      "2. [1, 2, 3, 4, 5]" ~: [1, 3, 5] ~=? every_other [1, 2, 3, 4, 5],

      "3. 0" ~: True ~=? is_cyclops 0,
      "3. 101" ~: True ~=? is_cyclops 101,
      "3. 98053" ~: True ~=? is_cyclops 98053,
      "3. 777888999" ~: False ~=? is_cyclops 777888999,
      "3. 1056" ~: False ~=? is_cyclops 1056,
      "3. 675409820" ~: False ~=? is_cyclops 675409820,

      "4. [(3, 5), (5, 2), (2, 3)]" ~: True ~=? domino_cycle [(3, 5), (5, 2), (2, 3)],
      "4. [(4, 4)]" ~: True ~=? domino_cycle [(4, 4)],
      "4. [(2, 6)]" ~: False ~=? domino_cycle [(2, 6)],
      "4. [(5, 2), (2, 3), (4, 5)]" ~: False ~=? domino_cycle [(5, 2), (2, 3), (4, 5)],
      "4. [(4, 3), (3, 1)]" ~: False ~=? domino_cycle [(4, 3), (3, 1)],

      "5. [15]" ~: 15 ~=? tukeys_ninther [15],
      "5. [42, 7, 31]" ~: 31 ~=? tukeys_ninther [42, 7, 31],
      "5. [99, 42, 17, 7, 1, 9, 12, 77, 67]" ~: 42 ~=? tukeys_ninther [99, 42, 17, 7, 1, 9, 12, 77, 67],
      "5. [99, 42, 17, 7, 1, 9, 12, 77, 18]" ~: 18 ~=? tukeys_ninther [99, 42, 17, 7, 1, 9, 12, 77, 18]
      
      
      ]
