import Foundation

func delayedResponse(completion: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        print("Response from delayed function")
        completion()
    }
}

delayedResponse {
    print("This runs after the delay")
}

func delayedMessage(completion: @escaping (String) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        print("Response from delayed function")
        completion("Message received after delay")
    }
}

delayedMessage { response in
    print(response)
}

func printLanguage(language: String, completion: @escaping (String) -> Void) {
    print("The language is: \(language)")
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        completion("The best programming language is: \(language)")
    }
}

printLanguage(language: "Swift") { response in
    print(response)
}
