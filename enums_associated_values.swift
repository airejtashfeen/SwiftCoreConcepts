// The concept of Result is covered in here too

import Foundation

enum DivError: Error{
    case divideBy0Error
}

func quotient(_ dividend: Double, _ divisor: Double) throws -> Double {
    if divisor==0{
        throw DivError.divideBy0Error
    }
    
    return dividend/divisor
}

func doLongDivision(num1:Double, num2:Double, completion: @escaping (Result<Double,DivError>) -> Void ){
    do{
        let answer = try quotient(num1, num2)
        completion(.success(answer))
    }
    catch{
        completion(.failure(.divideBy0Error))
    }
}

doLongDivision(num1: 25, num2: 5){
    (result) in
    switch result{
    case .success(let answer):
        print (answer)
    case .failure(let error):
        print(error)
    }
}



