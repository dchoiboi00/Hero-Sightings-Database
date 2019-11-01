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
        if let newValue = sender.text {
            inputResidence = newValue
        }
    }
    
    @IBAction func onLocationChange(_ sender: UITextField) {
        if let newValue = sender.text {
            inputLocation = newValue
        }
    }
    
    @IBAction func onCancel(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func onAdd(_ sender: UIButton) {
        if let residence = inputResidence, let location = inputLocation {
            CoreDataStack.shared.saveHero(name: "Placeholder", image: Int16(heroPicker.selectedRow(inComponent: 0)), zodiac: "Placeholder", residence: residence, location: location, snapshot: (UIImage(named: "batman")?.toData() as NSData?)!)
            delegate?.addedHero()
        }
        presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func onGalleryBtn(_ sender: UIButton) {
        
    }
    
    
}

extension AddHeroVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return HeroType.allValues.count
        } else {
            return Zodiac.allValues.count
        }
    }
}
extension AddHeroVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            return HeroType(rawValue: row)?.title()
        } else {
            return Zodiac(rawValue: row)?.title()
        }
    }
}

extension UIImage {
    
    func toData() -> Data? {
        return pngData()
    }
    
}
