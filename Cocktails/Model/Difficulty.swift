//
//  Difficulty.swift
//  Cocktails
//
//  Created by Brenda Saavedra Cantu on 24/10/23.
//

import Foundation

enum Difficulty: String, Codable {
    case easy = "Easy"
    case medium = "Medium"
    
    var detail: String {
        return "\(self.rawValue) preparation"
    }
}
