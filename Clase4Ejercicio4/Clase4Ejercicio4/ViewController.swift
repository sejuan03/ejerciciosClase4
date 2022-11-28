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
    
    var animalImageExists = false
    var animalImage = Constant.notImageFound
            
    @IBAction func findButtonPressed(_ sender: Any) {
        checkAnimalImageExists()
        setAnimalImage()
        showAnimalImage()
    }
    
    private func checkAnimalImageExists() {
        let animal = animalTextField.text ?? ""
        animalImageExists = UIImage(named: animal) != nil
    }
    
    private func setAnimalImage(){
        guard let animal = animalTextField.text else {
            return
        }
        if animalImageExists {
            animalImage = UIImage(named: animal)
        } else {
            animalImage = Constant.notImageFound
        }
    }
    
    private func showAnimalImage() {
        guard let animalImage = animalImage else {
            return
        }
        animalImageView.image = animalImage
        animalImageView.isHidden = false
    }
}

