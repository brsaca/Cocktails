//
//  ContentLogic.swift
//  Cocktails
//
//  Created by Brenda Saavedra Cantu on 25/10/23.
//

import Foundation

@Observable
final class ContentLogic {
    static let shared = ContentLogic()
    
    let connection: ConnectionInteractor
    
    var cocktails: [Cocktail] = []
    
    var showEmptyView = false
    
    var isLoading = false
    
    var messageError = ""
    
    init(connection: ConnectionInteractor = Connection()) {
        self.connection = connection
    }
    
    func fetchCocktails() async {
        self.isLoading = true
        
        do {
            self.cocktails = try await connection.loadCocktails()
            self.isLoading = false
        } catch {
            self.messageError = error.localizedDescription
            self.showEmptyView = true
            self.isLoading = false
        }
    }
}
