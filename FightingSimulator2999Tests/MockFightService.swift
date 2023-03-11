//
//  MockFightService.swift
//  FightingSimulator2999Tests
//
//  Created by Teacher on 11.03.2023.
//

import Foundation
import Combine
@testable import FightingSimulator2999

class FightServiceImpl: FightService {
    static let shared: FightServiceImpl = .init()
    
    private var _isNewGame: CurrentValueSubject<Bool, Never> = .init(false)
    var isNewGame: AnyPublisher<Bool, Never> { _isNewGame.eraseToAnyPublisher() }
    
    var _myHealth: CurrentValueSubject<Int, Never> = .init(100)
    var _enemyHealth: CurrentValueSubject<Int, Never> = .init(100)

    var myHealth: AnyPublisher<Int, Never> { _myHealth.eraseToAnyPublisher() }
    var enemyHealth: AnyPublisher<Int, Never> { _enemyHealth.eraseToAnyPublisher() }

    func startFight() {
        _myHealth.value = 100
        _enemyHealth.value = 100
    }

    func basicAttack() -> (Int, Int) {
        _enemyHealth.value -= 9
        _myHealth.value -= 10
        return (_myHealth.value, _enemyHealth.value)
    }
    
    func reset() {
        FightServiceImpl.shared.startFight()
    }

    func magicAttack() -> (Int, Int) {
        _enemyHealth.value -= Int.random(in: 7..<16)
        _myHealth.value -= 10
        return (_myHealth.value, _enemyHealth.value)
    }
    
    func getPlayerHealth() -> Float {
        Float(_myHealth.value)
    }
    
    func getEnemyHealth() -> Float {
        Float(_enemyHealth.value)
    }
    
}

