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
        
        self.title = hero?.location
        if let type = hero?.image {
            updateImage(type: Int(type))
        }
        if let imageData = hero?.snapshot {
            snapshotImageView.image = UIImage(data: imageData as Data)
        }
        
        randomlyPlaceHero()
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
    
    func randomlyPlaceHero() {
        switch UIDevice.current.orientation {
        case .portrait:
            let x = Int.random(in: 85 ..< 395), y = Int.random(in: 340 ..< 625)
            heroImageView.frame.origin.x = CGFloat(x)
            heroImageView.frame.origin.y = CGFloat(y)
        case .portraitUpsideDown:
            let x = Int.random(in: 85 ..< 395), y = Int.random(in: 340 ..< 625)
            heroImageView.frame.origin.x = CGFloat(x)
            heroImageView.frame.origin.y = CGFloat(y)
        case .landscapeLeft:
            let x = Int.random(in: 210 ..< 570), y = Int.random(in: 200 ..< 510)
            heroImageView.frame.origin.x = CGFloat(x)
            heroImageView.frame.origin.y = CGFloat(y)
        case .landscapeRight:
            let x = Int.random(in: 210 ..< 570), y = Int.random(in: 200 ..< 510)
            heroImageView.frame.origin.x = CGFloat(x)
            heroImageView.frame.origin.y = CGFloat(y)
        default:
            heroImageView.frame.origin.x = self.view.frame.midX
            heroImageView.frame.origin.y = self.view.frame.midY
        }
    }
}
