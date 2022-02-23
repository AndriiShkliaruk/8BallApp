//
//  BallViewModel.swift
//  8BallApp
//
//  Created by Andrii Shkliaruk on 22.02.2022.
//

import Foundation

struct BallViewModel {
    let callToShakeText = Constants.callToShakeText
    let settingsIconName = Constants.gearIconName
    let loadingText = Constants.loadingText
    
    let networkDataProvider: NetworkDataProvider
    let userDefaultsProvider: UserDefaultsProvider
    
    func getRandomAnswer(complition: @escaping (String) -> Void) {
        networkDataProvider.fetchData(from: NetworkService.ballApiURL) { (result: Result<BallResponse, DataError>) in
            switch result {
            case .failure:
                complition(self.getAnswerFromDefaults())
            case .success(let results):
                complition(results.magic.answer)
            }
        }
    }
    
    private func getAnswerFromDefaults() -> String {
        if let storedAnswer = userDefaultsProvider.loadData(forKey: Constants.userDefaultsKey).randomElement() {
            return storedAnswer
        } else {
            return Constants.defaultAnswers.randomElement()!
        }
    }
}
