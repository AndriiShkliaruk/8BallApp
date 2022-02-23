//
//  UserDefaultsService.swift
//  8BallApp
//
//  Created by Andrii Shkliaruk on 22.02.2022.
//

import Foundation

struct UserDefaultsService: UserDefaultsProvider {
    func loadData(forKey key: String) -> [String] {
        if let data = UserDefaults.standard.array(forKey: key) as? [String] {
            return data
        } else {
            return []
        }
    }
    
    func saveData(_ data: [String], forKey key: String) {
        UserDefaults.standard.set(data, forKey: key)
    }  
}
