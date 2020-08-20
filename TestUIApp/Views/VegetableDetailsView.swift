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
                .accessibility(identifier: VegetableDetailsViewAI.Title.rawValue)
            CircleImage(imageName: vegetable.imageName, width: 200, height: 200)
                .accessibility(identifier: VegetableDetailsViewAI.VegetableCircleImage.rawValue)
            VStack(alignment: .leading) {
                HStack {
                    Text("Name:")
                        .bold()
                        .accessibility(identifier: VegetableDetailsViewAI.NameTitle.rawValue)
                    Text(vegetable.name)
                        .accessibility(identifier: VegetableDetailsViewAI.NameText.rawValue)
                }
                HStack {
                    Text("Description:")
                        .bold()
                        .accessibility(identifier: VegetableDetailsViewAI.DescriptionTitle.rawValue)
                    Text(vegetable.description)
                        .accessibility(identifier: VegetableDetailsViewAI.DescriptionText.rawValue)
                }
                Toggle(isOn: $selection) {
                    Text("Do you like it?")
                        .bold()
                        .offset(x: 10)
                        .accessibility(identifier: VegetableDetailsViewAI.LikeItSelectorTitle.rawValue)
                }
                .offset(x: -10)
                .accessibility(identifier: VegetableDetailsViewAI.LikeItToggle.rawValue)
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
