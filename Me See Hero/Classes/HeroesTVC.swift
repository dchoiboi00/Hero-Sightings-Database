//
//  HeroesTVC.swift
//  Me See Hero
//
//  Created by Daniel Choi on 10/31/19.
//  Copyright © 2019 Daniel Choi. All rights reserved.
//

import UIKit

class HeroesTVC: UITableViewController, AddHeroDelegate {
    
    var alertedUserAllSighted = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        CoreDataStack.shared.update()
        
        self.title = NSLocalizedString("str_tvcTitle", comment: "")
        
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
        
        
        //Notifies user when all heroes were sighted, but only ONCE
        var checklist = [false, false, false, false, false]
        for sighting in CoreDataStack.shared.sightings {
            let hero = sighting as? Hero
            switch hero?.image {
            case 0:
                checklist[0] = true
            case 1:
                checklist[1] = true
            case 2:
                checklist[2] = true
            case 3:
                checklist[3] = true
            case 4:
                checklist[4] = true
            default:
                print(NSLocalizedString("str_failedIdentifyHero", comment: ""))
                
            }
        }
        if !checklist.contains(false) && !alertedUserAllSighted {
            allSightedAlert()
            alertedUserAllSighted = true
        }
        
        
        return cell
    }
  
    // disallow swipe deletion when not in edit mode
    #if !DEBUG
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return tableView.isEditing ? .delete : .none
    }
    #endif
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let hero = CoreDataStack.shared.sightings[indexPath.row] as? Hero {
                deletionAlert(title: hero.name!) { _ in
                    CoreDataStack.shared.deleteHero(hero: hero)
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    // MARK: - Deletion Alert
    
    func deletionAlert(title: String, completion: @escaping (UIAlertAction) -> Void) {
        
        let alertMsg = String(format: NSLocalizedString("str_deletionAlertMsg", comment: ""), "\(title)")
        let alert = UIAlertController(title: NSLocalizedString("str_warning", comment: ""), message: alertMsg, preferredStyle: .actionSheet)
        
        let deleteAction = UIAlertAction(title: NSLocalizedString("str_delete", comment: ""), style: .destructive, handler: completion)
        let cancelAction = UIAlertAction(title: NSLocalizedString("str_cancel", comment: ""), style: .default, handler:nil)
        
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)

        alert.popoverPresentationController?.permittedArrowDirections = []
        alert.popoverPresentationController?.sourceView = self.view
        alert.popoverPresentationController?.sourceRect = CGRect(x: self.view.frame.midX, y: self.view.frame.midY, width: 0, height: 0)
        
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Other Alerts
    
    func allSightedAlert() {
        
        let alertMsg = NSLocalizedString("str_allSightedAlertMsg", comment: "")
        let alert = UIAlertController(title: NSLocalizedString("str_congratulations", comment: ""), message: alertMsg, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: NSLocalizedString("str_okay", comment: ""), style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        alert.popoverPresentationController?.permittedArrowDirections = []
        alert.popoverPresentationController?.sourceView = self.view
        alert.popoverPresentationController?.sourceRect = CGRect(x: self.view.frame.midX, y: self.view.frame.midY, width: 0, height: 0)
        
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Delegate
    
    func addedHero() {
        tableView.reloadData()
    }
    
    // MARK: - Actions
    
    @IBAction func onToggleEditing(_ sender: UIBarButtonItem) {
        setEditing(!isEditing, animated: true)
    }
    
}
