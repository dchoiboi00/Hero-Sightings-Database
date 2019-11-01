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

class AddHeroVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var heroPicker: UIPickerView!
    @IBOutlet weak var zodiacPicker: UIPickerView!
    
    var inputResidence: String?
    var inputLocation: String?
    var snapshot: UIImage?
    
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
        if inputResidence == nil || inputLocation == nil {
            emptyTextfieldAlert()
        } else {
            if let residence = inputResidence, let location = inputLocation {
                CoreDataStack.shared.saveHero(name: (HeroType(rawValue: heroPicker.selectedRow(inComponent: 0))?.title())!, image: Int16(heroPicker.selectedRow(inComponent: 0)), zodiac: (Zodiac(rawValue: zodiacPicker.selectedRow(inComponent: 0))?.title())!, residence: residence, location: location, snapshot: (snapshot?.toData() as NSData? ?? ((UIImage(named: "NYC")!.toData() as NSData?)!)))
                delegate?.addedHero()
            }
            presentingViewController?.dismiss(animated: true)
        }
    }
    
    @IBAction func onGalleryBtn(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    // MARK: - Empty Textfields Alert
    func emptyTextfieldAlert() {
        
        let alertMsg = "Please enter values for all the text fields."
        let alert = UIAlertController(title: "Warning", message: alertMsg, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        alert.popoverPresentationController?.permittedArrowDirections = []
        alert.popoverPresentationController?.sourceView = self.view
        alert.popoverPresentationController?.sourceRect = CGRect(x: self.view.frame.midX, y: self.view.frame.midY, width: 0, height: 0)
        
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage  {
            snapshot = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
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
