//
//  ContentViewModel.swift
//  Cocktails
//
//  Created by Brenda Saavedra Cantu on 25/10/23.
//

import Foundation

@Observable
final class ContentViewModel {
    var contentLogic: ContentLogic
    
    init(contentLogic: ContentLogic = .shared) {
        self.contentLogic = contentLogic
    }
}
