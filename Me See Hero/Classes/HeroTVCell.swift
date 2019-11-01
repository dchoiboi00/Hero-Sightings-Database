//
//  HeroTVCell.swift
//  Me See Hero
//
//  Created by Daniel Choi on 10/31/19.
//  Copyright © 2019 Daniel Choi. All rights reserved.
//

import UIKit

class HeroTVCell: UITableViewCell {

    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var heroLabel: UILabel!
    @IBOutlet weak var residenceLabel: UILabel!
    @IBOutlet weak var zodiacLabel: UILabel!
    @IBOutlet weak var livesInLabel: UILabel!
    @IBOutlet weak var zodiacSignLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        livesInLabel.text = NSLocalizedString("str_livesIn", comment: "")
        zodiacSignLabel.text = NSLocalizedString("str_zodiacSign", comment: "")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func updateImage(type: Int) {
        if let heroType = HeroType(rawValue: type) {
            heroImageView.image = heroType.image()
        }
    }
}
