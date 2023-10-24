//
//  Cocktail.swift
//  Cocktails
//
//  Created by Brenda Saavedra Cantu on 24/10/23.
//

import Foundation

struct Cocktail: Codable, Identifiable {
    let id: String
    let title: String
    let difficulty: Difficulty
    let image: URL
    let portion: String
    let time: String
    let description: String
    let ingredients: [String]
    let method: [Method]
}
