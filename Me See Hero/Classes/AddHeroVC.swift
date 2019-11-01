//
//  AddHeroVC.swift
//  Me See Hero
//
//  Created by Daniel Choi on 10/31/19.
//  Copyright © 2019 Daniel Choi. All rights reserved.
//

import UIKit

protocol AddHeroDelegate: class {
    func addedHero()
}

class AddHeroVC: UIViewController {

    @IBOutlet weak var heroPicker: UIPickerView!
    @IBOutlet weak var zodiacPicker: UIPickerView!
    
    var inputResidence: String?
    var inputLocation: String?
    
    weak var delegate: AddHeroDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Actions
    @IBAction func onResidenceChange(_ sender: UITextField) {
        
    }
    
    @IBAction func onLocationChange(_ sender: UITextField) {
        
    }
    
    @IBAction func onCancel(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func onAdd(_ sender: UIButton) {
        
    }
    
}
