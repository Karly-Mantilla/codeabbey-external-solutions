import scala.io.Source

trait BaseProblem {
  private val lines: Iterator[String] = Source.fromInputStream(System.in).getLines()

  def solve(lines: Iterator[String]): String

  def main(args: Array[String]) {
    val answer: String = solve(lines)
    println(answer)
  }
}

trait TypedInput[T] {
  def convertStringToInput(s: String): T
}

trait IndividualInputs[T] extends TypedInput[T] {
  def solveParsedInputs(n: Int, inputs: List[T]): String = {
    require(n == inputs.size, s"Expected $n inputs. Actual ${inputs.size} inputs.")
    solveInputs(inputs)
  }

  val resultSeparator: String = " "

  val filterOutBlanks: Boolean = false

  def solveInputs(inputs: List[T]): String = {
    val results: List[String] = inputs.map(solveInput).map(_.toString)

    if (filterOutBlanks) results.filterNot(_ == "").mkString(resultSeparator)
    else results.mkString(resultSeparator)
  }

  def solveInput(input: T): Any
}

object ArgumentHelper {
  implicit class SeqWrapper[T](seq: Seq[T]) {
    def toPair: (T, T) = (seq(0), seq(1))
    def toTriplet: (T, T, T) = (seq(0), seq(1), seq(2))
    def toQuartet: (T, T, T, T) = (seq(0), seq(1), seq(2), seq(3))
    def toQuintet: (T, T, T, T, T) = (seq(0), seq(1), seq(2), seq(3), seq(4))
  }

  implicit class StringWrapper(string: String) {
    def toTypedSeq[T](f: (String) => T): Seq[T] = string.split(" ").map(f)
    def toTokens: Seq[String] = toTypedSeq(s => s)
    def toPair[T](f: (String) => T): (T, T) = toTypedSeq(f).toPair
    def toTriplet[T](f: (String) => T): (T, T, T) = toTypedSeq(f).toTriplet
    def toQuartet[T](f: (String) => T): (T, T, T, T) = toTypedSeq(f).toQuartet
    def toQuintet[T](f: (String) => T): (T, T, T, T, T) = toTypedSeq(f).toQuintet
    def asList[T](f: (String) => T): List[T] = toTypedSeq(f).toList
    def asTokensList: List[String] = toTokens.toList
  }
}

object TupleHelper {
  implicit class PairWrapper[T](pair: (T, T)) {
    def map[U](f: (T) => U): (U, U) = (f(pair._1), f(pair._2))
  }

  implicit class TripletWrapper[T](triplet: (T, T, T)) {
    def map[U](f: (T) => U): (U, U, U) = (f(triplet._1), f(triplet._2), f(triplet._3))
  }
}

import ArgumentHelper._

import scala.annotation.tailrec

object Solution extends BaseProblem {
  override def solve(lines: Iterator[String]): String = {
    val n = lines.next().toInt
    val moves: List[String] = lines.next().asTokensList

    val cube = Cube()
    moves.foreach(m => {
      cube.rotate(m)
//      println(s"Making move $m\n$cube\n")
    })
    cube.faces
      .map(pair => {
        val (f, face) = pair
        (f, face.values.filter(_.isDefined))
      })
      .filter(_._2.nonEmpty)
      .flatMap(pair => {
        val (f, nums) = pair
        nums.map(_.get).map(n => (n, f))
      })
      .toList
      .sortBy(_._1)
      .map(_._2)
      .mkString(" ")
  }

  case class Cube(faces: Map[String, Face]) {
    def rotate(s: String): Unit = faces(s).rotate()

    override def toString: String = {
      val fs = faces("F").toString
      val bs = faces("B").toString
      val us = faces("U").toString
      val ds = faces("D").toString
      val ls = faces("L").toString
      val rs = faces("R").toString

      val topSection = us.split("\n").map(uline => s"        $uline").toList :+ ""
      val bottomSection = ds.split("\n").map(dline => s"        $dline").toList
      val llines = ls.split("\n")
      val flines = fs.split("\n")
      val rlines = rs.split("\n")
      val blines = bs.split("\n")
      val middleSection = llines.zip(flines.zip(rlines.zip(blines))).map(entry => {
        val (lline, (fline, (rline, bline))) = entry
        s"$lline   $fline   $rline   $bline"
      }).toList :+ ""
      (topSection ::: middleSection ::: bottomSection).mkString("\n")
    }
  }
  object Cube {
    def apply(): Cube = {
      val front = Face.frontFace()
      val back = Face("B")
      val up = Face("U")
      val down = Face("D")
      val left = Face("L")
      val right = Face("R")

      front.setNeighbors(up, down, left, right)
      back.setNeighbors(up.twist(2), down.twist(2), right, left)
      left.setNeighbors(up.twist(3), down.twist(1), back, front)
      right.setNeighbors(up.twist(1), down.twist(3), front, back)
      up.setNeighbors(back.twist(2), front, left.twist(1), right.twist(3))
      down.setNeighbors(front, back.twist(2), left.twist(3), right.twist(1))

      val faces = List(front, back, up, down, left, right)
      Cube(faces.map(f => (f.name, f)).toMap)
    }
  }

