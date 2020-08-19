import SwiftUI

/// Struct for representing vegetable.
struct Vegetable: Codable, Identifiable {

    /// ID of vegetable in vegetables.json. Also needed for `Identifiable` protocol conformance.
    let id: Int

    /// Name.
    let name: String

    /// Description.
    let description: String

    /// ImageName.
    let imageName: String
}
