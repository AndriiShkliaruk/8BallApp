//
//  UserDefaultsProvider.swift
//  8BallApp
//
//  Created by Andrii Shkliaruk on 22.02.2022.
//

import Foundation

protocol UserDefaultsProvider {
    func loadData(forKey key: String) -> [String]
    func saveData(_ data: [String], forKey key: String)
}
