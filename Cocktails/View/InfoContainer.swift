//
//  InfoContainer.swift
//  Cocktails
//
//  Created by Brenda Saavedra Cantu on 25/10/23.
//

import SwiftUI

struct InfoContainer: View {
    // MARK: View Properties
    let cocktail: Cocktail
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(cocktail.title)
                .font(.neue(.bold, size: 34))
            
            Text(cocktail.difficulty.detail)
                .foregroundStyle(Color.cGreen)
                .font(.neue(.text, size: 18))
            
            rateContainer
            
            if let ingredients = cocktail.ingredients {
                getIngredientsContainer(for: ingredients)
            }
            
            if let methodSteps = cocktail.method {
                getSteps(for: methodSteps)
            }
            
            // Cook Button
            Button {
                
            } label: {
                Text("Start Cook!")
                    .font(.neue(.text, size: 30))
                    .foregroundStyle(Color.cBlack)
                    .frame(maxWidth: .infinity, minHeight: 80)
                    .background(Color.cYellow)
                    .cornerRadius(20)
                    .padding()
            }
        }
        .padding(.top, 40)
        .foregroundStyle(Color.text)
        .padding(.horizontal, 30)
        .background(.white)
        .cornerRadius(30)
    }
}

extension InfoContainer {
    enum RateType {
        case time
        case portion
        
        var image: String {
            switch (self) {
            case .time: "clock.fill"
            case .portion: "fork.knife.circle.fill"
            }
        }
        
        var color: Color {
            switch (self) {
            case .time: Color.gray
            case .portion: Color.cYellow
            }
        }
    }
    
    var rateContainer: some View {
        HStack(spacing: 40) {
            getRateInfo(for: .time)
            getRateInfo(for: .portion)
            Spacer()
        }
        .padding(.vertical, 20)
    }
    
    @ViewBuilder
    func getRateInfo(for rate:RateType) -> some View {
        HStack(spacing: 10) {
            Image(systemName: rate.image)
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundStyle(rate.color)
            
            Text(rate == .time ? cocktail.simplifiedTime : cocktail.portion ?? "")
                .font(.neue(.text, size: 14))
        }
    }
    
    @ViewBuilder
    func getIngredientsContainer(for ingredients: [String]) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Ingredients")
                .font(.neue(.semibold, size: 18))
            
            ForEach(ingredients, id:\.self) { ingredient in
                Text("- \(ingredient)")
                    .font(.neue(.thin, size: 18))
            }
        }
    }
    
    @ViewBuilder
    func getSteps(for method: [Method]) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Method steps")
                .font(.neue(.semibold, size: 18))
            
            if let step1 = method[0].step1 {
                Text("- \(step1)")
                    .font(.neue(.thin, size: 18))
            }
            
            if let step2 = method[0].step2 {
                Text("- \(step2)")
                    .font(.neue(.thin, size: 18))
            }
            
            if let step3 = method[0].step3 {
                Text("- \(step3)")
                    .font(.neue(.thin, size: 18))
            }
        }
    }
}

// MARK: - Previews
#Preview {
    InfoContainer(cocktail: Cocktail.mock)
        .background(Color.systemGray)
}
