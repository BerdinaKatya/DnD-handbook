//
//  RaceViewController.swift
//  D&D handbook
//
//  Created by Екатерина Теляубердина on 13.09.2023.
//

import UIKit

final class RaceViewController: UIViewController {
    
    var url: URL!
    var image: UIImage!

    @IBOutlet weak var infoRaceLabel: UILabel!
    @IBOutlet weak var raceImage: UIImageView!
    
    private let networkManager = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchRace(from: url)
        raceImage.image = image
    }
}

// MARK: - Networking
extension RaceViewController {
    func fetchRace(from url: URL?) {
        networkManager.fetch(Race.self, from: url!) { [weak self] result in
            switch result {
            case .success(let race):
                self?.infoRaceLabel.text = race.description
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
