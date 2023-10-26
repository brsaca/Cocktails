//
//  ContentView.swift
//  Cocktails
//
//  Created by Brenda Saavedra Cantu on 24/10/23.
//

import SwiftUI


struct ContentView: View {
    // MARK: View Properties
    @State private var selection: Options = .New
    @State private var tabActive: Tab = .home
    @State var vm = ContentViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                // NavBar
                navBar
                    .padding(.horizontal, 20)
                
                // Options
                OptionsListView(selection: $selection)
                    .padding(.horizontal, 40)
                    .padding(.top, 20)
                
                // Drinks
                if vm.contentLogic.isLoading {
                    Spacer()
                    ProgressView()
                    Spacer()
                } else {
                    if vm.contentLogic.showEmptyView {
                        ContentUnavailableView(
                            "Error",
                            systemImage: "exclamationmark.warninglight",
                            description: Text(vm.contentLogic.messageError)
                        )
                    } else {
                        cocktailsList
                            .padding(.leading, 20)
                    }
                }
                // TabBar
                TabBarView(selectedTab: $tabActive)
            }
            .task {
                await vm.contentLogic.fetchCocktails()
            }
        }
    }
}
 
extension ContentView{
    var navBar: some View {
        VStack(alignment: .leading, spacing: 34) {
            HStack {
                Spacer()
                
                Image(systemName: "app.dashed")
                    .resizable()
                    .frame(width: 40, height: 40)
            }
            
            Text("It's amazing cocktails")
                .font(.neue(.black, size: 48))
        }
        .padding(.horizontal, 20)
    }
    
    var cocktailsList: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 20) {
                ForEach(vm.contentLogic.cocktails) { cocktail in
                    NavigationLink {
                        CocktailDetailView(cocktail: cocktail)
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        CocktailCard(cocktail: cocktail)
                    }
                }
            }
        }
    }
}

// MARK: - Previews
#Preview {
    ContentView()
}
