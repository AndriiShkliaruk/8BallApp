//
//  SettingsViewModel.swift
//  8BallApp
//
//  Created by Andrii Shkliaruk on 22.02.2022.
//

import Foundation

class SettingsViewModel {
    var answers: [String]
    let constants = Constants.Settings.self
    private let userDefaultsService = UserDefaultsService()
    
    init() {
        answers = userDefaultsService.loadData(forKey: Constants.userDefaultsKey)
    }
    
    func saveAnswers() {
        userDefaultsService.saveData(answers, forKey: Constants.userDefaultsKey)
    }
}
