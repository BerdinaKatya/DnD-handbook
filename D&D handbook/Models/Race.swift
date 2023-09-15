//
//  Race.swift
//  D&D handbook
//
//  Created by Екатерина Теляубердина on 11.09.2023.
//

import Foundation

struct DnDRace: Decodable {
    let count: Int
    let results: [Name]
}

struct Race: Decodable {
    let index: String
    let name: String
    let speed: Int
    let abilityBonuses: [AbilityBonus]
    let age: String
    let alignment: String
    let size: String
    let sizeDescription: String
    let startingProficiencies: [Name]
    let languages: [Name]
    let languageDesc: String
    let traits: [Name]
    let subraces: [Name]
    let url: URL
    
    var description: String {
        """
    Speed: \(speed)

    Alignment: \(alignment)

    Age: \(age)

    Size: \(size). \(sizeDescription)

    Languages: \(languageDesc)

    """
    }
}

struct AbilityBonus: Decodable {
    let abilityscore: [Name]?
    let bonus: Int
}

struct Name: Decodable {
    let index: String
    let name: String
    let url: URL
}

enum RickAndMortyAPI {
    case baseURL
    
    var url: URL {
        switch self {
        case .baseURL:
            return URL(string: "https://www.dnd5eapi.co/api/races")!
        }
    }
}
