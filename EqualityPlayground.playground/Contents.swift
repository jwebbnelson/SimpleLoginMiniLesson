// Jordan Nelson - Protocol Mini-Lesson
// Struct conforms to Equatable Protocol

struct Student:Equatable {
    var name: String
    var uID: Int
}

func == (lhs: Student, rhs: Student) -> Bool {
    return (lhs.uID == rhs.uID)
}

let student1 = Student(name: "John", uID: 01)
let student2 = Student(name: "John", uID: 02)

if student1 == student2 {
    print("Same Student")
} else {
    print("Different Student")
}