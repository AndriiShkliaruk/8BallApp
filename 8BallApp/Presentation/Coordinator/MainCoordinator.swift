//
//  MainCoordinator.swift
//  8BallApp
//
//  Created by Andrii Shkliaruk on 22.02.2022.
//

import UIKit

struct MainCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let ballViewModel = BallViewModel(networkDataProvider: NetworkService(), userDefaultsProvider: UserDefaultsService())
        let ballViewController = BallViewController(viewModel: ballViewModel, coordinator: self)
        navigationController.pushViewController(ballViewController, animated: false)
    }
    
    func moveToSettings() {
        let settingsViewModel = SettingsViewModel(userDefaultsProvider: UserDefaultsService())
        let settingsViewController = SettingsViewController(viewModel: settingsViewModel, coordinator: self)
        navigationController.pushViewController(settingsViewController, animated: true)
    }
}
