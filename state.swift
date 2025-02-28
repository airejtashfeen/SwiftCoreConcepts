import SwiftUI

struct ToggleView: View{
    @State private var isOn: Bool = false

    var body:some View{
        VStack{
            Toggle("Switch", isOn: $isOn)
                .padding()

            Text(isOn? "ON": "OFF")
                .font(.title)
        }
    }
}