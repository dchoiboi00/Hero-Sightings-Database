//
//  HeroesTVC.swift
//  Me See Hero
//
//  Created by Daniel Choi on 10/31/19.
//  Copyright © 2019 Daniel Choi. All rights reserved.
//

import UIKit

class HeroesTVC: UITableViewController, AddHeroDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        CoreDataStack.shared.update()
        
        self.title = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.reloadData()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "AddHeroSegue":
            if let vc = segue.destination as? AddHeroVC {
                vc.delegate = self
            }
        case "DetailViewSegue":
            if let vc = segue.destination as? DetailVC {
                if let indexPath = tableView.indexPathForSelectedRow {
                    vc.hero = CoreDataStack.shared.sightings[indexPath.row] as? Hero
                }
            }
        default:
            fatalError("Invalid segue identifier")
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CoreDataStack.shared.sightings.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HeroTVCell") as? HeroTVCell else {
            fatalError("Expected HeroTVCell")
        }
        
        if let hero = CoreDataStack.shared.sightings[indexPath.row] as? Hero {
            cell.heroLabel?.text = hero.name
            cell.residenceLabel?.text = hero.residence
            cell.zodiacLabel?.text = hero.zodiac
            cell.updateImage(type: Int(hero.image))
        }

        return cell
    }
  
    // MARK: - Delegate
    
    func addedHero() {
        tableView.reloadData()
    }

}
