import UIKit

class FightCoordinator {
    weak var window: UIWindow?
    
    var fightService: FightService = FightServiceImpl.shared
    unowned var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    let storyboard: UIStoryboard = .init(name: "Main", bundle: nil)
    
    func start() {
        let fightController: FightViewController = storyboard
            .instantiateViewController(identifier: "FightViewController")
        let presenter = FightPresenterImpl()
        
        fightController.presenter = presenter
        presenter.view = fightController
        presenter.showResult = { [self] result in
            self.showResult(result: result)
        }
        presenter.restartFight = restartFight
        
        navigationController.pushViewController(fightController, animated: true)
    }
    
    func showResult(result: Bool) {
        let resultController: ResultViewController = storyboard
            .instantiateViewController(identifier: "ResultViewController")
        let presenter = FightPresenterImpl()
        
        resultController.result = result ? .win : .lose
        resultController.presenter = presenter
        presenter.restartFight = { [weak self] in
            self?.restartFight()
        }
        
        navigationController.setNavigationBarHidden(true, animated: true)
        navigationController.pushViewController(resultController, animated: true)
    }
    
    lazy var restartFight: () -> Void = { [weak self] in
        self?.navigationController.popViewController(animated: true)
    }
}

