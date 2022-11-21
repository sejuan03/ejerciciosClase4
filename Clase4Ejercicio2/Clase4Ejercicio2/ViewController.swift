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
        checkEmptyField()
    }
    
    private func checkEmptyField() {
        let grades = centigradesTextField.text ?? ""
        if grades.isEmpty {
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
            convertCentigradesToFarenheit(centigrades)
        } else {
            showResultMessage(Constant.writeNumberMessage)
        }
    }
    
    private func convertCentigradesToFarenheit(_ centigrades: Double) {
        var farenheit: Double
        farenheit = (centigrades*9/5)+32
        showResultMessage(String(farenheit.rounded(toPlaces: 2))+" °F")
    }
}

