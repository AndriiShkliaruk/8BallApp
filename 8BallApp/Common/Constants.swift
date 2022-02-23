//
//  Constants.swift
//  8BallApp
//
//  Created by Andrii Shkliaruk on 22.02.2022.
//

import Foundation

struct Constants {
    static let defaultAnswers = ["Yes", "No", "Of course", "Think one more time"]
    static let userDefaultsKey = "answers"
    static let callToShakeText = "Shake to see the answer"
    static let gearIconName = "gearshape.fill"
    static let ballImageName = "8ball"
    static let loadingText = "Loading..."
    
    struct Settings {
        static let titleText = "Settings"
        static let alertTitleText = "Add answer"
        static let alertPlaceholderText = "Enter answer"
        static let alertActionText = "Add"
    }
}
