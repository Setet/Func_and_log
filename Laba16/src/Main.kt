import java.io.File
import java.util.zip.DataFormatException

fun main() {
    //print("Ваша строка: ")
    //val s = readLine()!!.toString()

    //1
    //task1()

    //2
    //task2_launchMenu()

    //3
    //val text = File("кек.txt").readText()
    //println("Даты записанны в файл 'кек.txt'):\n")
    //outputList<String>(findDates(text),"\n")

    //4
    //task4_launchMenu()

    //5
    //val listOfStrings = File("Задание5.txt").readText().split("\n")
    //println("Строка из файла:\n")
    //outputList<String>(listOfStrings, "\n")
    //println("Отсортированные строки:")
    //outputList<String>(sortStringsByLength(listOfStrings), "\n")

    //6
    //val listOfStrings = File("Задание6.txt").readText().split("\n")
    //println("Строка из файла:\n")
    //outputList<String>(listOfStrings, "\n")
    //val sortedListOfStrings = sortStringsByNumberOfWords(listOfStrings)
    //println("\nОтсортированные строки:\n")
    //outputList<String>(sortedListOfStrings, "\n")
}

fun<T> outputList(list: List<T>, separator: String) {
    tailrec fun<T> outputList(it: Iterator<T>, separator: String) {
        if (it.hasNext()) {
            print("${it.next()}${separator}")
            outputList(it, separator)
        }
    }
    outputList(list.iterator(), separator)
}

fun task1() {
    print("Ваша строка: ")
    val s = readLine()

    try {
        val listNumbers = s!!.split(" ").map { it.toInt() }
        println("Max: ${listNumbers.maxOrNull()}")

    }
    catch(e: NumberFormatException) {
        println("Ошибка!!!: ${e.message}.\n")
        task1()
    }
}

fun task2_launchMenu() {
    println("Какую задачу вы хотите выполнить? \n")
    println("1. Миксануть символы во всех словах,кроме певрого/последнего")
    println("2. Цифры в начало строки,буквы в конец")
    print(">: ")

    when(readLine()) {
        "1" -> {
            print("\nААААААА я даже на прологе это не сделал!")
        }
        "2" -> {
            print("\nААААААА я даже на прологе это не сделал!")
        }
        else -> println("Тут всего 2 задания,как ты промахнулся?")
    }

    println()
    task2_launchMenu()
}

fun findDates(s: String): List<String> {
    fun numberOfDays(month: String, year: Int): Int =
        when {
            (month == "января") -> 31
            (month == "февраля") && (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0)) -> 29
            (month == "февраля") -> 28
            (month == "марта") -> 31
            (month == "апреля") -> 30
            (month == "мая") -> 31
            (month == "июня") -> 30
            (month == "июля") -> 31
            (month == "августа") -> 31
            (month == "сентября") -> 30
            (month == "октября") -> 31
            (month == "ноября") -> 30
            (month == "декабря") -> 31
            else -> throw DataFormatException("Month isn't in range from 1 to 12")
        }

    // чтобы убрать 2 лишнии проверки из regex,
    // которые увеличивают количество проверок в 2 (!) раза
    val text = " $s "

    // диапазон дней: 1 - 31
    val checkingDay = "(([1-9])|([1-2][0-9])|(3[0-1]))"

    val months = listOf(
        "декабря", "января", "февраля",
        "марта", "апреля", "мая",
        "июня", "июля", "августа",
        "сентября", "октября", "ноября"
    )
    val checkingMonth = "(${months.joinToString("|")})"

    // диапазон лет: 1000 - 2021
    val checkingYear = "((1[0-9]{3})|(20[0-1][0-9])|(202[0-1]))"

    // """ - не нужно экранирование
    val regexDates = """\s${checkingDay}\s${checkingMonth}\s${checkingYear}\s""".toRegex()

    // список дат, распарсенных на число, месяц и год
    val listOfDates1 = regexDates.findAll(text).map { it.value.drop(1).dropLast(1).split(" ") }.toList()

    // оставляет только корректные даты
    // например, не может быть 31 сентября (в этом месяце только 30 дней)
    val listOfDates2 = listOfDates1.filter { it[0].toInt() <= numberOfDays(it[1], it[2].toInt())}

    // поскольку дальше ничего с этими датами делать не нужно
    // возвращаем в удобном виде List<String>, а не List<List<String>>
    return listOfDates2.map { it.joinToString(" ") }
}

fun numberMoreFive(s: String): Int {
    val charactersCode = s.toCharArray().map { it.toInt() }
    return charactersCode.count { ((it >= 54) && (it <= 57)) }
}

fun task4_launchMenu() {
    println("Какую задачу вы хотите выполнить? \n")
    println("1. Посчитать кол-во чисел больше 5")
    println("2. Найти те буквы кириллицы которые не задействаны")
    print(">: ")

    val listTaskNumbers = listOf("1", "2",)
    val choice = readLine()

    val s = if (listTaskNumbers.contains(choice)) {
        print("\nВаша строка: ")
        readLine()!!.toString()
    }
    else ""

    when(choice) {
        "1" -> println("Кол-во чисел больше 5 : ${numberMoreFive(s)}")
        "2" -> println("Буквы кириллицы которые не задействованы : нет пока")
        }

    println()
    task4_launchMenu()
}

fun sortStringsByLength(listOfStrings: List<String>): List<String> {
    return listOfStrings.sortedBy { it -> it.length }
}

fun sortStringsByNumberOfWords(listOfStrings: List<String>): List<String> {
    val regexSpaces = "\\s{2,}".toRegex()

    val listOfStrings2 = listOfStrings.map { it ->
        regexSpaces.replace(it, " ").dropWhile { it == ' ' }.dropLastWhile { it == ' ' } }

    val result = listOfStrings.withIndex().sortedBy { it -> listOfStrings2[it.index].split(" ").size }
    return result.map { it -> it.value }
}