import SwiftUI

/// View with details about vegetable.
struct VegetableDetailsView: View {

    /// Vegetable to draw view for.
    var vegetable: Vegetable

    /// State var for 'Do you like it?' toggle selector.
    @State private var selection = false

    /// View.
    var body: some View {
        VStack(alignment: .center) {
            Text(vegetable.name)
                .font(.title)
                .bold()
            CircleImage(imageName: vegetable.imageName, width: 200, height: 200)
            VStack(alignment: .leading) {
                HStack {
                    Text("Name:").bold()
                    Text(vegetable.name)
                }
                HStack {
                    Text("Description:").bold()
                    Text(vegetable.description).lineLimit(nil)
                }
                Toggle(isOn: $selection) {
                    Text("Do you like it?").bold().offset(x: 10)
                }
                .offset(x: -10)
            }
            .font(.headline)
            .padding()
            .offset(x: 10, y: 10)
        }
    }
}

struct VegetableDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        VegetableDetailsView(vegetable: vegetablesStore.vegetables[0])
    }
}
