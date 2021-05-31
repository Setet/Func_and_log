import java.io.File
import kotlin.random.Random

fun main() {
     val array: Array<Int> = inputArrayByConsole()
     //val list = inputListByConsole()
     //println()

    //1-2
    // println("Min: ${min(array)}")
    // println("Max: ${max(array)}")
    //println("Sum: ${sum(array)}")
    //println("Multi: ${multi(array)}")

    //3
    //val array = inputArray()
    //print("\nВаш массив: ")
    //outputArray<Int>(array)

    //4(9, 10, 21, 23, 33, 36, 39, 45, 57)

    //9
    println("Элементы перед последним минимумом:")
    outputArray<Int>(task4_9(array))

    //10
    val array1: Array<Int> = inputArrayByConsole()
    val array2: Array<Int> = inputArrayByConsole()
    println("\nКоличество совпадающих пар: ${task4_10(array1, array2)}")

    //21
    println("Элементы после последнего максимума:")
    outputArray<Int>(task4_21(array))

    //23
    try {
    val mins = task4_23(array)
          println("Два наименьших элемента: ${mins.first}, ${mins.second}")
      }
      catch(e: IllegalArgumentException) {
          println("Ощибочка: ${e.message}")
      }

    //33
      if (task4_33(array))
         println("Чередуются (+/-).")
      else
          println("Не чередуются (+/-).")


    //36
      try {
          println("Максимальный нечётный элем: ${task4_36(array)}")
      }
      catch (e: IllegalArgumentException) {
          println("Ошибочка: ${e.message}")
      }

    //39
      val resultArrays = task4_39(array)
      print("Элементы с четным индексом: ")
      outputArray<Int>(resultArrays.first)
      print("\nЭлементы с нечетным индексом: ")
      outputArray<Int>(resultArrays.second)
      println()

    //45
      try {
          println("Нумерация начинается с 0")
          print("Введите a (начало интервала): ")
          val a = readLine()!!.toInt()
          print("Введите b (конец интервала): ")
          val b = readLine()!!.toInt()
          println("\nСумма интервала: ${task4_45(array, a, b)}")
     }
     catch(e: IllegalArgumentException) {
           println("\nОшибочка: ${e.message}")
    }

    //57
    println("Количество совпадающих элементов: ${task4_57(array)}")

    //5
    //println("Min: ${min(list)}")
    //println("Max: ${max(list)}")
    //println("Sum: ${sum(list)}")
    //println("Multi: ${multi(list)}")

    //6
    //println("Min: ${list.minOrNull()}")
    //println("Max: ${list.maxOrNull()}")
    //println("Sum: ${list.sum()}")
    //println("Multi: ${list.reduce { acc, i -> acc * i }}")

    //7
    //val list = inputList()
    //print("\nВаш спискок: ")
    //outputList<Int>(list)

    //8
    //там где функции,ниже линии отсечения
    //мне просто очень лень их рассписывать как в 4

    //9
    //val collections = task9(10000000)
    //val list = collections.first
    //val set = collections.second
    //print("Список/Множество: ")
    //outputList(collections.first)

    //10
    //val listTime = measureTimeMillis {
    //    list.minOrNull()
    //}
    //println("Время для списка: $listTime")

    //val setTime = measureTimeMillis {
    //set.minOrNull()
    //}
    //println("Время для множества: $setTime")
}
// вывод массива
fun<T> outputArray(array: Array<T>) {
    print("${array.joinToString(" ")}")
}

// вывод списка
fun<T> outputList(list: List<T>) {
    print("${list.joinToString(" ")}")
}

fun inputListByConsole(): List<Int> {
    print("\nВводите список (в одну строку, через пробел)\n>: ")

    return try {
        readLine()!!.split(" ").map { it.toInt() }
    }
    catch(e: NumberFormatException) {
        println()
        inputListByConsole()
    }
}

fun inputArrayByConsole(): Array<Int> {
    print("Вводите список (в одну строку, через пробел)\n>: ")

    return try {
        readLine()!!.split(" ").map { it.toInt() }.toTypedArray()
    }
    catch(e: NumberFormatException) {
        println()
        inputArrayByConsole()
    }
}

