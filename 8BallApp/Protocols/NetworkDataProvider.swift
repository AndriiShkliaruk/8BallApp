//
//  NetworkDataProvider.swift
//  8BallApp
//
//  Created by Andrii Shkliaruk on 22.02.2022.
//

import Foundation

protocol NetworkDataProvider {
    typealias Completion<T> = (Result<T, DataError>) -> Void
    
    func fetchData<T: Decodable>(from url: URL, completion: @escaping Completion<T>)
}

enum DataError: Error {
    case network(Error)
    case invalidResponse
    case invalidData
    case decoding
}
