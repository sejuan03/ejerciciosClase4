//
//  ViewController.swift
//  Clase4Ejercicio3
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
    @IBOutlet weak var farenheitTextField: UITextField!
    @IBOutlet weak var resultFarenheitLabel: UILabel!
    @IBOutlet weak var resultCentigradesLabel: UILabel!
    
    var convertCelsius = false
    
    @IBAction func convertButtonToFarenheitPressed(_ sender: Any) {
        convertCelsius = true
        checkEmptyField(centigradesTextField.text)
    }
    
    @IBAction func convertButtonToCentigradesPressed(_ sender: Any) {
        convertCelsius = false
        checkEmptyField(farenheitTextField.text)
    }
    
    private func checkEmptyField(_ gradesField: String?) {
        let grades = gradesField ?? ""
        if grades.isEmpty {
            showResultMessage(Constant.emptyField)
        } else {
            processGrades(grades)
        }
    }
    
    private func showResultMessage(_ message: String) {
        if convertCelsius {
            resultFarenheitLabel.text = message
            resultFarenheitLabel.isHidden = false
            //resultCentigradesLabel.isHidden = true
        } else {
            resultCentigradesLabel.text = message
            resultCentigradesLabel.isHidden = false
            //resultFarenheitLabel.isHidden = true
        }
    }
    
    private func processGrades(_ grades: String) {
        if let doubleGrades = Double(grades) {
            defineWhichTemperatureOperation(doubleGrades)
        } else {
            showResultMessage(Constant.writeNumberMessage)
        }
    }
    
    private func defineWhichTemperatureOperation(_ grades: Double) {
        if convertCelsius {
            convertCentigradesToFarenheit(grades)
        } else {
            convertFarenheitToCentigrades(grades)
        }
    }
    
    private func convertCentigradesToFarenheit(_ centigrades: Double) {
        var farenheit: Double
        farenheit = (centigrades*9/5)+32
        showResultMessage(String(farenheit.rounded(toPlaces: 2))+" °F")
    }
    
    private func convertFarenheitToCentigrades(_ farenheit: Double) {
        var celsius: Double
        celsius = (farenheit-32)*5/9
        showResultMessage(String(celsius.rounded(toPlaces: 2))+" °C")
    }
}

