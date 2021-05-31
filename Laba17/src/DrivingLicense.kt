import java.util.*

class DrivingLicense(private val surname: String,
                     private val name: String, private val patronymic: String,
                     private val dateOfBirth: Date, private val placeOfBirth: String,
                     private val dateOfIssue: Date, private val expiryDate: Date,
                     private val policeDepartment: String,
                     private val licenseSeries: String, private val licenseNumber: String,
                     private val placeOfIssue: String,
                     private val categories: List<String>,
                     private val startingYearOfDriving: Int) {

    fun printDrivingLicense() {
        println("ВОДИТЕЛЬСКОЕ УДОСТОВЕРЕНИЕ\n")
        println("1)\tФ.И.О:$surname $name $patronymic")
        println("2)\tДата рождения:${getDate(dateOfBirth)}")
        println("3)\tМесто рождения:$placeOfBirth")
        println("4)\tПрава действительны с ${getDate(dateOfIssue)} по\t${getDate(expiryDate)}")
        println("5)\t$policeDepartment")
        println("6)\tСерия:$licenseSeries номер:$licenseNumber")
        // 8, потому что 6 и 7 - фото и подпись
        println("8)\tМесто выдочи прав:$placeOfIssue")
        println("9)\tКатегории транспорта:${categories.joinToString(" ")}")
        // 14, потому что до этого - специальные поля
        println("14)\tЗа рулём с $startingYearOfDriving")
    }

    private fun getDate(date: Date): String {
        val check = {date: Int -> if (date < 10) "0$date" else "$date"}
        return "${check(date.date)}.${check(date.month)}.${date.year}"
    }
}