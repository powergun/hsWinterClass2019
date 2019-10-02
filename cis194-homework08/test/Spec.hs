
import           Exercise1Test
import           Exercise2Test
import           Exercise5Test

main :: IO ()
main = do
  Exercise1Test.runTest
  Exercise2Test.runTest
  Exercise5Test.runTest
