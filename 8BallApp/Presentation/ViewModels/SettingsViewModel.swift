//
//  SettingsViewModel.swift
//  8BallApp
//
//  Created by Andrii Shkliaruk on 22.02.2022.
//

import Foundation

struct SettingsViewModel {
    let constants = Constants.Settings.self
    
    var answers: [String]
    let userDefaultsProvider: UserDefaultsProvider
    
    init(userDefaultsProvider: UserDefaultsProvider) {
        self.userDefaultsProvider = userDefaultsProvider
        answers = userDefaultsProvider.loadData(forKey: Constants.userDefaultsKey)
    }
    
    func saveAnswers() {
        userDefaultsProvider.saveData(answers, forKey: Constants.userDefaultsKey)
    }
}
