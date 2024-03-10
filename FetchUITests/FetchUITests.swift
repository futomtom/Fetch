import XCTest

final class FetchUITests: XCTestCase {
    override func setUp() {
        continueAfterFailure = false
    }

    override func tearDown() {}

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        let cell = app.collectionViews.cells.element.firstMatch
        cell.waitForExistence(timeout: 2)
        cell.tap()

        let doneButton = app.buttons["Done"].firstMatch
        var title = app.navigationBars.firstMatch.staticTexts.firstMatch.label
        XCTAssertEqual(title, "Apam balik", "Not match.")



        doneButton.tap()
        title = app.navigationBars.firstMatch.staticTexts.firstMatch.label
       // print("🙂2", title)
        XCTAssertEqual(title, "Desserts")
    }
}
