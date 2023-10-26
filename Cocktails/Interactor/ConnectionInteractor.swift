//
//  ConnectionInteractor.swift
//  Cocktails
//
//  Created by Brenda Saavedra Cantu on 24/10/23.
//

import Foundation

protocol ConnectionInteractor {
    func loadCocktails() async throws -> [Cocktail]
    func loadCocktailDetail(for id: String) async throws -> Cocktail
}

struct Connection: ConnectionInteractor {
    enum Errors: Error {
        case invalidUrl
        case network(Error)
        case decoding(Error)
    }
    
    func loadCocktails() async throws -> [Cocktail] {
        do {
            let (data, _) = try await URLSession.shared.data(for: getRequest())
            return try JSONDecoder().decode([Cocktail].self, from: data)
        } catch {
            if let decodingError = error as? DecodingError {
                throw Errors.decoding(decodingError)
            } else {
                throw Errors.network(error)
            }
        }
    }
    
    func loadCocktailDetail(for id: String) async throws -> Cocktail {
        do {
            let (data, _) = try await URLSession.shared.data(for: getRequest(id: id))
            return try JSONDecoder().decode(Cocktail.self, from: data)
        } catch {
            if let decodingError = error as? DecodingError {
                throw Errors.decoding(decodingError)
            } else {
                throw Errors.network(error)
            }
        }
    }
    
    private func getRequest(id: String = "") throws -> URLRequest {
        let headers = [
            "X-RapidAPI-Key": Config.rapidKey,
            "X-RapidAPI-Host": Config.rapidHost
        ]
        
        guard let url = URL(string: "\(Config.rapidUrl)\(id.isEmpty ? "" : id)") else {
            throw Errors.invalidUrl
        }
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        
        return request
    }
}
