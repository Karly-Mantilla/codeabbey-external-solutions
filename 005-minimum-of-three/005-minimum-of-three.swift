let arrayArray: [Int] = [
-6019965, 9333656, -3706524,
6351837, -1887890, -1578996,
-8303841, -870580, 2215239,
-5023927, 6481124, -3444784,
4128095, 1620101, 752653,
2301778, -4456116, 2843975,
6986788, -7416419, -7882253,
1408684, -3962765, -7749039,
-942117, 6595674, -752705,
2823407, -7588746, -6937942,
-8385699, -3608712, -7604286,
-2092224, -7256874, 507823,
6328779, -5560715, 9637243,
-1455981, -584643, 6118367,
5099234, -6456548, -2261531,
-4148112, 5845230, 3282353,
8695862, 2832018, 5865933,
-9186390, -5759298, -8096832,
-6935430, 3298584, 8498841,
2311865, -3878008, -9089905,
5373923, -2263708, -2698617,
7769637, 5644067, 44508,
-1722540, 1972846, 4483792,
-2085296, -9483135, -6100850
]

var array1: [Int] = []
var array2: [Int] = []
var array3: [Int] = []

var n1 = 0
var n = 0

while n1 < arrayArray.count {
    if n == 0 {
        array1.append(arrayArray[n1])
        n = n + 1
    } else if n == 1 {
        array2.append(arrayArray[n1])
        n = n + 1
    } else if n == 2 {
        array3.append(arrayArray[n1])
        n = 0
    }
    n1 = n1 + 1
}

//print(array1)
//print(array2)
//print(array3)

var array4: [Int] = []
var n2 = 0

while n2 < array1.count {
    if array1[n2] < array2[n2] {
        array4.append(array1[n2])
    } else if array2[n2] < array3[n2] {
        array4.append(array2[n2])
    } else {
        array4.append(array3[n2])
    }
    n2 = n2 + 1
}
print(array4)