fun inputArrayByFile(path: String = "Для массива.txt"): Array<Int> =
    try {
        File(path).readText().split(" ").map { it.toInt() }.toTypedArray()
    }
    catch(e: NullPointerException) { throw e }
    catch(e: java.io.FileNotFoundException) { throw e }
    catch(e: NumberFormatException) { throw e }

fun inputArrayByFileV2(): Array<Int> =
    try {
        File("Для массива.txt").readText().split(" ").map { it.toInt() }.toTypedArray()
    }
    catch(e: NullPointerException) { throw e }
    catch(e: java.io.FileNotFoundException) { throw e }
    catch(e: NumberFormatException) { throw e }

fun inputListByFile(path: String = "Для списка.txt"): List<Int> =
    try {
        File(path).readText().split(" ").map { it.toInt() }
    }
    catch(e: NullPointerException) { throw e }
    catch(e: java.io.FileNotFoundException) { throw e }
    catch(e: NumberFormatException) { throw e }

fun inputListByFileV2(): List<Int> =
    try {
        File("Для списка.txt").readText().split(" ").map { it.toInt() }
    }
    catch(e: NullPointerException) { throw e }
    catch(e: java.io.FileNotFoundException) { throw e }
    catch(e: NumberFormatException) { throw e }

fun selectArrayInputMethod(): () -> Array<Int> {
    println("Как вы хотите ввести массив?")
    println("1. Через консоль")
    println("2. Через файл\n")
    print(">: ")

    return when(readLine()) {
        "1" -> {
            println()
            ::inputArrayByConsole
        }
        "2" -> ::inputArrayByFileV2
        else -> {
            println("Ты шо написал?!\n")
            selectArrayInputMethod()
        }
    }
}

fun inputArray(): Array<Int> {
    return try {
        selectArrayInputMethod()()
    }
    catch(e: Exception) {
        when(e) {
            is NullPointerException, is java.io.FileNotFoundException -> {
                println("\nОшибочка: ${e.message}!\n")
                inputArray()
            }
            is NumberFormatException -> {
                println("\nОшибочка: ${e.message}\n")
                inputArray()
            }
            else -> throw e
        }
    }
}

fun selectListInputMethod(): () -> List<Int> {
    println("Как вы хотите ввести список?")
    println("1. Через консоль")
    println("2. Через файл\n")
    print(">: ")

    return when(readLine()) {
        "1" -> {
            println()
            ::inputListByConsole
        }
        "2" -> ::inputListByFileV2
        else -> {
            println("Ты шо написал?!\n")
            selectListInputMethod()
        }
    }
}

fun inputList(): List<Int> {
    return try {
        selectListInputMethod()()
    }
    catch(e: Exception) {
        when(e) {
            is NullPointerException, is java.io.FileNotFoundException -> {
                println("\nОшибочка: ${e.message}\n")
                inputList()
            }
            is NumberFormatException -> {
                println("\nОшибочка: ${e.message}\n")
                inputList()
            }
            else -> throw e
        }
    }
}

tailrec fun arrayOp(array: Iterator<Int>, f : (Int, Int) -> Int, accum: Int = 0): Int =
    if (array.hasNext())
        arrayOp(array, f, f(array.next(), accum))
    else accum

fun min(array: Array<Int>): Int =
    arrayOp(array.iterator(), { a: Int, b: Int -> if (a < b) a else b}, array.first())

fun max(array: Array<Int>): Int =
    arrayOp(array.iterator(), { a: Int, b: Int -> if (a > b) a else b}, array.first())

fun sum(array: Array<Int>): Int =
    arrayOp(array.iterator(), { a: Int, b: Int -> a + b})

fun multi(array: Array<Int>): Int =
    arrayOp(array.iterator(), { a: Int, b: Int -> a * b}, 1)

fun min(array: List<Int>): Int =
    arrayOp(array.iterator(), { a: Int, b: Int -> if (a < b) a else b}, array.first())

