//
//  FightingSimulator2999Tests.swift
//  FightingSimulator2999Tests
//
//  Created by Teacher on 11.03.2023.
//

import XCTest
@testable import FightingSimulator2999

final class FightingSimulator2999Tests: XCTestCase {
    var service: FightService!
    
    override func setUpWithError() throws {
        service = FightServiceImpl.shared
    }
    
    func testBasicAttack() throws {
        let initialEnemyHealth = service.getEnemyHealth()
        let initialPlayerHealth = service.getPlayerHealth()
        let result = service.basicAttack()
        XCTAssertEqual(result.1, Int(initialEnemyHealth) - 9)
        XCTAssertEqual(result.0, Int(initialPlayerHealth) - 10)
    }
}
