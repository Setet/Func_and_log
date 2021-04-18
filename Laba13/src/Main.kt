import java.util.*

fun main(args: Array<String>)
{
    task6()
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

fun task6()
{
    val scanner = Scanner(System.`in`)
    print("Enter number: ")
    var i: Int = scanner.nextInt()
    var sum = 0

    while (i != 0)
    {
        sum += i % 10
        i /= 10
    }
    println(sum)
}