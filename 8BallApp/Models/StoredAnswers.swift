//
//  StoredAnswers.swift
//  8BallApp
//
//  Created by Andrii Shkliaruk on 17.01.2022.
//

import Foundation

public var defaultAnswers = ["Yes", "No", "Of course", "Think one more time"]

class StoredAnswers {
    static func load() -> [String] {
        if let answers = UserDefaults.standard.array(forKey: "answers") as? [String] {
            return answers
        } else {
            return []
        }
    }
    
    static func save(_ answers: [String]) {
        UserDefaults.standard.set(answers, forKey: "answers")
    }
}
