import UIKit

/// Global variable for storing vegetables info.
let vegetablesStore = DataProvider()

/// Class for parsing vegetables.json and provide access to vegetables data.
class DataProvider {

    /// Array with current vegetables.
    let vegetables: [Vegetable]

    /// Returns random vegetable.
    /// - Returns: Random `Vegetable`.
    func getRandom() -> Vegetable {

        // Force unwrapping here because the collection is always there now.
        // TODO: Add correct checking and handling.
        return vegetables.randomElement()!
    }

    init() {
        guard let vegetablesJSON = Bundle.main.url(forResource: "Vegetables.json", withExtension: nil) else {
            fatalError("Couldn't find the file Vegetables.json in bundle.")
        }

        let rawData: Data
        do {
            rawData = try Data(contentsOf: vegetablesJSON)
        } catch {
            fatalError("Couldn't parse data from Vegetables.json: '\(error)'")
        }

        do {
            let decoder = JSONDecoder()
            self.vegetables = try decoder.decode([Vegetable].self, from: rawData)
        } catch {
            fatalError("Couldn't parse Vegetables.json with JSONDecoder: '\(error)'")
        }
    }
}
