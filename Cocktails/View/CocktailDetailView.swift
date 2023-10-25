//
//  CocktailDetailView.swift
//  Cocktails
//
//  Created by Brenda Saavedra Cantu on 25/10/23.
//

import SwiftUI
import Kingfisher

struct CocktailDetailView: View {
    // MARK: View Properties
    let cocktail: Cocktail
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ZStack(alignment: .topLeading) {
                // Image
                KFImage(cocktail.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: .infinity, height: UIScreen.main.bounds.size.height * 0.4, alignment: .topLeading)
                
                // Like
                HStack {
                    Spacer()
                    LikeButton(action: {}, size: 70)
                }
                .padding(.top, 60)
                .padding(.trailing, 30)
                
                // Info Container
                InfoContainer(cocktail: cocktail)
                .offset(y: UIScreen.main.bounds.size.height * 0.5)
                
                // Cook Button
                
            }
        }
        .ignoresSafeArea(.all)
    }
}

// MARK: - Previews
#Preview {
    CocktailDetailView(cocktail: Cocktail.mock)
}
