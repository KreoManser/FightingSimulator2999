import UIKit

protocol FightPresenter {
    func startFight()
    func basicAttack()
    func magicAttack()
    func getPlayerHealth() -> Float
    func getEnemyHealth() -> Float
    var showResult: (_ result: Bool) -> Void { get }
    var restartFight: () -> Void { get set }
}


class FightPresenterImpl: FightPresenter {
    weak var view: FightViewController?
    var fightService: FightService = FightServiceImpl.shared
    var showResult: (_ result: Bool) -> Void = {_ in }
    var restartFight: () -> Void = {}
    
    func startFight() {
        fightService.startFight()
    }
    
    func basicAttack() {
        let result = fightService.basicAttack()
        
        if result.0 <= 0 {
            showResult(false)
        } else if result.1 <= 0 {
            showResult(true)
        }
    }
    
    func magicAttack() {
        let result = fightService.magicAttack()
        
        if result.0 <= 0 {
            showResult(false)
        } else if result.1 <= 0 {
            showResult(true)
        }
    }
    
    func getPlayerHealth() -> Float {
        fightService.getPlayerHealth()
    }
    
    func getEnemyHealth() -> Float {
        fightService.getEnemyHealth()
    }
}
