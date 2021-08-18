# CodeAbbey #128: Combinations Counting - Coffeescript

factorial = (x) ->
  if x is 0 then 1
  else factorial(x - 1) * x

# Returns the formatted result
processTestCase = (testCaseStr) ->
  # Parse to numbers
  numbersArr = testCaseStr.split(' ').map(Number)
  # Get n and k by Destructuring assignment
  [n, k] = numbersArr
  # Return combinations
  Math.round(factorial(n) / (factorial(k) * factorial(n - k)))

main = ->
  # Read STDIN
  data = require('fs').readFileSync(0).toString().trim().split('\n')
  # Discard number of test cases at index 0
  testCasesAsStrings = data.slice(1)
  # Process each test case
  results = testCasesAsStrings.map(processTestCase)
  # Print results
  console.log(results.join(' '))
  return

main()