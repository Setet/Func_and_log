val x="""
   val x=%c%c%c%s%c%c%c
   func main()
   {
   print(a.format(34,34,34,x,34,34,34))
   }
"""

fun main()
{
   print(x.format(34,34,34,x,34,34,34))
}