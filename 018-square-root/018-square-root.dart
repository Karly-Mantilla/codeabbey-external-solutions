import 'dart:io';

void main() {
  var file = File("C:\\Users\\Ahmet\\code_abbey\\problem27\\problem27.txt");
  List<String> txtInputs = file.readAsLinesSync();

  for (var i = 0; i <= txtInputs.length; i++) {
    if (i == txtInputs.length) {
      break;
    } else {
      String a = txtInputs.elementAt(i);
      List<String> b = a.split(' ').toList();
      List<int> listOfNumbers = b.map((e) => int.parse(e)).toList();
      double r = 1.0;
      for (var i = 0; i <= listOfNumbers.last; i++) {
        if (i == listOfNumbers.last) {
          break;
        } else {
          double d = listOfNumbers.first.toDouble() / r;
          d.abs();
          r = (r + d) / 2.0;
        }
      }
      print(r.toStringAsFixed(7));
    }
  }
}