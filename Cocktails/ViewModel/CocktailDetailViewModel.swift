//
//  CocktailDetailViewModel.swift
//  Cocktails
//
//  Created by Brenda Saavedra Cantu on 25/10/23.
//

import Foundation

@Observable
final class CocktailDetailViewModel {
    var cocktailDetailLogic: CocktailDetailLogic
    
    init(cocktailDetailLogic: CocktailDetailLogic = .shared) {
        self.cocktailDetailLogic = cocktailDetailLogic
    }
}

