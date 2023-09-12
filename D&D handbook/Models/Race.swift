//
//  Race.swift
//  D&D handbook
//
//  Created by Екатерина Теляубердина on 11.09.2023.
//

import Foundation

struct Result: Decodable {
    let count: Int
    let results: [Name]
}

struct Race: Decodable {
    let index: String
    let name: String
    let speed: Int
    let ability_bonuses: [AbilityBonus]
    let age: String
    let alignment: String
    let size: String
    let size_description: String
    let starting_proficiencies: [Name]
    let languages: [Name]
    let language_desc: String
    let traits: [Name]
    let subraces: [Name]
    let url: String
}

struct AbilityBonus: Decodable {
    let abilityScore: [Name]?
    let bonus: Int
}

struct Name: Decodable {
    let index: String
    let name: String
    let url: String
}
