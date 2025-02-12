import Foundation
import SwiftUI

let sayHelloClosure: (String) -> Void  = {
    name in print("Helloooo \(name)")
}

sayHelloClosure("Airej")

let addTwoNumbers:(Double,Double)->Void = {
    num1,num2 in print(num1+num2)
}

addTwoNumbers(4.3,5.7)


func sayHello(to name: String, finallySayIt: @escaping (String) -> Void){
    let newName = name.uppercased()
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 3){
        finallySayIt(newName)
    }
    
}

sayHello(to:"Airej", finallySayIt: {
    name in
    print("Hello \(name)")
})

let reallySayIt: (String)-> Void = {
    name in print("Hello \(name)")
}

sayHello(to: "Airej", finallySayIt: reallySayIt)


func counter()->()->Void{
    var count=1
    
    return{
        print("The counter is \(count)")
        count+=1
    }
}

let gameCounter = counter()
gameCounter()
gameCounter()