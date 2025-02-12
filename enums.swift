import Foundation

// Error Handling for Division
enum DivError: Error {
    case divideBy0Error
}

func quotient(_ divisor: Double, _ dividend: Double) throws -> Double {
    guard divisor != 0 else {
        throw DivError.divideBy0Error
    }
    return dividend / divisor
}

do {
    let result = try quotient(45, 4)
    print("Quotient: \(result)")
} catch {
    print("Error: Cannot divide by zero.")
}

// Menu System
enum Size {
    case small, medium, large
}

enum MenuItem {
    case coke(size: Size)
    case burger(quantity: Int)
    case fries(size: Size)
}

let order1: [MenuItem] = [
    .coke(size: .small),
    .burger(quantity: 1),
    .fries(size: .large)
]

func printOrder(_ order: [MenuItem]) {
    for item in order {
        switch item {
        case .coke(let size):
            print("\(size) Coke")
        case .burger(let quantity):
            print("\(quantity) Burger(s)")
        case .fries(let size):
            print("\(size) Fries")
        }
    }
}

printOrder(order1)

// Car System
enum Car {
    case suv(price: Double)
    case sedan(price: Double)
    case convertible(price: Double)
    
    var price: Double {
        switch self {
        case .suv(let price), .sedan(let price), .convertible(let price):
            return price
        }
    }
    
    var description: String {
        switch self {
        case .suv:
            return "This is an SUV."
        case .sedan:
            return "This is a Sedan."
        case .convertible:
            return "This is a Convertible."
        }
    }
}

let car = Car.convertible(price: 5000)
print(car.description)
print("Price: \(car.price)")
