//
//  MainCoordinator.swift
//  8BallApp
//
//  Created by Andrii Shkliaruk on 22.02.2022.
//

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let ballViewController = BallViewController()
        ballViewController.coordinator = self
        navigationController.pushViewController(ballViewController, animated: false)
    }
    
    func moveToSettings() {
        let settingsViewController = SettingsViewController()
        settingsViewController.coordinator = self
        navigationController.pushViewController(settingsViewController, animated: true)
    }
}
