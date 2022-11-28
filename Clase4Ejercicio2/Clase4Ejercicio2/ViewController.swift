//
//  ViewController.swift
//  Clase4Ejercicio2
//
//  Created by Mac on 19/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    private struct Constant {
        static let emptyField = "Campo Vacio"
        static let writeNumberMessage = "Escribir un numero correcto"
    }

    @IBOutlet weak var centigradesTextField: UITextField!
    @IBOutlet weak var resultFarenheitLabel: UILabel!
    
    @IBAction func convertButtonPressed(_ sender: Any) {
        let grades = centigradesTextField.text ?? ""
        var emptyField: Bool
        emptyField = checkEmptyField(grades)
        processEmptyField(emptyField, grades)
    }
    
    private func checkEmptyField(_ grades: String) -> Bool {
        return grades.isEmpty
    }
    
    private func processEmptyField(_ emptyField: Bool, _ grades: String) {
        if emptyField {
            showResultMessage(Constant.emptyField)
        } else {
            processCentigrades(grades)
        }
    }
    
    private func showResultMessage(_ message: String) {
        resultFarenheitLabel.text = message
        resultFarenheitLabel.isHidden = false
    }
    
    private func processCentigrades(_ grades: String) {
        if let centigrades = Double(grades) {
            var farenheit = convertCentigradesToFarenheit(centigrades)
            showResultMessage(farenheit)
        } else {
            showResultMessage(Constant.writeNumberMessage)
        }
    }
    
    private func convertCentigradesToFarenheit(_ centigrades: Double) -> String {
        return String(((centigrades*9/5)+32).rounded(toPlaces: 2))
    }
}