fun max(array: List<Int>): Int =
    arrayOp(array.iterator(), { a: Int, b: Int -> if (a > b) a else b}, array.first())

fun sum(array: List<Int>): Int =
    arrayOp(array.iterator(), { a: Int, b: Int -> a + b})

fun multi(array: List<Int>): Int =
    arrayOp(array.iterator(), { a: Int, b: Int -> a * b}, 1)

fun task4_9(array: Array<Int>): Array<Int> {
    val min = min(array)
    val lastIndexMin = array.indexOfLast { it == min }

    return array.filterIndexed { index, _ -> index < lastIndexMin }.toTypedArray()
}

fun task4_10(array1: Array<Int>, array2: Array<Int>): Int {
    fun contains(value1: Int, value2: Int, index2: Int, indexAvailability2: Array<Boolean>): Boolean {
        return if (value1 == value2 && indexAvailability2[index2]) {
            indexAvailability2[index2] = false
            true
        }
        else false
    }

    val indexAvailability2 = Array(array2.size) { true }
    val arrayIndexed2 = array2.withIndex()

    return array1.count { value1 -> arrayIndexed2.any { (index2, value2) -> contains(value1, value2, index2, indexAvailability2) } }
}

fun task4_21(array: Array<Int>): Array<Int> {
    val max = max(array)
    val firstIndexMax = array.indexOfFirst { it == max }

    return array.filterIndexed { index, _ -> index > firstIndexMax }.toTypedArray()
}

fun task4_23(array: Array<Int>): Pair<Int, Int> {
    tailrec fun task4_23(it: Iterator<Int>, f: (Int, Int, Int) -> Pair<Int, Int>, mins: Pair<Int, Int>): Pair<Int, Int> =
        if (it.hasNext())
            task4_23(it, f, f(it.next(), mins.first, mins.second))
        else mins

    if (array.size < 2)
        throw IllegalArgumentException("Incorrect array size")

    val f = { a: Int, b: Int, c: Int ->
        when {
            (a < b) -> Pair(a, b)
            (a < c) -> Pair(b, a)
            else -> Pair(b, c)
        }
    }

    val currentMins =
        if (array[0] <= array[1])
            Pair(array[0], array[1])
        else
            Pair(array[1], array[0])

    val it = array.iterator()
    it.next()
    it.next()

    return task4_23(it, f, currentMins)
}

fun task4_33(array: Array<Int>): Boolean {
    fun task4_33(it: Iterator<Int>, f: (Int) -> Boolean, flag: Boolean): Boolean =
        if (it.hasNext()) {
            if (flag != f(it.next()))
                task4_33(it, f, !flag)
            else false
        }
        else true

    val f = { element: Int -> element < 0 }
    val flag = f(array[0])

    return task4_33(array.iterator(), f, !flag)
}

fun task4_36(array: Array<Int>): Int {
    fun task4_36(it: Iterator<Int>, f: (Int, Int) -> Int, max: Int): Int =
        if (it.hasNext())
            task4_36(it, f, f(it.next(), max))
        else max

    val f = { a: Int, b: Int -> if (a > b && a % 2 != 0) a else b }
    val result = task4_36(array.iterator(), f, array[0])

    if (result % 2 == 0)
        throw IllegalArgumentException("Array contains only even elements")

    return result
}

fun task4_39(array: Array<Int>): Pair<Array<Int>, Array<Int>> =
    Pair(array.filterIndexed { i, _ -> i % 2 == 0 }.toTypedArray(),
        array.filterIndexed { i, _ -> i % 2 != 0 }.toTypedArray())

fun task4_45(array: Array<Int>, a: Int, b: Int): Int {
    if ((a < 0) || (b < 0) || (a >= b) || (a >= array.size) || (b >= array.size))
        throw IllegalArgumentException("Incorrect interval")

    return sum(array.filterIndexed { i, _ -> (i > a) && (i < b) }.toTypedArray())
}

fun task4_57(array: Array<Int>): Int {
    fun sumBeforeIndex(array: Array<Int>, endIndex: Int): Int =
        sum(array.filterIndexed { i, _ -> i < endIndex }.toTypedArray())

    return array.withIndex().count { element -> element.value > sumBeforeIndex(array, element.index) } - 1
}

