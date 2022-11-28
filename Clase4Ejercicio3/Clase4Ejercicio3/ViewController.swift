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
        static let bigError = "Error"
    }
    
    @IBOutlet weak var centigradesTextField: UITextField!
    @IBOutlet weak var farenheitTextField: UITextField!
    @IBOutlet weak var resultFarenheitLabel: UILabel!
    @IBOutlet weak var resultCentigradesLabel: UILabel!
    
    var validTemperature = false
    var convertCelsius = false
    var grades = ""
    var message = ""
    var resultLabel: UILabel?
    var temperatureIsNumeric = false
    
    @IBAction func convertButtonToFarenheitPressed(_ sender: Any) {
        convertCelsius = true
        grades = centigradesTextField.text ?? ""
        validateTemperatureField()
        proccessTemperatureField()
        resultLabel = resultFarenheitLabel
        showResultMessage()
    }
    
    @IBAction func convertButtonToCentigradesPressed(_ sender: Any) {
        convertCelsius = false
        grades = farenheitTextField.text ?? ""
        validateTemperatureField()
        proccessTemperatureField()
        resultLabel = resultCentigradesLabel
        showResultMessage()
    }
    
    private func validateTemperatureField()  {
        temperatureIsNumeric = Double(grades) != nil
        validTemperature = !grades.isEmpty
    }
    
    private func proccessTemperatureField() {
        if validTemperature && temperatureIsNumeric {
            let resultTemperature = processGrades()
            setMessage(resultTemperature)
        } else if validTemperature {
            setMessage(Constant.writeNumberMessage)
        } else {
            setMessage(Constant.emptyField)
        }
    }
    
    private func processGrades() -> String {
        assert(validTemperature)
        guard let gradesNumeric = Double(grades) else {
            validTemperature = false
            return Constant.bigError
        }
        if convertCelsius {
            let celsius = convertCentigradesToFarenheit(gradesNumeric)
            return parseTemperature(celsius) + " °F"
        } else {
            let farenheit = convertFarenheitToCentigrades(gradesNumeric)
            return parseTemperature(farenheit) + " °C"
        }
    }
    
    private func setMessage(_ resultMessage: String) {
        message = resultMessage
    }
    
    private func convertCentigradesToFarenheit(_ centigrades: Double) -> Double {
        return (centigrades*9/5)+32
    }
    
    private func convertFarenheitToCentigrades(_ farenheit: Double) -> Double {
        return (farenheit-32)*5/9
    }
    
    private func parseTemperature(_ temperature: Double) -> String {
        return String(temperature.rounded(toPlaces: 2))
    }
    
    private func showResultMessage() {
        guard let resultLabel = resultLabel else {
            return
        }
            resultLabel.text = message
            resultLabel.isHidden = false
    }
}

