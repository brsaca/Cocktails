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
    
    var body: some View {
        VStack {
            // NavBar
            navBar
                .padding(.horizontal, 20)
            
            // Options
            OptionsListView(selection: $selection)
                .padding(.horizontal, 40)
                .padding(.top, 20)
            
            // Drinks
            cocktailsList
                .padding(.leading, 20)
            
            // TabBar
            TabBarView(selectedTab: $tabActive)
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
                ForEach(1..<6) { cocktailIndex in
                    CocktailCard(cocktail: Cocktail.mock)
                }
            }
        }
    }
}

// MARK: - Previews
#Preview {
    ContentView()
}
