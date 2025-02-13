func capitalism(to name: String, sayInUpperCase: @escaping(String)->Void){
    let newName = name.uppercased()

    DispatchQueue.main.asyncAfter(deadline: .now() + 2){
        sayInUpperCase("Hello \(newName)")
    }
}

capitalism(to: "airej"){
    response in
    print(response)
}