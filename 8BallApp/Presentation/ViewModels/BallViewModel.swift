//
//  BallViewModel.swift
//  8BallApp
//
//  Created by Andrii Shkliaruk on 22.02.2022.
//

import Foundation

class BallViewModel {
    let callToShakeText = Constants.callToShakeText
    let settingsIconName = Constants.gearIconName
    let motionBeganText = Constants.motionBeganText
    let loadingText = Constants.loadingText
    
    private let networkService = NetworkService()
    private let userDefaultsService = UserDefaultsService()
    
    func getRandomAnswer(complition: @escaping (String) -> Void) {
        let url = URL(string: Constants.ballApiURL)
        networkService.fetchData(from: url!) { (result: Result<BallResponse, DataError>) in
            switch result {
            case .failure:
                complition(self.getAnswerFromDefaults())
            case .success(let results):
                complition(results.magic.answer)
            }
        }
    }
    
    private func getAnswerFromDefaults() -> String {
        if let storedAnswer = userDefaultsService.loadData(forKey: Constants.userDefaultsKey).randomElement() {
            return storedAnswer
        } else {
            return Constants.defaultAnswers.randomElement()!
        }
    }
}
