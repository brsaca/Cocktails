//
//  Previews.swift
//  Cocktails
//
//  Created by Brenda Saavedra Cantu on 24/10/23.
//

import Foundation

extension Cocktail {
    static let mock = Cocktail(
                        id: "1",
                        title: "Aperol spritz",
                        difficulty: .easy,
                        image: URL(string: "https://apipics.s3.amazonaws.com/coctails_api/45.jpg")!,
                        portion: "Serves 6-8",
                        time: "Hands-on time 5 min",
                        description: "Get into the spirit of summer with this classic Italian recipe. Chilled prosecco and Aperol come together to create the beloved Aperol spritz.",
                        ingredients: [
                            "750ml bottle of prosecco",
                            "Bag of ice",
                            "Bottle of Aperol",
                            "Bottle of soda water",
                            "Slice of orange"
                        ],
                        method: [Method(
                            step1: "Chill the bottle of prosecco and Aperol in the fridge.",
                            step2: "Fill 6 or 8 wine glasses or tall tumblers with a couple of ice cubes and roughly three parts prosecco to one part Aperol.",
                            step3: "Add a splash of soda water and a slice of orange. Serve straightaway so that the fizz stays lively."
                        )]
    )
}
