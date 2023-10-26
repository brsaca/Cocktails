//
//  ConnectionInteractor.swift
//  Cocktails
//
//  Created by Brenda Saavedra Cantu on 24/10/23.
//

import Foundation

protocol ConnectionInteractor {
    func loadCocktails() async throws -> [Cocktail]
}

struct Connection: ConnectionInteractor {
    
    enum Errors: Error {
        case invalidUrl
        case network(Error)
        case decoding(Error)
    }
    
    func loadCocktails() async throws -> [Cocktail] {
        let headers = [
            "X-RapidAPI-Key": Config.rapidKey,
            "X-RapidAPI-Host": Config.rapidHost
        ]
        
        guard let url = URL(string: Config.rapidUrl) else {
            throw Errors.invalidUrl
        }
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            return try JSONDecoder().decode([Cocktail].self, from: data)
        } catch {
            if let decodingError = error as? DecodingError {
                throw Errors.decoding(decodingError)
            } else {
                throw Errors.network(error)
            }
        }
    }
    
}
