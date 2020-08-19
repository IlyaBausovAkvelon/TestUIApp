import SwiftUI

/// Main TabView.
struct ContentView: View {

    /// State var for storing TabView selection.
    @State private var selection = 0

    /// View.
    var body: some View {
        TabView(selection: $selection) {

            /// List view of vegetables.
            ListView()
                .tabItem {
                    VStack {
                        Text("Vegetables")
                    }
                }
                .tag(0)

            /// 'Vegetable of the day' view.
            NavigationView {
                VStack {
                    Text("There you could get details about the vegetable of the day.").font(.headline)
                    Divider()
                    NavigationLink(destination: VegetableDetailsView(vegetable: vegetablesStore.getRandom())) {
                        Text("Tell me!")
                    }
                }
                .navigationBarTitle(Text("Vegetable of the day"))
            }
                .tabItem {
                    VStack {
                        Text("Vegetable Of The Day")
                    }
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
