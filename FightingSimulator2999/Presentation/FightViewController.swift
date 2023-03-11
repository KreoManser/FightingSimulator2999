//
//  ViewController.swift
//  FightingSimulator2999
//
//  Created by Teacher on 11.03.2023.
//

import UIKit
class FightViewController: UIViewController {
    @IBOutlet
    private var myHealthView: UIProgressView!

    @IBOutlet
    private var enemyHealthView: UIProgressView!
	
	var presenter: FightPresenter!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        myHealthView.progress = 1
        enemyHealthView.progress = 1
    }

    @IBAction
    private func basicAttackTap() {
		presenter.basicAttack()
		updateHealthLabels()
    }

    @IBAction
    private func magicAttackTap() {
		presenter.magicAttack()
		updateHealthLabels()
    }
	
	func updateHealthLabels() {
		myHealthView.progress = Float(presenter.getPlayerHealth()) / 100.0
		enemyHealthView.progress = Float(presenter.getEnemyHealth()) / 100.0
	}
}

