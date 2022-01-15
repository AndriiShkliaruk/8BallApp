//
//  AnswerModel.swift
//  8BallApp
//
//  Created by Andrii Shkliaruk on 15.01.2022.
//

import Foundation

struct BallResponse: Decodable {
    let magic: Magic
}

struct Magic: Decodable {
    let answer: String
}



