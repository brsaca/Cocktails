//
//  CocktailDetailLogic.swift
//  Cocktails
//
//  Created by Brenda Saavedra Cantu on 25/10/23.
//

import Foundation

@Observable
final class CocktailDetailLogic {
    static let shared = CocktailDetailLogic()
    
    let connection: ConnectionInteractor
    
    var cocktail: Cocktail?
    
    var showEmptyView = false
    
    var isLoading = false
    
    var messageError = ""
    
    init(connection: ConnectionInteractor = Connection()) {
        self.connection = connection
    }
    
    func fetchCocktail(for id: String) async {
        self.isLoading = true
        
        do {
            self.cocktail = try await connection.loadCocktailDetail(for: id)
            self.isLoading = false
        } catch {
            self.messageError = error.localizedDescription
            self.showEmptyView = true
            self.isLoading = false
        }
    }
    
}
