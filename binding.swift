struct ParentView: View {
    @State var parentText: String = "Hello World"  
    var body: some View {
        VStack {
            Text("Parent View \(parentText)")

            // Pass $parentText as a binding to ChildView's `childText`
            ChildView(childText: $parentText)
        }
    }
}

struct ChildView: View {
    @Binding var childText: String 

    var body: some View {
        TextField("Edit Text", text: $childText)
            .padding()
    }
}
