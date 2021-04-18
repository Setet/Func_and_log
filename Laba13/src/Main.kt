import java.util.*

fun main(args: Array<String>)
{
    task8()
}

fun task1() = println("Hello, World!")

fun task3()
{
    val name = inputName()
    println("Hello, $name!")
}

fun inputName(): String?
{
    print("Enter the user name: ")
    return readLine()
}

fun task5()
{
    val name = inputName()

    println("\n$name, which is your favorite programming language?")
    print(":> ")

    val language: String? = readLine()
    print("\n${chooseAnswerByLanguage(language)}")
}

//ответ в зависимости от языка
fun chooseAnswerByLanguage(language: String?) =
    when(language)
    {
        "Prolog","Kotlin" -> "Suck."
        "C#" -> "Will you give me your number, handsome?"
        "C++" -> "brrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr"
        "F#" -> "Ok"
        "Pascal" -> "And you are not bad!"
        "Python" ->"Why are you gay? "
        else -> "WTF"
    }

//я 7 задание запихнул в 6,т.к не понял зачем их разделять
fun task6()
{
    val scanner = Scanner(System.`in`)
    print("Enter number: ")
    var i: Int = scanner.nextInt()
    var sum = sum(i)
    var min = min(i)
    var max = max(i)

    print("min = $min\n")
    print("max = $max\n")
    print("sum = $sum")
}

fun min(i:Int): Int
{
    var min = 100
    var j=i

    while (j != 0)
    {
        if(min>j%10)
        {
            min=j%10
        }
        j /= 10
    }
    return min
}

fun max(i:Int): Int
{
    var max = 0
    var j=i

    while (j != 0)
    {
        if(max<j%10)
        {
            max=j%10
        }
        j /= 10
    }
    return max
}

fun sum(i:Int): Int
{
    var sum = 0
    var j = i

    while (j != 0)
    {
        sum += j % 10
        j /= 10
    }
    return sum
}

fun task8()
{
    val scanner = Scanner(System.`in`)
    print("Enter number: ")
    var i: Int = scanner.nextInt()
    var Method2 = method2(i)

    print("Metod2 = $Method2\n")
}

fun method2(i:Int): Int {
    var a = 3
    var sum = 0
    var j = i
    while (j != 0)
    {
        if (j % 10 < a)
        {
            sum += 1
        }
        j /= 10
    }
    return sum
}