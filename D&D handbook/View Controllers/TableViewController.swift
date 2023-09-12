//
//  TableViewController.swift
//  D&D handbook
//
//  Created by Екатерина Теляубердина on 11.09.2023.
//

import UIKit

enum Link {
    case raceURL
    case dragonbornURL
    case dwarfURL
    case elfURL
    case gnomeURL
    case halfelfURL
    case halforcURL
    case halflingURL
    case humanURL
    case tieflingURL
    
    var url: URL {
        switch self {
        case .raceURL:
            return URL(string: "https://www.dnd5eapi.co/api/races")!
        case .dragonbornURL:
            return URL(string: "https://www.dnd5eapi.co/api/races/dragonborn")!
        case .dwarfURL:
            return URL(string: "https://www.dnd5eapi.co/api/races/dwarf")!
        case .elfURL:
            return URL(string: "https://www.dnd5eapi.co/api/races/elf" )!
        case .gnomeURL:
            return URL(string: "https://www.dnd5eapi.co/api/races/gnome")!
        case .halfelfURL:
            return URL(string: "https://www.dnd5eapi.co/api/races/half-elf")!
        case .halforcURL:
            return URL(string: "https://www.dnd5eapi.co/api/races/half-orc")!
        case .halflingURL:
            return URL(string: "https://www.dnd5eapi.co/api/races/halfling")!
        case .humanURL:
            return URL(string: "https://www.dnd5eapi.co/api/races/human")!
        case .tieflingURL:
            return URL(string: "https://www.dnd5eapi.co/api/races/tiefling")!
        }
    }
}

final class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchRace()
        print()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 10
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    // MARK: - Private methods
    private func fetchRace() {
        
        URLSession.shared.dataTask(with: Link.elfURL.url) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let race = try decoder.decode(Race.self, from: data)
                print(race)
            } catch let error {
                print(String(describing: error))
            }
        }.resume()
    }
}
