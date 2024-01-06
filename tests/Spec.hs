import Utils
import Test.HUnit
import qualified System.Exit as Exit

isSorted_test1 :: Test
isSorted_test1 = TestCase (assertEqual "Should be True..." True (isSorted [2, 3, 4, 5, 6, 8, 10]))

isSorted_test2 :: Test
isSorted_test2 = TestCase (assertEqual "Should be False..." False (isSorted [2, 3, 4, 7, 5, 8, 10]))

sasb1 :: Test
sasb1 = TestCase (assertEqual "Should be [1, 2, 3, 4, 5, 6, 7, 8, 10]..." [1, 2, 3, 4, 5, 6, 7, 8, 10] (sasb [2, 1, 3, 4, 5, 6, 7, 8, 10]))

sasb2 :: Test
sasb2 = TestCase (assertEqual "Should be [4, 2]..." [4, 2] (sasb [2, 4]))

rarb1 :: Test
rarb1 = TestCase (assertEqual "Should be [2, 3, 4, 1]" [2, 3, 4, 1] (rarb [1, 2, 3, 4]))

rarb2 :: Test
rarb2 = TestCase (assertEqual "Should be [2, 3, 4, 5]" [4, 5, 2, 3] (rarb [3, 4, 5, 2]))

rrarrb1 :: Test
rrarrb1 = TestCase (assertEqual "Should be [2, 3, 4, 5]" [2, 3, 4, 5] (rrarrb [3, 4, 5, 2]))

rrarrb2 :: Test
rrarrb2 = TestCase (assertEqual "Should be [2, 8, 6, 1]" [2, 8, 6, 1] (rrarrb [8, 6, 1, 2]))

tests :: Test
tests = TestList [TestLabel "Test 1 on isSorted function: " isSorted_test1,
    TestLabel "Test 2 on isSorted function: " isSorted_test2,
    TestLabel "Test 1 on sasb function: " sasb1,
    TestLabel "Test 2 on sasb function: " sasb2,
    TestLabel "Test 1 on rarb function: " rarb1,
    TestLabel "Test 2 on rarb function: " rarb2,
    TestLabel "Test 1 on rrarrb function: " rrarrb1]

main :: IO ()
main = do
    result <- runTestTT tests
    if failures result > 0 then Exit.exitFailure else Exit.exitSuccess