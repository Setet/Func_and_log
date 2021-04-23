import java.lang.Math.abs
import java.util.*

fun main()
{
    //task1()
    //task3()
    //task5()

    //val number = inputNumber()
    //println("Choose an action on a number:\n")
    //println("1)Find the sum of the digits of a number\n")
    //println("2)Minimum digit of a number:\n")
    //("3)Maximum digit of a number\n")
    //println("4)Product of the digits of a number:\n")

    //val kekw: String? = readLine()
    //println("\n${yes(kekw,number)}")

    //println("Again?")
    //val pipu:String?= readLine()
    //println("${hehe(pipu)}")

    task10()
}

fun inputNumber(): Int {
    print("Enter the number:> ")
    val number = readLine()

    return if (number == null) {
        inputNumber()
    }
    else
    {
        try
        {
            number.toInt()
        } catch (e: NumberFormatException)
        {
            inputNumber()
        }
    }
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
        "Prolog","Kotlin" -> "Suck.\n"
        "C#" -> "Will you give me your number, handsome?\n"
        "C++" -> "brrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr\n"
        "F#" -> "Ok\n"
        "Pascal" -> "And you are not bad!\n"
        "Python" ->"Why are you gay?\n"
        else -> "WTF\n"
    }

fun yes(kekw: String?,number: Int)=
    when(kekw)
    {
        "1"->"Sum = ${task6(number)}"
        "2"->"Min = ${task7_1(number)}"
        "3"->"Max = ${task7_2(number)}"
        "4"->"Multi = ${task7_3(number)}"
        else->"WTF\n"
    }

fun hehe(kek: String?): Unit =
    when(kek)
    {
        "yes"->"${main()}"
        "no"->System.exit(0)
        else->"WTF\n"
    } as Unit

fun task6(number: Int): Int
{
    return if (number / 10 == 0)
    {
        abs(number % 10)
    }
    else
    {
        task6(number / 10) + abs(number % 10)
    }
}

fun task7_1(number: Int): Int
{
    fun minDigit(number: Int, min: Int): Int {
        val newNumber = number / 10
        val digit = abs(number % 10)

        val newMin =
            if (digit < min)
            {
                digit
            }
            else
            {
                min
            }

        return if (newNumber != 0)
        {
            minDigit(newNumber, newMin)
        }
        else
        {
            newMin
        }
    }
    return minDigit(number, 10)
}

fun task7_2(number: Int): Int
{
    fun maxDigit(number: Int, max: Int): Int
    {
        val newNumber = number / 10
        val digit = abs(number % 10)

        val newMax =
            if (digit > max)
            {
                digit
            }
            else
            {
                max
            }

        return if (newNumber != 0)
        {
            maxDigit(newNumber, newMax)
        }
        else
        {
            newMax
        }
    }
    return maxDigit(number, -1)
}

fun task7_3(number: Int): Int
{
    return if (number / 10 == 0)
        abs(number % 10)
    else
        task7_3(number / 10) * abs(number % 10)
}

fun task10()
{
    var sum=0
    print("Enter word: ")
    val scanner=Scanner(System.`in`)
    var word:String = scanner.nextLine()

    val line = "0abcdefghijklmnopqrstuvwxyz"

    for(i in word.indices)
    {
        for(j in line.indices)
        {
            if(word[i]==line[j])
            {
                print(word[i]+"="+j+" ")
                sum +=j
            }
        }
    }
    print("\nSum the word =$sum\n")
    gh(sum,word)
}

fun gh(sum :Int,word:String)
{
    var n=1
    var der=1;
    for(i in 1..50)
    {
        der = (n * (n + 1)) / 2
        if (der == sum)
        {
            print(" $der\n")
            print("The word $word is the word of the triangle !!!!")
            break;
        } else {
            print(" $der")
            n += 1
        }
    }
    if(der!=sum)
    {
        print("\nThe word $word is no the word of the triangle !!!!")
    }
}