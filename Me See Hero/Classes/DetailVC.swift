//
//  DetailVC.swift
//  Me See Hero
//
//  Created by Daniel Choi on 10/31/19.
//  Copyright © 2019 Daniel Choi. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    
    @IBOutlet weak var snapshotImageView: UIImageView!
    @IBOutlet weak var heroImageView: UIImageView!
    
    var hero: Hero?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = hero?.name
        if let type = hero?.image {
            updateImage(type: Int(type))
        }
//        if let imageData = hero?.snapshot {
//            snapshotImageView.image = UIImage(data: imageData as Data)
//        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        snapshotImageView.layer.borderWidth = 6
        snapshotImageView.layer.cornerRadius = snapshotImageView.bounds.width/2
        snapshotImageView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func updateImage(type: Int) {
        if let heroType = HeroType(rawValue: type) {
            heroImageView.image = heroType.image()
        }
    }
}
