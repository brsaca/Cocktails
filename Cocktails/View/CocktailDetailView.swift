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
    let cocktailId: String
    @State var vm = CocktailDetailViewModel()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing:0) {
                ZStack(alignment: .topLeading) {
                    // Image
                    if let image = vm.cocktailDetailLogic.cocktail?.image {
                        KFImage(image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: .infinity, height: UIScreen.main.bounds.size.height * 0.4, alignment: .topLeading)
                    }
                    // Like
                    HStack {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.white)
                            .onTapGesture {
                                
                            }
                        
                        Spacer()
                        
                        LikeButton(action: {}, size: 70)
                    }
                    .padding(.top, 60)
                    .padding(.horizontal, 30)
                }
                
                // Info Container
                if let cocktail = vm.cocktailDetailLogic.cocktail {
                    InfoContainer(cocktail: cocktail)
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .task {
                await vm.cocktailDetailLogic.fetchCocktail(for: cocktailId)
            }
        }
        .ignoresSafeArea(.all)
    }
}

// MARK: - Previews
#Preview {
    CocktailDetailView(cocktailId: Cocktail.mock.id)
}
