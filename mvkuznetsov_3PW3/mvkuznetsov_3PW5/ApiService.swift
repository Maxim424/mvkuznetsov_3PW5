//
//  ApiService.swift
//  mvkuznetsov_3PW5
//
//  Created by Максим Кузнецов on 07.12.2022.
//

import UIKit

final class ApiService {
    static let shared = ApiService()
    
    func getTopStories(completion: @escaping (Result<[NewsViewModel], Error>) -> Void) {
        guard let url = URL(
            string: "https://newsapi.org/v2/everything?q=Apple&from=2022-12-07&sortBy=popularity&apiKey=9ce147a59c8043aeae6dcd51c1278bb6"
        ) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let results = try JSONDecoder().decode(NewsWrapper.self, from: data)
                completion(.success(results.articles))
            } catch {
                completion(.failure(Error.self as! Error))
            }
        }.resume()
    }
}
