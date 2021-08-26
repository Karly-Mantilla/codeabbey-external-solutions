/*
# Lint
$ ktlint --experimental --verbose --disabled_rules=experimental:indent,indent \
> nickkar.ky
# Compile
$ kotlinc -Werror nickkar.kt -include-runtime -d nickkar.jar
*/

// reads the input and puts it in a readable array
fun read_input(
    num_test: Int,
    index: Int = 0,
    test_cases: Array<LongArray> = emptyArray()
): Array<LongArray> {
  if (index == num_test) {
    return (test_cases)
  } else {
    val (a, b, c) = readLine()!!.split(' ').map(String::toLong)
    val values: LongArray = longArrayOf(a, b, c)
    val tmp = test_cases.plus(values)
    return (read_input(num_test, index + 1, tmp))
  }
}

// returns a vector with the representation of the number in binary
fun to_bin (num: Long, outt: Array<Long> = emptyArray()): Array<Long> {
  if (num == 0L) {
    return(outt)
  }
  else {
    val newnum = num / 2
    val res = num % 2
    return(to_bin(newnum, outt.plus(res)))
  }
}

// finds the modular exponetiation for powers of 2
fun mod_exp_pow2 (base: Long, pow: Long, m0d: Long,
    count: Long = (base % m0d).toLong(), powcount: Long = 1): Long {
  if(pow == 0L){
    return((1 % m0d).toLong())
  }
  if(powcount == pow) {
    return(count)
  }
  else {
    val newcount = ((count % m0d) * (count % m0d)) % m0d
    return(mod_exp_pow2(base, pow, m0d, newcount, powcount * 2))
  }
}

// decompose the power into powers of 2 and applies modular properties to get
// the result
fun mod_exp(base: Long, pow: Long, m0d: Long, index: Int = 0,
    powbin: Array<Long> = to_bin(pow), modcount: Long = 1
    ): Long {
  if(index == powbin.size) {
    return(modcount)
  }
  else {
    if(powbin.get(index) == 1L){
      val power = (Math.pow(2.0, index.toDouble())).toLong()
      val newmod = mod_exp_pow2(base, power, m0d)
      val newmodcount = (modcount * newmod) % m0d
      return(mod_exp(base, pow, m0d, index + 1, powbin, newmodcount))
    }
    else {
      return(mod_exp(base, pow, m0d, index + 1, powbin, modcount))
    }
  }
}

// iterates over every test-case
fun solve_cases(
    num_test: Int,
    test_cases: Array<LongArray>,
    index: Int = 0,
    outt: Array<Long> = emptyArray()
): Array<Long> {
  if (index == num_test) {
    return outt
  } else {
    val (base, pow, m0d) = test_cases[index]
    val powmod = mod_exp(base, pow, m0d)
    val tmp = outt.plus(powmod)
    return(solve_cases(num_test, test_cases, index + 1, tmp))
  }
}

// driver code
fun main() {
  val num_test = readLine()!!.toInt()
  val test_cases = read_input(num_test)
  val outt = solve_cases(num_test, test_cases)
  println(outt.joinToString(" "))
}

/*
$ cat DATA.lst | java -jar nickkar.jar
10594023 211939547 55545729 2832713 56271383 178407083 58669467 22271111
82003049 47973142 109455420 230060344 163697559 200585365 160550707 293986818
159584647 202895490 215033073 154766909 26071892 135793813 66955167
*/