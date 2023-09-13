//
//  RaceViewController.swift
//  D&D handbook
//
//  Created by Екатерина Теляубердина on 13.09.2023.
//

import UIKit

final class RaceViewController: UIViewController {

    private let networkManager = NetworkManager.shared

    @IBOutlet weak var infoRaceLabel: UILabel!
    @IBOutlet weak var raceImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDragonborn()
        raceImage.image = UIImage(named: "dragonborn image.png")
    }
}

// MARK: - Networking
extension RaceViewController {
    func fetchDragonborn() {
        networkManager.fetch(Race.self, from: Link.dragonbornURL.url) { [weak self] result in
            switch result {
            case .success(let dragonbornRace):
                self?.infoRaceLabel.text = """
                    Speed: \(dragonbornRace.speed)

                    Alignment: \(dragonbornRace.alignment)

                    Age: \(dragonbornRace.age)

                    Size: \(dragonbornRace.size). \(dragonbornRace.sizeDescription)

                    Languages: \(dragonbornRace.languageDesc)

                    """

            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
