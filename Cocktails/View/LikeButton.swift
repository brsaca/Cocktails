//
//  LikeButton.swift
//  Cocktails
//
//  Created by Brenda Saavedra Cantu on 25/10/23.
//

import SwiftUI

struct LikeButton: View {
    // MARK: View Properties
    let action: () -> Void
    let size: CGFloat
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Circle()
                    .frame(width: size)
                    .foregroundColor(Color.gray.opacity(0.5))
                Image(systemName: "heart.fill")
                    .resizable()
                    .foregroundColor(.yellow)
                    .frame(width: 20, height: 20)
            }
        }
    }
}

// MARK: - Previews
#Preview {
    LikeButton(action:{}, size: 50)
}
