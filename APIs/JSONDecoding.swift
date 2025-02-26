import UIKit

/*:
 ### Simple Objects
 */
let person1JSON = """
{
    "name": "James",
    "age": 45,
    "gender": "Male",
    "sign": "Sagitarius",
    "partner": "Emily",
    "isEmployed": true
}
"""

let person2JSON = """
{
    "name": "Mary",
    "age": 45,
    "gender": "Female",
    "sign": "Taurus",
    "isEmployed": false
}
"""

struct Person : Decodable{
    let name: String
    let age: Int
    let gender: String
    let sign: String
    let partner: String?
    let isEmployed: Bool
}

let decoder = JSONDecoder()
guard let person1JSONData = person1JSON.data(using: .utf8) else{
    fatalError("Failed to convert JSON String to Data")
}
do{
    let person1 = try decoder.decode(Person.self, from: person1JSONData)
}
catch{
    print("Decoding failed")
}

guard let person2JSONData = person2JSON.data(using: .utf8) else{
    fatalError("Failed to convert JSON String to Data")
}
do{
    let person2 = try decoder.decode(Person.self, from: person2JSONData)
}
catch{
    print("Decoding failed")
}

/*:
 ### Arrays
*/
let personsJSON = """
[
    {
        "name": "James",
        "age": 45,
        "gender": "Male",
        "sign": "Sagitarius",
        "partner": "Emily",
        "isEmployed": true
    },
    {
        "name": "Mary",
        "age": 45,
        "gender": "Female",
        "sign": "Taurus",
        "isEmployed": false
    }
]
"""
guard let personsData = personsJSON.data(using: .utf8) else{
    fatalError("Failed to convert JSON String to data")
}
do{
    let personsArray = try decoder.decode([Person].self, from: personsData)
    
    for person in personsArray{
        print("\(person.name)'s partner is \(person.partner ?? "none")")
    }
}
catch{
    print("Decoding failed")
}
/*:
 #### More Complex Objects
 */
let familyJSON = """
{
    "familyName": "Smith",
    "members": [
        {
            "name": "James",
            "age": 45,
            "gender": "Male",
            "sign": "Sagitarius",
            "partner": "Emily",
            "isEmployed": true
        },
        {
            "name": "Mary",
            "age": 45,
            "gender": "Female",
            "sign": "Taurus",
            "isEmployed": false
        }
    ]
}
"""
struct Family: Decodable{
    let familyName: String
    let members: [Person]
}

guard let familyJSONData = familyJSON.data(using: .utf8) else{
    fatalError("Failed to decode JSON to String")
}

do{
    let familyData = try decoder.decode(Family.self, from: familyJSONData)
    
    print(familyData.familyName)
    
    for member in familyData.members{
        print(member.name)
    }
}

/*:
 ## A Better model
 */
struct Family2: Decodable{
    enum Gender: String, Decodable{
        case Male,Female,Others
    }
    struct Person : Decodable{
        let name: String
        let age: Int
        let gender: Gender
        let partner: String?
        let isEmployed: Bool
    }
    let familyName: String
    let members:[Person]
}

do{
    let family2Data = try decoder.decode(Family.self, from: familyJSONData)
    for member in family2Data.members{
        print("\(member.name)'s partner is \(member.partner ?? "none")")
    }
}