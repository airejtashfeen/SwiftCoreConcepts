// Used in swift closures to represent every item of an array. It’s a shorthand for the first parameter of a closure.


let numbers = [1,2,3,4]

let squaredNumbers = Numbers.map{$0*$0}

print(squaredNumbers)


-------------------

let student = ["Airej", "Tashfeen", "Geetu"]

@State private var selectedStudent = "Airej"

var body: some View{
	NavigationStack{
			Form{
				Picker("Select your student:", selection: $selectedStudent){
					ForEach(students, id: \.self){
						Text($0)
					}
				}
			}
	} .navigationTitle("Select a student")
}