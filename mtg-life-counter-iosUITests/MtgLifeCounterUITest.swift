//
//  MtgLifeCounterUITest.swift
//  mtg-life-counter-iosUITests
//  
//  Created by kohsaka on 2024/03/01
//  
//

import XCTest

final class MtgLifeCounterUITest: XCTestCase {

    func testLeftMin() throws {
        let app = XCUIApplication()
        app.launch()
        app.buttons["reset"].tap()
        var count = 25
        repeat {
            app.buttons["left down"].tap()
            count -= 1
        } while (count > 0)
        XCTAssertTrue(app.staticTexts[String(count)].exists)
    }

    func testRightMin() throws {
        let app = XCUIApplication()
        app.launch()
        app.buttons["reset"].tap()
        var count = 25
        repeat {
            app.buttons["right down"].tap()
            count -= 1
        } while (count > 0)
        XCTAssertTrue(app.staticTexts[String(count)].exists)
    }

    func testLeftUp() throws {
        let app = XCUIApplication()
        app.launch()
        app.buttons["reset"].tap()
        var count = 20
        repeat {
            app.buttons["left up"].tap()
            count += 1
        } while (count < 25)
        XCTAssertTrue(app.staticTexts[String(count)].exists)
    }

    func testRightUp() throws {
        let app = XCUIApplication()
        app.launch()
        app.buttons["reset"].tap()
        var count = 20
        repeat {
            app.buttons["right up"].tap()
            count += 1
        } while (count < 25)
        XCTAssertTrue(app.staticTexts[String(count)].exists)
    }

    func testReset() throws {
        let app = XCUIApplication()
        app.launch()
        app.buttons["reset"].tap()
        XCTAssertTrue(app.staticTexts[String(20)].exists)
    }

    func testDice() throws {
        let app = XCUIApplication()
        app.launch()
        app.buttons["dice"].tap()
        XCTAssertTrue(app.images["dice roll"].isEnabled)
    }

}
