import java.io.File
import kotlin.random.Random

fun main() {
     //val array: Array<Int> = inputArrayByConsole()
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
    print("Вводите список (в одну строку, через пробел)\n>: ")

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

fun task9(size: Int): Pair<List<Double>, Set<Double>> {
    val list = List(size) { Random.nextDouble() }
    return Pair(list, list.toSet())
}