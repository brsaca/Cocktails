//
//  Font.swift
//  Cocktails
//
//  Created by Brenda Saavedra Cantu on 24/10/23.
//

import SwiftUI

extension Font {
    enum NeuePlak {
        case black
        case bold
        case extrabold
        case light
        case semibold
        case regular
        case thin
        case ultralight
        case text
        
        var value: String {
            switch self {
            case .black: return "NeuePlak-Black"
            case .bold: return "NeuePlak-Bold"
            case .extrabold:  return "NeuePlak-ExtraBold"
            case .light: return "NeuePlak-Light"
            case .regular: return "NeuePlak-Regular"
            case .semibold: return "NeuePlak-SemiBold"
            case .thin: return "NeuePlak-Thin"
            case .ultralight: return "NeuePlak-UltraLight"
            case .text: return "NeuePlakText-Regular"
            }
        }
    }

    /**
     Returns a custom NeuePlak font with the specified type and size.

     - Parameters:
       - type: The NeuePlak type (e.g., .bold, .medium, .regular).
       - size: The size of the font (default is 24 points).

     - Returns: A custom `Font` with the specified NeuePlak type and size.
     */
    static func neue(_ type: NeuePlak, size: CGFloat = 24) -> Font {
        return .custom(type.value, size: size)
    }
}
