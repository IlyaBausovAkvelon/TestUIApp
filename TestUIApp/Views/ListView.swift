import SwiftUI

/// ListView for representing vegetables.
struct ListView: View {

    /// View
    var body: some View {
        NavigationView {
            List(vegetablesStore.vegetables) { vegetable in
                NavigationLink(destination: VegetableDetailsView(vegetable: vegetable)) {
                    ListRowView(vegetable: vegetable)
                }
            }
        .navigationBarTitle(Text("Vegetables"))
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
