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
            // Image
            ZStack {
                KFImage(cocktail.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: .infinity, height: UIScreen.main.bounds.size.height * 0.4, alignment: .topLeading)
                
                HStack {
                    Spacer()
                    LikeButton(action: {}, size: 50)
                }
                .padding(.top, -100)
                .padding(.trailing, 30)
            }
            
            // Info Container
        }
        .ignoresSafeArea()
    }
}

// MARK: - Previews
#Preview {
    CocktailDetailView(cocktail: Cocktail.mock)
}
