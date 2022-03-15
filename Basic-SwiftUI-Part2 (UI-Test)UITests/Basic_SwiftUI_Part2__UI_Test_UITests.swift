//
//  Basic_SwiftUI_Part2__UI_Test_UITests.swift
//  Basic-SwiftUI-Part2 (UI-Test)UITests
//
//  Created by Chondro Satrio Wibowo on 15/03/22.
//

import XCTest

class Basic_SwiftUI_Part2__UI_Test_UITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testPressMemoryPlusAtAppStartShowZeroInDisplay()throws{
        let app = XCUIApplication()
        app.launch()
        let memoryButton = app.buttons["M+"]
        memoryButton.tap()
        let display = app.staticTexts["display"]
        let displayText = display.label
        XCTAssert(displayText == "0")
    }
    
    func testAddingTwoDigits(){
        let app = XCUIApplication()
        app.launch()
        
        let threeButton = app.buttons["3"]
        threeButton.tap()
        
        let addButton = app.buttons["+"]
        addButton.tap()
        
        let fiveButton = app.buttons["5"]
        fiveButton.tap()
        
        let equalButton = app.buttons["="]
        equalButton.tap()
        
        let display = app.staticTexts["display"]
        let displayText = display.label
        XCTAssertEqual(displayText, "8.0")
    }
    
    func testSwipeToClearMemory(){
        let app = XCUIApplication()
        app.launch()
        
        let threeButton = app.buttons["3"]
        threeButton.tap()
        let fiveButton = app.buttons["5"]
        fiveButton.tap()
        
        let memoryButton = app.buttons["M+"]
        memoryButton.tap()
        
        let memoryDisplays = app.staticTexts["memoryDisplay"]
        XCTAssert(memoryDisplays.exists)
        memoryDisplays.swipeLeft()
        XCTAssertFalse(memoryDisplays.exists)
    }
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
