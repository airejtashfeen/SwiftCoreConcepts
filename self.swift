class Person{
    var name: String
    init(){
        name = ""
    }
}

let person = Person()

class Person2{
    var name: String
    
    init(newName: String){
        name = newName
    }
}

let person2 = Person2(newName: "Airej ")

print(person2.name, terminator: "")

class Person3{
    var name: String
    
    init(name: String){
        self.name = name
    }
}

let person3 = Person3(name: "Tashfeen")
print(person3.name)
