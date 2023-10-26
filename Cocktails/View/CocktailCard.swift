//
//  CocktailCard.swift
//  Cocktails
//
//  Created by Brenda Saavedra Cantu on 24/10/23.
//

import SwiftUI
import Kingfisher
import SwiftUIX

struct CocktailCard: View {
    // MARK: View Properties
    let cocktail: Cocktail
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                
                LikeButton(action: {}, size: 70)
            }
            .padding(20)
            Spacer()
            
            VStack(alignment: .leading) {
                Text(cocktail.title)
                    .font(.neue(.text, size: 26))
                    .frame(maxWidth: .infinity, alignment:.leading)
                Text(cocktail.difficulty.detail)
                    .font(.neue(.thin, size: 18))
                    .frame(maxWidth: .infinity, alignment:.leading)
            }
            .foregroundStyle(Color.cBlack)
            .frame(maxHeight: 80)
            .padding(.vertical)
            .padding(.horizontal)
            .background(
                VisualEffectBlurView(blurStyle: .systemMaterial)
            )
        }
        .frame(width: 300, height: 380)
        .background (
            KFImage(cocktail.image)
                .resizable()
                .scaledToFill()
        )
        .cornerRadius(30)
    }
}

// MARK: - Previews
#Preview {
    CocktailCard(cocktail: Cocktail.mock)
}