  type Triplet[T] = (T, T, T)
  implicit class QuartetHelper[T](quartet: (T, T, T, T)) {
    val first: T = quartet._1
    val second: T = quartet._2
    val third: T = quartet._3
    val fourth: T = quartet._4

    lazy val twisted: (T, T, T, T) = (fourth, first, second, third)

    @tailrec
    final def twist(n: Int): (T, T, T, T) =
      if (n == 0) quartet
      else quartet.twisted.twist(n - 1)
  }

  trait Face {
    val name: String
    val values: Array[Option[Int]]

    val triplets: (Triplet[Int], Triplet[Int], Triplet[Int], Triplet[Int]) = (
      (0, 1, 2),
      (2, 5, 8),
      (8, 7, 6),
      (6, 3, 0)
    )

    lazy val topIndexes: Triplet[Int] = triplets._1
    lazy val rightIndexes: Triplet[Int] = triplets._2
    lazy val bottomIndexes: Triplet[Int] = triplets._3
    lazy val leftIndexes: Triplet[Int] = triplets._4

    var topFace: Face = _
    var bottomFace: Face = _
    var leftFace: Face = _
    var rightFace: Face = _
    def setNeighbors(t: Face, b: Face, l: Face, r: Face): Unit = {
      topFace = t
      bottomFace = b
      leftFace = l
      rightFace = r
    }

    def topValues: Triplet[Option[Int]] = getTriplet(topIndexes)
    def rightValues: Triplet[Option[Int]] = getTriplet(rightIndexes)
    def bottomValues: Triplet[Option[Int]] = getTriplet(bottomIndexes)
    def leftValues: Triplet[Option[Int]] = getTriplet(leftIndexes)
    private def getTriplet(indexes: Triplet[Int]): Triplet[Option[Int]] = {
      val (i, j, k) = indexes
      (values(i), values(j), values(k))
    }

    def replaceTopValues(v: Triplet[Option[Int]]): Unit = replaceTriplet(topIndexes, v)
    def replaceRightValues(v: Triplet[Option[Int]]): Unit = replaceTriplet(rightIndexes, v)
    def replaceBottomValues(v: Triplet[Option[Int]]): Unit = replaceTriplet(bottomIndexes, v)
    def replaceLeftValues(v: Triplet[Option[Int]]): Unit = replaceTriplet(leftIndexes, v)
    def replaceTriplet(indexes: Triplet[Int], v: Triplet[Option[Int]]): Unit = {
      val (i, j, k) = indexes
      val (vi, vj, vk) = v
      values(i) = vi
      values(j) = vj
      values(k) = vk
    }

    def twist(n: Int): Face = TwistedFace(this, n)

    def rotate(): Unit = {
      val tv = topValues
      val rv = rightValues
      val bv = bottomValues
      val lv = leftValues

      replaceTopValues(lv)
      replaceRightValues(tv)
      replaceBottomValues(rv)
      replaceLeftValues(bv)

      val tfv = topFace.bottomValues
      val rfv = rightFace.leftValues
      val bfv = bottomFace.topValues
      val lfv = leftFace.rightValues

      topFace.replaceBottomValues(lfv)
      rightFace.replaceLeftValues(tfv)
      bottomFace.replaceTopValues(rfv)
      leftFace.replaceRightValues(bfv)
    }

    override def toString: String = values.grouped(3).map(row => row.map(_.string).mkString(" ")).mkString("\n")
  }
  case class RegularFace(override val values: Array[Option[Int]], override val name: String) extends Face

  case class TwistedFace(face: Face, twists: Int) extends Face {
    override val name: String = face.name
    override val values: Array[Option[Int]] = face.values

    override val triplets: (Triplet[Int], Triplet[Int], Triplet[Int], Triplet[Int]) = face.triplets.twist(twists)
  }
  object Face {
    def apply(name: String): Face = RegularFace(Array.fill(9)(None), name)
    def frontFace(): Face = RegularFace(List(7, 8, 9, 4, 5, 6, 1, 2, 3).map(n => Some(n)).toArray, "F")
  }


  implicit class OptionIntHelper(n: Option[Int]) {
    def string: String = if (n.nonEmpty) n.get.toString else "."
  }
}