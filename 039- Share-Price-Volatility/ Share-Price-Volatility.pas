
import Foundation



func range(_ min:Int, _ max: Int) -> [Int] {
    var ret: [Int] = []
    for val in min...max {
        ret.append(val)
    }
    return ret
}

struct Stock {
    var symbol: String
    var prices: [Float]
    
    init(_ symbol: String, _ prices: [Float]) {
        self.symbol = symbol
        self.prices = prices
    }
}


func process() {
    

    let data = readLine()
    guard let count = Int(data!) else {
        return
    }
    
 
    //read <count> no of lines
    let inputLines: [String?] = range(1, count).map{ _ in
        readLine()
    }
    
    let parseInput = { (_ _input: String?) -> Stock in
        guard let input = _input else {
            return Stock("", [])
        }
        
        var strings = input.split(separator: " ")
        let symbol = String(strings.remove(at: 0))
        let prices = strings.map{Float($0)!}
        
        return Stock(symbol, prices)
    }
    
    let mean = { (_ f:[Float]) -> Float in f.reduce(0, +)/Float(f.count) }
    
    let findStdDeviation = { (_ floats:[Float]) -> Float in
        let avg = mean(floats)
        let distances = floats.map{pow(avg-$0,2)}
        return mean(distances)
    }
    
    let isVolatile = { (_ s:Stock) -> Bool in
        let avg = mean(s.prices)
        let brokerCommission = avg/100
        let std = findStdDeviation(s.prices)
        //print("\(s.symbol) \(avg) \(std) \(4*brokerCommission)")
        return std >= 4*brokerCommission
    }
  
    let stocks = inputLines.map(parseInput).filter(isVolatile)
    print(stocks.map{$0.symbol}.joined(separator: " "))
}


process()