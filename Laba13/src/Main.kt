fun main(args: Array<String>)
{
    task1()
    task3()
    task5()
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
        else -> "Don't show off like you're the boss"
    }