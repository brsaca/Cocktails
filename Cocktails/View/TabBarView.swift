//
//  TabBarView.swift
//  Cocktails
//
//  Created by Brenda Saavedra Cantu on 24/10/23.
//

import SwiftUI

enum Tab: CaseIterable {
    case home, recepies, favorites, profile
    
    var image: String {
        switch self {
        case .home: "wineglass"
        case .recepies: "doc.on.doc"
        case .favorites: "bookmark"
        case .profile: "person"
        }
    }
}

struct TabBarView: View {
    //MARK: View Properties
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.self) { tab in
                getTabIcon(for: tab)
                if tab != .profile {
                    Spacer()
                }
            }
        }
        .padding()
        .background(Color.cGreen)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal, 20)
        .padding(.bottom, 10)
    }
}

extension TabBarView {
    @ViewBuilder
    func getTabIcon(for tab: Tab) -> some View {
        Button{
            selectedTab = tab
        } label: {
            Image(systemName: "\(tab.image)\(tab == selectedTab ? ".fill" : "")")
                .font(.title2)
                .foregroundStyle(.white)
                .padding()
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Previews
#Preview {
    TabBarView(selectedTab: .constant(.home))
}
