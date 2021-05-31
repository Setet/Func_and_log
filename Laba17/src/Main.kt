import java.util.*

fun main() {
    // task 1
    val setet = DrivingLicense("Яхонтов", "Артём", "Алексеевич",
        Date(2001, 8, 8), "КРАСНОДАРСКИЙ КР.",
        Date(2020, 8, 15), Date(2030, 8, 15),
        "ГИБДД 2303", "7577", "345543",
        "КРАСНОДАРСКИЙ КР.", listOf("А1", "А", "В1"), 2020)

    // task 2
    setet.printDrivingLicense()
}