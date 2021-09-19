# CodeAbbey #039: Share Price Volatility - Coffeescript

processStockPrices = (testCaseStr) ->
  [shareName, pricesStr...] = testCaseStr.split(' ')
  prices = pricesStr.map(Number)
  # Get price average
  priceAvg = prices.reduce((a, b) -> a + b) / prices.length
  # Get price standard deviation
  priceStdDev = Math.sqrt(prices.map((x) ->
    Math.pow(x - priceAvg, 2)).reduce((a, b) -> a + b) / prices.length)
  # Get broker comission
  comission = priceAvg * 0.01
  (priceStdDev / comission) > 4

getStockName = (stockData) ->
  stockData.split(' ')[0]

main = ->
  # Read STDIN
  data = require('fs').readFileSync(0).toString().trim().split('\n')
  # Discard number of test cases at index 0
  testCasesAsStrings = data.slice(1)
  # Process each test case
  stocks = testCasesAsStrings.filter(processStockPrices)
  results = stocks.map(getStockName)
  # Print results
  console.log(results.join(' '))

main()