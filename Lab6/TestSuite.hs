module Main where
    import Test.HUnit
    import qualified Lab6
    import qualified System.Exit as Exit

    main = do
         status <- runTestTT tests
         if failures status > 0 then Exit.exitFailure else return ()
-- run tests with:
--     cabal test

-- here are some simple tests
-- you should augment them with your own tests for development purposes
   
    tests = test [
          
      "1. DigitalTime show()" ~: "<12:59:59>" ~=? (show $ Lab6.DigitalTime (12, 59, 59)),
      "1. DigitalTime (==)" ~: False ~=? (Lab6.DigitalTime (12, 59, 59) == Lab6.DigitalTime (11, 58, 58)),
      "1. DigitalTime (<=)" ~: True ~=? (Lab6.DigitalTime (12, 59, 58) <= Lab6.DigitalTime (12, 59, 59)),
      "1. DigitalTime (+)" ~: Lab6.DigitalTime (5, 5, 5) ~=? (Lab6.DigitalTime (2, 2, 2) + Lab6.DigitalTime (3, 3, 3))
      
      ]
