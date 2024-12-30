//
//  SecondViewController.swift
//  Calculation-2
//
//  Created by admin on 20.12.2024.
//

import UIKit

class SecondViewController: ViewController {
    
    var permissionToEnter = false
    var firstOperand = ""
    var firstOperand2: Double = 0
    var secondOperand = ""
    var operation = ""
    var secondOperandBool = false
    var computedPropertySaveResult: Double {
        get {
            return Double(resultLabel.text!)!
        }
        set {
            resultLabel.text! = String(newValue)
        }
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func digits(_ sender: UIButton) {
        
        // получаем цифру ввода
        let number = (sender.titleLabel?.text)!
       
        // if для урезания нуля при вводе новой цифры
        if permissionToEnter {
            resultLabel.text! += number
        } else {
            resultLabel.text! = number
            permissionToEnter = true
        }
    }
    @IBAction func equalAction (_ sender: UIButton) {
//        secondOperand = resultLabel.text!
//        secondOperandBool = true
        actionComputing()
        permissionToEnter = false
    }
   
    @IBAction func operationSignResult(_ sender: UIButton) {
        
        firstOperand = resultLabel.text!
        operation = (sender.titleLabel?.text)!
        permissionToEnter = false
        backlight()
    }
    
    @IBAction func reset(_ sender: UIButton) {
        resultLabel.text! = "0"
        permissionToEnter = false
        firstOperand = ""
        operation = ""
    }
    
    @IBAction func square(_ sender: UIButton) {
        let value = resultLabel.text!
        resultLabel.text = String(sqrt(Double(value)!))
    }
}
extension SecondViewController {
    func actionComputing() {
        switch operation {
        case "+":
            let result = Double(firstOperand)! + Double(resultLabel.text!)!
            resultLabel.text = String(result)
        case "-":
            let result = Double(firstOperand)! - Double(resultLabel.text!)!
            resultLabel.text = String(result)
        case "×":
            let result = Double(firstOperand)! * Double(resultLabel.text!)!
            resultLabel.text = String(result)
        case "÷":
            let result = Double(firstOperand)! / Double(resultLabel.text!)!
            resultLabel.text = String(result)
        default:
            resultLabel.text = "Error"
        }
    }
    func backlight () {
        switch operation {
        case "+":
            resultLabel.backgroundColor = .yellow
        case "-":
            resultLabel.backgroundColor = .yellow
        case "×":
            resultLabel.backgroundColor = .yellow
        case "÷":
            resultLabel.backgroundColor = .yellow
        default:
            print("ERROR")
        }
    }
}
