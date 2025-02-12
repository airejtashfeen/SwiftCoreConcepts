import Foundation
//The readline function might not work as expected in Xcode Playground.. Use another IDE

print("Enter speed for Car 1: ", terminator:"")
let car1SpeedInput = Double(readLine() ?? "") ?? 0.0

print("Enter speed for Car 2: ", terminator:"")
let car2SpeedInput = Double(readLine() ?? "") ?? 0.0

let car1Speed: (Double) -> Double = { speed in
    print("Car No.1 going with speed: \(speed)")
    return speed
}

let car2Speed: (Double) -> Double = { speed in
    print("Car No.2 going with speed: \(speed)")
    return speed
}

let resultRace: (Double, Double, @escaping (String) -> Void) -> Void = { speed1, speed2, completion in
    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        if speed1 > speed2 {
            completion("The car with speed \(speed1) wins!")
        } else if speed1 < speed2 {
            completion("The car with speed \(speed2) wins!")
        } else {
            completion("It's a tie! Both cars have the same speed of \(speed1).")
        }
    }
}

let res1 = car1Speed(car1SpeedInput)
let res2 = car2Speed(car2SpeedInput)

resultRace(res1, res2) { result in
    print(result)
}
