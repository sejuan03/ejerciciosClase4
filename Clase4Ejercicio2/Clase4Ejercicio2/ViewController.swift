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
        static let bigError = "Error"
    }

    @IBOutlet weak var centigradesTextField: UITextField!
    @IBOutlet weak var resultFarenheitLabel: UILabel!
    
    var temperature = ""
    var temperatureIsNotEmpty = false
    var temperatureIsNumeric = false
    var message = ""
    
    @IBAction func convertButtonPressed(_ sender: Any) {
        validateTemperatureField()
        setConvertionMessageResult()
        showResultMessage()
    }
    
    private func validateTemperatureField() {
        temperature = centigradesTextField.text ?? ""
        temperatureIsNumeric = Double(temperature) != nil
        temperatureIsNotEmpty = !temperature.isEmpty
    }
    
    private func setConvertionMessageResult() {
        if temperatureIsNumeric && temperatureIsNotEmpty {
            message = processTemperature()
        } else if temperatureIsNotEmpty {
            message = Constant.writeNumberMessage
        } else {
            message = Constant.emptyField
        }
    }
    
    private func processTemperature() -> String {
        guard let temperatureNumeric = Double(temperature) else {
            return Constant.bigError
        }
        let farenheit = convertCentigradesToFarenheit(temperatureNumeric)
        return parseTemperature(farenheit) + " °F"
    }
    
    private func convertCentigradesToFarenheit(_ centigrades: Double) -> Double {
        return (centigrades*9/5)+32
    }
    
    private func parseTemperature(_ temperature: Double) -> String {
        return String(temperature.rounded(toPlaces: 2))
    }
    
    private func showResultMessage() {
        resultFarenheitLabel.text = message
        resultFarenheitLabel.isHidden = false
    }
}