//--------------------------------------------------------------------------->

fun task4_9(list: List<Int>): List<Int> {
    val min = min(list)
    val lastIndexMin = list.indexOfLast { it == min }

    return list.filterIndexed { index, _ -> index < lastIndexMin }
}

fun task4_10(list1: List<Int>, list2: List<Int>): Int {
    fun contains(value1: Int, value2: Int, index2: Int, indexAvailability2: MutableList<Boolean>): Boolean {
        return if (value1 == value2 && indexAvailability2[index2]) {
            indexAvailability2[index2] = false
            true
        }
        else false
    }

    val indexAvailability2 = MutableList(list2.size) { true }
    val arrayIndexed2 = list2.withIndex()

    return list1.count { value1 -> arrayIndexed2.any { (index2, value2) -> contains(value1, value2, index2, indexAvailability2) } }
}

fun task4_21(list: List<Int>): List<Int> {
    val max = max(list)
    val firstIndexMax = list.indexOfFirst { it == max }

    return list.filterIndexed { index, _ -> index > firstIndexMax }
}

fun task4_23(list: List<Int>): Pair<Int, Int> {
    tailrec fun task4_23(it: Iterator<Int>, f: (Int, Int, Int) -> Pair<Int, Int>, mins: Pair<Int, Int>): Pair<Int, Int> =
        if (it.hasNext())
            task4_23(it, f, f(it.next(), mins.first, mins.second))
        else mins

    if (list.size < 2)
        throw IllegalArgumentException("Incorrect list size")

    val f = { a: Int, b: Int, c: Int ->
        when {
            (a < b) -> Pair(a, b)
            (a < c) -> Pair(b, a)
            else -> Pair(b, c)
        }
    }

    val currentMins =
        if (list[0] <= list[1])
            Pair(list[0], list[1])
        else
            Pair(list[1], list[0])

    val it = list.iterator()
    it.next()
    it.next()

    return task4_23(it, f, currentMins)
}

fun task4_33(list: List<Int>): Boolean {
    fun task4_33(it: Iterator<Int>, f: (Int) -> Boolean, flag: Boolean): Boolean =
        if (it.hasNext()) {
            if (flag != f(it.next()))
                task4_33(it, f, !flag)
            else false
        }
        else true

    val f = { element: Int -> element < 0 }
    val flag = f(list[0])

    return task4_33(list.iterator(), f, !flag)
}

fun task4_36(list: List<Int>): Int {
    fun task4_36(it: Iterator<Int>, f: (Int, Int) -> Int, max: Int): Int =
        if (it.hasNext())
            task4_36(it, f, f(it.next(), max))
        else max

    val f = { a: Int, b: Int -> if (a > b && a % 2 != 0) a else b }
    val result = task4_36(list.iterator(), f, list[0])

    if (result % 2 == 0)
        throw IllegalArgumentException("List contains only even elements")

    return result
}

fun task4_39(list: List<Int>): Pair<List<Int>, List<Int>> =
    Pair(list.filterIndexed { i, _ -> i % 2 == 0 },
        list.filterIndexed { i, _ -> i % 2 != 0 })

fun task4_45(list: List<Int>, a: Int, b: Int): Int {
    if ((a < 0) || (b < 0) || (a >= b) || (a >= list.size) || (b >= list.size))
        throw IllegalArgumentException("Incorrect interval")

    return sum(list.filterIndexed { i, _ -> (i > a) && (i < b) })
}

fun task4_57(list: List<Int>): Int {
    fun sumBeforeIndex(list: List<Int>, endIndex: Int): Int =
        sum(list.filterIndexed { i, _ -> i < endIndex })

    return list.withIndex().count { element -> element.value > sumBeforeIndex(list, element.index) } - 1
}

fun task9(size: Int): Pair<List<Double>, Set<Double>> {
    val list = List(size) { Random.nextDouble() }
    return Pair(list, list.toSet())
}