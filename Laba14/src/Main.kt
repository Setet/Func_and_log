import kotlin.math.abs

fun main() {
    val number = inputNumber()

    println("Sum of digits (recursion up): ${task1(number)}")

    println("Sum of digits (tail recursion): ${task2(number)}\n")

    println("Multi of digits (recursion up): ${task3_1_Up(number)}")

    println("Multi of digits (tail recursion): ${task3_1_Tail(number)}\n")

    println("Min digit (recursion up): ${task3_2_Up(number)}")

    println("Min digit (tail recursion): ${task3_2_Tail(number)}\n")

    println("Max digit (recursion up): ${task3_3_Up(number)}")

    println("Max digit (tail recursion): ${task3_3_Tail(number)}")

    println("\nSum of digits: ${task4(number, ::task1)}")
    println("Multi of digits: ${task4(number, ::task3_1_Up)}")
    println("Min digit: ${task4(number, ::task3_2_Up)}")
    println("Max digit: ${task4(number, ::task3_3_Up)}")
}

fun inputNumber(): Int {
    print("Enter the number:> ")
    val number = readLine()!!.toString()

    return try {
        number.toInt()
    }
    catch (e: NumberFormatException) {
        inputNumber()
    }
}

fun task1(number: Int): Int =
    if (number / 10 == 0)
        abs(number % 10)
    else
        task1(number / 10) + abs(number % 10)

fun task2(number: Int, sum: Int): Int =
    if (number / 10 == 0)
        sum + abs(number % 10)
    else
        task2(number / 10, sum + abs(number % 10))
fun task2(number: Int): Int =
    task2(number, 0)


// рекурсия вверх
fun task3_1_Up(number: Int): Int =
    if (number / 10 == 0)
        abs(number % 10)
    else
        task3_1_Up(number / 10) * abs(number % 10)

// хвостовая рекурсия
fun task3_1_Tail(number: Int, multi: Int): Int =
    if (number / 10 == 0)
        multi * abs(number % 10)
    else
        task3_1_Tail(number / 10, multi * abs(number % 10))
tailrec fun task3_1_Tail(number: Int): Int =
    task3_1_Tail(number, 1)

// рекурсия вверх
fun task3_2_Up(number: Int): Int {
    val newNumber = number / 10
    val digit = abs(number % 10)

    return if (newNumber != 0) {
        val min = task3_2_Up(newNumber)
        if (digit < min)
            digit
        else min
    }
    else digit
}
// хвостовая рекурсия
tailrec fun task3_2_Tail(number: Int): Int {
    fun task3_2_Tail(number: Int, min: Int): Int {
        val newNumber = number / 10
        val digit = abs(number % 10)

        val newMin =
            if (digit < min)
                digit
            else min

        return if (newNumber != 0)
            task3_2_Tail(newNumber, newMin)
        else newMin
    }
    return task3_2_Tail(number, 10)
}

// рекурсия вверх
fun task3_3_Up(number: Int): Int {
    val newNumber = number / 10
    val digit = abs(number % 10)

    return if (newNumber != 0) {
        val max = task3_3_Up(newNumber)
        if (digit > max)
            digit
        else max
    }
    else digit
}

// хвостовая рекурсия
tailrec fun task3_3_Tail(number: Int): Int {
    fun task3_3_Tail(number: Int, max: Int): Int {
        val newNumber = number / 10
        val digit = abs(number % 10)

        val newMax =
            if (digit > max)
                digit
            else max

        return if (newNumber != 0)
            task3_3_Tail(newNumber, newMax)
        else newMax
    }
    return task3_3_Tail(number, -1)
}

fun task4(number: Int, func: (number: Int) -> Int, initValue: Int = 0): Int =
    func(number)