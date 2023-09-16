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
     
    var isTraits: String {
        traits.isEmpty ? " " :
        """
        Traits
        \(traits.map({ $0.name }).joined(separator: ", "))
        """
    }
    
    var isSubraces: String {
        subraces.isEmpty ? " " :
        """
        Subraces
        \(subraces.map({ $0.name }).joined(separator: ", "))
        """
    }
    
    var description: String {
        """
    Speed
    \(speed)

    Alignment
    \(alignment)

    Age
    \(age)

    Size
    \(size). \(sizeDescription)

    Languages
    \(languageDesc)
    
    \(isTraits)
    
    \(isSubraces)
    
    """
    }
}

struct Name: Decodable {
    let index: String
    let name: String
    let url: URL
}

enum DnDAPI {
    case racesURL
    
    var url: URL {
        switch self {
        case .racesURL:
            return URL(string: "https://www.dnd5eapi.co/api/races")!
        }
    }
}
