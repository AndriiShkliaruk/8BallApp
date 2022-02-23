//
//  NetworkService.swift
//  8BallApp
//
//  Created by Andrii Shkliaruk on 22.02.2022.
//

import Foundation

struct NetworkService: NetworkDataProvider {
    static let ballApiURL = URL(string: "https://8ball.delegator.com/magic/JSON/question")!
    
    func fetchData<T: Decodable>(from url: URL, completion: @escaping Completion<T>) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(.network(error)))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else {
                      completion(.failure(.invalidResponse))
                      return
                  }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            }catch {
                completion(.failure(.decoding))
            }
        }.resume()
    }
}


