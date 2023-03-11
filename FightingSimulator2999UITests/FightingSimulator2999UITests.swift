//
//  FightingSimulator2999UITests.swift
//  FightingSimulator2999UITests
//
//  Created by Teacher on 11.03.2023.
//

import XCTest

final class FightingSimulator2999UITests: XCTestCase {
    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        let basicAttackButton = app.buttons["Basic attack"]
        basicAttackButton.tap()
        basicAttackButton.tap()
        basicAttackButton.tap()
        basicAttackButton.tap()
        basicAttackButton.tap()
        basicAttackButton.tap()
        basicAttackButton.tap()
        basicAttackButton.tap()
        basicAttackButton.tap()
        basicAttackButton.tap()
        XCTAssertTrue(app.buttons["Restart"].exists)
    }

}
