//
//  ConnectionInteractor.swift
//  Cocktails
//
//  Created by Brenda Saavedra Cantu on 24/10/23.
//

import Foundation

protocol ConnectionInteractor {
    func loadCocktails(completion: @escaping (Result<[Cocktail], Error>) -> Void)
}

struct Connection: ConnectionInteractor {
    func loadCocktails(completion: @escaping (Result<[Cocktail], Error>) -> Void) {
        let headers = [
            "X-RapidAPI-Key": "",
            "X-RapidAPI-Host": ""
        ]

        guard let url = URL(string: "") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(NSError(domain: "Invalid response", code: 0, userInfo: nil)))
                return
            }

            guard let jsonData = data else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                return
            }

            do {
                let cocktails = try JSONDecoder().decode([Cocktail].self, from: jsonData)
                completion(.success(cocktails))
            } catch {
                completion(.failure(error))
            }
        }

        dataTask.resume()
    }

}
