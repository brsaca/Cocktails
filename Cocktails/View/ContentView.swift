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
            
            // Options
            OptionsListView(selection: $selection)
                .padding(.horizontal, 20)
                .padding(.top, 30)
            
            // Drinks
            
            // TabBar
            Spacer()
            TabBarView(selectedTab: $tabActive)
        }
        .padding()
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
}

// MARK: - Previews
#Preview {
    ContentView()
}
