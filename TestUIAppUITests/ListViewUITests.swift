import XCTest

/// Class with tests methods for ListView testing.
class ListViewUITests: XCTestCase {

    // TODO: Add static elements for reuse in tests.

    let app = XCUIApplication()

    static let cabbageRowLabel = "Cabbage\nHealthy and full with nutrients"

    override func setUpWithError() throws {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    func testListViewIsPresentAfterLaunch() throws {
        XCTAssertTrue(app.navigationBars["Vegetables"].exists,
                      "Navigation bar 'Vegetables' is not present.")
        XCTAssertTrue(app.tables.cells.buttons[ListViewUITests.cabbageRowLabel].exists,
                      "List row for 'Cabbage' is not present.")
    }

    func testOpenDetailsViewForCabbageFromListView() throws {
        XCTAssertTrue(app.tables.cells.buttons[ListViewUITests.cabbageRowLabel].exists,
                      "List row for 'Cabbage' is not present.")
        app.tables.cells.buttons[ListViewUITests.cabbageRowLabel].tap()
        let cabbageDetailsViewTitle = app.staticTexts
            .element(matching: .staticText, identifier: VegetableDetailsViewAI.Title.rawValue)
        XCTAssertTrue(cabbageDetailsViewTitle.label == "Cabbage",
                      "DetailsView for 'Cabbage' is not present after tapping on it's list row.")
    }

}
