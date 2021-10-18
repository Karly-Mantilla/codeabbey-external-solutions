func treeHeightMeasurement() {
    var numOfInput int
    fmt.Scanf("%d\n", &numOfInput)
    for i := 0; i < numOfInput; i++ {
        var d, b float64
        fmt.Scanf("%f %f\n", &d, &b)
        fmt.Print(int(math.Round(d*math.Tan((b-90.0)*math.Pi/180))), " ")
    }
}