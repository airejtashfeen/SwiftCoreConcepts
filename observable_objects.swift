import SwiftUI
import Combine

class CounterViewModel: ObservableObject{
    @Published var count: Int
    count = 0

    func increment(){
        count+=1
    }
}

struct CounterView: View{
    @ObservedObject var viewModel = CounterViewModel()

    var body: some View{
        VStack{
            Text("The count rn is: \(viewModel.count)")
                .font(.title)
            Button("Increment"){
                viewModel.increment()
            }
        }
    } 
}