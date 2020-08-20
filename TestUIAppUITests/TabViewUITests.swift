import XCTest

/// Class with tests methods for TabView testing.
class TabViewUITests: XCTestCase {

    // TODO: Add static elements for reuse in tests.

    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testTabViewIsPresentAfterLaunch() throws {

        // Checking 'Vegetables' tab button is present.
        XCTAssertTrue(app.tabBars.buttons["Vegetables"].exists,
                      "'Vegetables' tab button is not present.")

        // Checking 'Vegetable Of The Day' tab button is present.
        XCTAssertTrue(app.tabBars.buttons["Vegetable Of The Day"].exists,
                      "'Vegetable Of The Day' tab button is not present.")
    }

    func testTabViewSwitchToVegetableOfTheDayAndBackToVegetablesList() throws {
        let vegetablesTabButton = app.tabBars.buttons["Vegetables"]
        let vegetableOfTheDayTabButton = app.tabBars.buttons["Vegetable Of The Day"]
        vegetableOfTheDayTabButton.tap()
        XCTAssertTrue(app.navigationBars.staticTexts["Vegetable of the day"].exists,
                      "'Vegetable of the day' screen is not present.")
        vegetablesTabButton.tap()
        XCTAssertTrue(app.navigationBars.staticTexts["Vegetables"].exists,
                      "'Vegetables' screen is not present.")
    }
}
