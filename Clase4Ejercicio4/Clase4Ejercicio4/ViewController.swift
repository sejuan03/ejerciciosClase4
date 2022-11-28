//
//  ViewController.swift
//  Clase4Ejercicio4
//
//  Created by Mac on 21/11/22.
//

import UIKit

class ViewController: UIViewController {

    private struct Constant {
        static let notImageFound = UIImage(named: "interrogante")
    }
    
    @IBOutlet weak var animalTextField: UITextField!
    @IBOutlet weak var animalImageView: UIImageView!
            
    @IBAction func findButtonPressed(_ sender: Any) {
        checkAnimalImageExists()
    }
    
    private func checkAnimalImageExists() {
        let animal = animalTextField.text ?? ""
        let animalImage = UIImage(named: animal)
        if let animalImage {
            showAnimalImage(animalImage)
        } else {
            showAnimalImage(Constant.notImageFound!)
        }
    }
    
    private func showAnimalImage(_ image: UIImage) {
        animalImageView.image = image
        animalImageView.isHidden = false
    }
    
}

