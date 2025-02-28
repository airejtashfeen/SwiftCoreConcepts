import SwiftUI


//The $ sign makes sure that the data entered by the user updates as the user types

// /(name) updates AFTER the name changes
struct ContentView: View{
    @State private var name = "" 

    var body: some View{
        TextField("Enter your name:", text: $name)
            .textFieldStyle(roundedRectangleBorders)
            .padding()
        TextField("Hello \(name)")

    }
}