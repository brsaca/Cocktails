//
//  OptionsListView.swift
//  Cocktails
//
//  Created by Brenda Saavedra Cantu on 24/10/23.
//

import SwiftUI

enum Options: String, CaseIterable {
    case Popular
    case New
    case Favorites
}

struct OptionsListView: View {
    //MARK: View Properties
    @Binding var selection: Options
    
    var body: some View {
        HStack {
            ForEach(Options.allCases, id:\.self) { option in
                HStack {
                    Text(option.rawValue)
                        .font(.neue(selection == option ? .semibold : .regular, size: 20))
                        .foregroundStyle(selection == option ? Color.text : Color.text.opacity(0.4))
                        .background(
                            GeometryReader { geometry in
                                Color.clear
                                    .overlay(
                                        Rectangle()
                                            .frame(width: geometry.size.width, height: selection == option ? 1 : 0)
                                        
                                        .foregroundColor(Color.text)
                                            .offset(y: 15)
                                    )
                            }
                        )
                        .onTapGesture {
                            selection = option
                        }
                    
                    
                    if option != .Favorites {
                        Spacer()
                    }
                }
            }
        }
    }
}

// MARK: - Previews
#Preview {
    OptionsListView(selection: .constant(.Favorites))
}
