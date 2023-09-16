//
//  TableViewController.swift
//  D&D handbook
//
//  Created by Екатерина Теляубердина on 11.09.2023.
//

import UIKit

final class TableViewController: UITableViewController {
  
    private let networkManager = NetworkManager.shared
    private var allRaces: DnDRace!
    private var urls: [URL] = []
    private let raceImages = [#imageLiteral(resourceName: "dragonborn image"), #imageLiteral(resourceName: "dwarf image"), #imageLiteral(resourceName: "elf image"), #imageLiteral(resourceName: "gnome image"), #imageLiteral(resourceName: "halfelf image"), #imageLiteral(resourceName: "halforc image"), #imageLiteral(resourceName: "halfling image"), #imageLiteral(resourceName: "human fighter"), #imageLiteral(resourceName: "tiefling image")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(from: DnDAPI.racesURL.url)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        guard let raceVC = segue.destination as? RaceViewController else { return }
        raceVC.title = allRaces.results[indexPath.row].name
        let url = urls[indexPath.row]
        raceVC.url = url
        raceVC.image = raceImages[indexPath.row]
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allRaces?.results.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let cell = cell as? RaceCell else { return UITableViewCell() }
        cell.raceLabel.text = "✨ \(allRaces.results[indexPath.row].name)"
        return cell
    }
    
    // MARK: - Private methods
    private func fetchData(from url: URL?) {
        networkManager.fetch(DnDRace.self, from: url!) { [weak self] result in
            switch result {
            case .success(let jsonData):
                self?.allRaces = jsonData
                self?.allRaces.results.forEach({ race in
                    let url = URL(string: "https://www.dnd5eapi.co\(race.url)")!
                    self?.urls.append(url)
                })
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

