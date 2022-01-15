//
//  AnswerModel.swift
//  8BallApp
//
//  Created by Andrii Shkliaruk on 15.01.2022.
//

import Foundation

public let ballApiURL: String = "https://8ball.delegator.com/magic/JSON/whokilledkennedy"

struct BallResponse: Decodable {
    let magic: Magic
}

struct Magic: Decodable {
    let answer: String
}



