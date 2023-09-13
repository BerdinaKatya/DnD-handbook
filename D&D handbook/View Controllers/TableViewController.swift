//
//  TableViewController.swift
//  D&D handbook
//
//  Created by Екатерина Теляубердина on 11.09.2023.
//

import UIKit

enum Link {
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

enum RacesAction: CaseIterable {
    case showDragonborn
    case showDwarf
    case showElf
    case showGnome
    case showHalfelf
    case showHalforc
    case showHalfling
    case showHuman
    case showTiefling
    
    var title: String {
        switch self {
        case .showDragonborn:
            return "Dragonborn"
        case .showDwarf:
            return "Dwarf"
        case .showElf:
            return "Elf"
        case .showGnome:
            return "Gnome"
        case .showHalfelf:
            return "Half - Elf"
        case .showHalforc:
            return "Half - Orc"
        case .showHalfling:
            return "Halfling"
        case .showHuman:
            return "Human"
        case .showTiefling:
            return "Tiefling"
        }
    }
}

final class TableViewController: UITableViewController {
    
    private let races = RacesAction.allCases
    private let networkManager = NetworkManager.shared
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        races.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let cell = cell as? RaceCell else { return UITableViewCell() }
        cell.raceLabel.text = "✨ \(races[indexPath.row].title)"
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        guard let raceVC = segue.destination as? RaceViewController else { return }
        raceVC.title = races[indexPath.row].title
    }
}

