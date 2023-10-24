//
//  Method.swift
//  Cocktails
//
//  Created by Brenda Saavedra Cantu on 24/10/23.
//

import Foundation

struct Method: Codable {
    let step1, step2, step3: String?

    enum CodingKeys: String, CodingKey {
        case step1 = "Step 1"
        case step2 = "Step 2"
        case step3 = "Step 3"
    }
}
