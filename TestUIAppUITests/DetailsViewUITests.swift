import XCTest

/// Class with test methods for `VegetablesDetailsView`.
class DetailsViewUITests: XCTestCase {

    // TODO: Add static elements for reuse in tests.

    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
        app.tables.cells.buttons[ListViewUITests.cabbageRowLabel].tap()
    }

    func testDetailsViewContents() throws {

        // Checking title is present.
        XCTAssertTrue(app.staticTexts
            .element(matching: .staticText, identifier: VegetableDetailsViewAI.Title.rawValue).exists,
                      "Title is not present.")

        // Checking circle image is present.
        XCTAssertTrue(app.images
            .element(matching: .image, identifier: VegetableDetailsViewAI.VegetableCircleImage.rawValue).exists,
                      "'Circle image' is not present")

        // Checking 'Name:' row and it's content.
        XCTAssertTrue(app.staticTexts
            .element(matching: .staticText, identifier: VegetableDetailsViewAI.NameTitle.rawValue).exists,
                      "'Name:' text is not present.")
        XCTAssertTrue(app.staticTexts
            .element(matching: .staticText, identifier: VegetableDetailsViewAI.NameText.rawValue)
            .label == CabbageMock.name,
                      "'\(CabbageMock.name)' name text is not present.")

        // Checking 'Description:' row and it's content.
        XCTAssertTrue(app.staticTexts
            .element(matching: .staticText, identifier: VegetableDetailsViewAI.DescriptionTitle.rawValue).exists,
                      "'Description:' text is not present.")
        XCTAssertTrue(app.staticTexts
            .element(matching: .staticText, identifier: VegetableDetailsViewAI.DescriptionText.rawValue)
            .label == CabbageMock.description,
                      "'\(CabbageMock.description)' description text is not present.")
    }

    func testDetailsViewHasToggle() throws {
        let likeItSwitch = app.switches
            .element(matching: .switch, identifier: VegetableDetailsViewAI.LikeItToggle.rawValue)
        XCTAssertTrue(likeItSwitch.label == "Do you like it?",
                      "'Do you like it?' switch label is not present. Current switch's label: '\(likeItSwitch.label)'")
        XCTAssertTrue(likeItSwitch.value.debugDescription.contains("0"),
                      "'Do you like it?' switch is not switched off.")
        likeItSwitch.tap()
        XCTAssertTrue(likeItSwitch.value.debugDescription.contains("1"),
                      "'Do you like it?' switch is not switched on after tap.")
    }

    func testBackToVegetablesListButton() throws {
        let backToVegetablesButton = app.navigationBars.buttons
            .allElementsBoundByIndex.first(where: { $0.label == "Vegetables" })
        XCTAssertNotNil(backToVegetablesButton, "Back to 'Vegetables' button is not present")
        backToVegetablesButton!.tap()
        XCTAssertTrue(app.navigationBars.staticTexts["Vegetables"].exists, "'Vegetables' list screen is not present.")
    }

}
