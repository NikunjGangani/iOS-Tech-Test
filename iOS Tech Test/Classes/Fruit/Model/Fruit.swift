//
//  Fruit.swift
//  iOS Tech Test
//
//  Created by Nikunj Gangani on 13/01/23.
//

import Foundation

// MARK: - Fruit
struct Fruit: Codable {
    let genus, name: String
    let id: Int
    let family, order: String
    let nutritions: Nutritions
}

// MARK: - Nutritions
struct Nutritions: Codable {
    let carbohydrates, protein, fat: Double
    let calories: Int
    let sugar: Double
}
