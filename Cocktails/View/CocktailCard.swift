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
                Button {
                    
                } label: {
                    ZStack {
                        Circle()
                            .frame(width: 50)
                            .foregroundColor(Color.gray.opacity(0.5))
                        Image(systemName: "heart.fill")
                            .foregroundColor(.yellow)
                    }
                }
            }
            .padding(30)
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    Text(cocktail.title)
                        .font(.neue(.text, size: 26))
                    Text(cocktail.difficulty.detail)
                        .font(.neue(.thin, size: 18))
                }
                .padding(.leading, 20)
                .padding(.vertical)
                
                Spacer()
                
                Text(cocktail.simplifiedTime)
                    .font(.neue(.semibold, size: 20))
                    .foregroundStyle(Color.cGreen)
                    .padding(.trailing, 20)
            }
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
