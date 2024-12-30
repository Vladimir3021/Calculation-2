//
//  NumericFunction.swift
//  Calculation-2
//
//  Created by admin on 19.12.2024.
//

import Foundation
import UIKit

struct MathFunction {
    
    var valueOne = ""
    var firstValue: Double = 0
    var vc: UIViewController? = nil
    
    //    mutating func remember() {
    //        firstValue = Double(valueOne)!
    //        valueOne = ""
    //    }
    
    func myMax<T: Comparable>(x: T, y: T) -> T {
        let value: T = max(x, y)
        return value
    }
    
    func mySqrtDouble(x: Double) -> Double {
        let value = sqrt(x)
        return value
    }
    
    func mySqrtFloat(x: Float) -> Float {
        let value = sqrt(x)
        return value
    }
    
    func myPowDouble(a: Double, b: Double) -> Double {
        let value = pow(a, b)
        return value
    }
    
    func myPowFloat(a: Float, b: Float) -> Float {
        let value = pow(a, b)
        return value
    }
    
    func mySinRadian(x_Radian: Double) -> Double {
        let value = sin(x_Radian)
        return value
    }
    
    func mySinDegree(x_Degree: Double) -> Double {
        let radian = x_Degree * (Double.pi / 180)
        let value = sin(radian)
        return value
    }
    
    func myCosRadian(x_Radian: Double) -> Double {
        let value = cos(x_Radian)
        return value
    }
    
    func myCosDegree(x_Degree: Double) -> Double {
        let radian = x_Degree * (Double.pi / 180)
        let value = cos(radian)
        return value
    }
    
    func raise_a_number_to_a_power (number: Int, power: Int ) -> Int? {
        var result = 1
        if power == 0 { // Согласно правилу, любое число, возведенное в нулевую степень, будет равняться единице.
            return 1
        } else {
            if number == 0 {///проверка чтобы не было деления на ноль в строке `Int.max / number`
                return 0
            } else {
                for _ in 1...power {
                    if result < Int.max / number { // Защита от переполнения
                        result *=  number
                    } else {
                        let sizeClassViewController = vc as! SizeClasseViewController
    // т.к. происходит перезаписывание из labelPortraitResult >> labelLandscapeInputOutput
                        //изменение цвета необходимо производить в labelLandscapeInputOutput
                        sizeClassViewController.labelLandscapeInputOutput.textColor = .systemGray6
                        sizeClassViewController.labelPortraitResult.text = "Error"
                        // отключение работы кнопок пока не будет сделан сброс
                        sizeClassViewController.enabledButton.forEach { button in
                            button.isEnabled = false
                        }
                        return nil
                    }
                }
            }
        }
        return result
    }
    func number_to_power_2(number: Int) -> Int? {
        var result = 1
       var number = number
        if number < Int.max / number { // Защита от переполнения
                return number * number
            } else {
                let v = vc as! SizeClasseViewController
// т.к. происходит перезаписывание из labelPortraitResult >> labelLandscapeInputOutput
                //изменение цвета необходимо производить в labelLandscapeInputOutput
                v.labelLandscapeInputOutput.textColor = .systemGray6
                v.labelPortraitResult.text = "Error"
                // отключение работы кнопок пока не будет сделан сброс
                v.enabledButton.forEach { button in
                    button.isEnabled = false
                }
                return nil
            }
    }
}

