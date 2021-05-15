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

    // 1-ый пример: считает сумму цифр, если каждая из них больше 6
    task5(number, ::task2, ::checkDigits1)

    //2-ой пример: считает произведение цифр, если каждая из них меньше 6
    task5(number, ::task3_1_Tail, ::checkDigits2, 0)

    // 3-ий пример: считает произведение цифр, если каждая из них равна 5
    task5(number, ::task3_1_Tail, ::checkDigits3, 1)

    try {
        // task 7.1
        println("Max prime divisor of number: ${maxPrimeDivisor(number)}")
        // task 7.2
        println("Multi of digits not divisible by 5: ${multDigitsNotDivBy(number, 5)}")
        // task 7.3
        println("\nMax odd not prime divisor of number: ${maxOddNotPrimeDiv(number)}")
        println("Multi of digits: ${task3_1_Up(number)}")
        println("\nTheir GCD: ${task7_3(number)}")
    } catch (e: ArithmeticException) {
        println("\nError: ${e.message}!")
    }

    //Menu(number)
    println("Sum fact : ${factorialDigitSum(number)}")
}

fun factorial(num: Int,res:Int): Int =
    if(num>=2)
    {
        factorial(num-1,res*num)
    }
    else res

fun factorialDigitSum(number: Int) =
    task2(factorial(number,1),0)

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
tailrec fun task2(number: Int): Int =
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

fun task5(number: Int, funCalc: (number: Int, value: Int) -> Int, funCondition: (number: Int) -> Boolean, initValue: Int = 0)
{
    if (funCondition(number)) {
        println("Result Function: ${funCalc(number, initValue)}")
    }
    else {
        println("The number does not meet the condition!!!")
    }
}

fun checkDigits1(number: Int): Boolean =
    if (number % 10 > 6) {
        if (number / 10 == 0)
            true
        else
            checkDigits1(number / 10)
    }
    else false

fun checkDigits2(number: Int): Boolean =
    if (number % 10 < 6) {
        if (number / 10 == 0)
            true
        else
            checkDigits2(number / 10)
    }
    else false

fun checkDigits3(number: Int): Boolean =
    if (number % 10 == 5) {
        if (number / 10 == 0)
            true
        else
            checkDigits2(number / 10)
    }
    else false

// task 7.1: максимальный простой делитель числа
fun maxPrimeDivisor(number: Int): Int =
    try {
        if ((number == 1) || isNumberPrime(number))
            number
        else
            maxPrimeDivisor(number, number / 2)
    }
    catch(e: ArithmeticException) {
        throw e
    }

fun maxPrimeDivisor(number: Int, divisor: Int): Int =
    try {
        if (isNumberPrime(divisor) && (number % divisor == 0))
            divisor
        else
            maxPrimeDivisor(number,divisor - 1)
    }
    catch(e: ArithmeticException) {
        throw e
    }

// проверка, простое ли число
fun isNumberPrime(number: Int): Boolean =
    when (number) {
        0 -> throw ArithmeticException("0 has no prime divisors")
        1 -> false
        2 -> true
        else -> isNumberPrime(number, number / 2)
    }

fun isNumberPrime(number: Int, divisor: Int): Boolean =
    try {
        when {
            (divisor == 1) -> true
            (number % divisor == 0) -> false
            else -> isNumberPrime(number, divisor - 1)
        }
    }
    catch(e: ArithmeticException) {
        throw e
    }

// task 7.2: произведение цифр числа, не делящихся на 5 "если число полностью состоит из 5, то результат - 1"
fun multDigitsNotDivBy(number: Int, notDivisor: Int): Int =
    when {
        (number / 10 == 0) && (number % 10 != notDivisor) -> abs(number % 10)
        (number / 10 == 0) -> 1
        (number % 10 != notDivisor) -> multDigitsNotDivBy(number / 10, notDivisor) * abs(number % 10)
        else -> multDigitsNotDivBy(number / 10, notDivisor)
    }

// task 7.3: НОД максимального нечетного непростого
// делителя числа и прозведения цифр данного числа ,"если число или произведение цифр числа - 0, то НОД - 1"
fun task7_3 (number: Int): Int =
    try {
        numbersGCD(maxOddNotPrimeDiv(number), task3_1_Up(number))
    }
    catch(e: ArithmeticException) {
        throw e
    }

// максимальный нечётный непростой делитель
fun maxOddNotPrimeDiv(number: Int): Int =
    try {
        if ((number % 2 != 0) && !isNumberPrime(number))
            number
        else
            maxOddNotPrimeDiv(number, number / 2)
    }
    catch(e: ArithmeticException) {
        throw e
    }

fun maxOddNotPrimeDiv(number: Int, divisor: Int): Int =
    try {
        if (!isNumberPrime(divisor) && (number % divisor == 0) && (divisor % 2 != 0))
            divisor
        else
            maxOddNotPrimeDiv(number, divisor - 1)
    }
    catch(e: ArithmeticException) {
        throw e
    }

// наиобольший общий делитель
fun numbersGCD(a: Int, b: Int): Int =
    when {
        ((a <= 0) || (b <= 0)) -> throw ArithmeticException("One of the numbers <= 0")
        (a == b) -> a
        (a > b) -> numbersGCD(a - b, b)
        else -> numbersGCD(a, b - a)
    }

fun op(choice: String?): (Int) -> Int =
    when(choice) {
        "1" -> ::task2
        "2" -> ::task3_1_Tail
        "3" -> ::task3_2_Tail
        "4" -> ::task3_3_Tail
        else -> throw IllegalArgumentException("WTF?!")
    }

fun Menu(number: Int) {
    println("What function do you want??\n")

    println("0: I want to go out")
    println("1: Addition")
    println("2: Multiplication")
    println("3: Maximum number")
    println("4: Minimum number")

    print("Enter the function number:> ")
    val choice = readLine()

    if (choice == "0")
        return

    try {
        println("Function result: ${op(choice)(number)}")
    }
    catch(e: IllegalArgumentException) {
        println("Error: ${e.message}! Try again!")
    }

    Menu(number)
}