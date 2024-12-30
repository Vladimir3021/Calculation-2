//
//  Model.swift
//  Calculation-2
//
//  Created by admin on 26.12.2024.
//

import UIKit

extension SizeClasseViewController {
    //MARK: Функция производит ввод числа.
    ///  Вводит первую цифру, и создает конкатенацию строк.
    /// устанавливая флаг `reg_flag_write` в `true`
    /// `sender.currentTitle` - работает только если стиль`style button = default`
    /// при других сосояниях `style` он выдает `nil`
    /// при других состоях для получения значения `text`
    /// неоходлимо использовать `sender.titleLabel!.text!`
    func enterDigits(sender: UIButton){
       
        let number = sender.titleLabel!.text!
        
        if reg_flag_write {
            labelPortraitResult.text! += number
        } else {
            labelPortraitResult.text = number
            reg_flag_write = true
        }
    }
    //MARK: Функция производит определение и вычисление бюинарных опереций операции
    // выводя результат на экран
    func executingMathOperationModePortrait()  {
        switch operation {
        case "+":
            let result = reg_ax + reg_bx
            labelPortraitResult.text = String(result)// вывод результата операции на экран
        case "-":
            let result = reg_ax - reg_bx
            labelPortraitResult.text = String(result)
        case "x":
            let result = reg_ax * reg_bx
            labelPortraitResult.text = String(result)
        case "÷":
            let result = reg_ax / reg_bx
            labelPortraitResult.text = String(result)
        case "xʸ":
            guard  let result = numericFunction.raise_a_number_to_a_power(number: Int(reg_ax), power: Int(reg_bx)) else {return}
            labelPortraitResult.text = String(result)
       // case "x²":
           // print("111")
//            guard  let result = numericFunction.number_to_power_2(number: Int(reg_ax)) else {return}
//            labelPortraitResult.text = String(result)
        default:
            print(Error.self)
        }
    }
    
    //MARK: Функция производит определение и вычисление унарных операции
    // выводя результат на экран
    func executingMathOperationModeLandscape()  {
        switch operationTag {
        case 77:/// `√` - корень квадратный
            let result = numericFunction.mySqrtDouble(x: reg_ax)
            labelPortraitResult.text = String(result)
        case 33:/// `x²`
            if reg_ax < 9223372036854775807.0 {//проверка на вх.число, должно быть меньше Int.max
                /// проверка на nil то ошибка тобрабатывается в функции `number_to_power_2`
                guard  let result = numericFunction.number_to_power_2(number: Int(reg_ax)) else {return}
                labelPortraitResult.text = String(result)
            } else {
                labelPortraitResult.text = "Error"
                // отключение работы кнопок пока не будет сделан сброс
                enabledButton.forEach { button in
                    button.isEnabled = false
                }
            }
        case 34:
            labelPortraitResult.text = String(Double.pi)
        case 35:
            print("eeee")
            labelPortraitResult.text = "2,7182818284590452353602874713527"
        default:
            print("Errorrrrr")
        }
    }
    
    //MARK: Сопряжение экрана(label) вывода в портретном и ландшафтном режиме
    /// вся работа и лoгика происхродит в `labelPortraitResult` В  `labelLandscapeInputOutput` всего лишь записывается результат из `labelPortraitResult`
    /// `viewDidLayoutSubviews` вызывается при любом изменении интерфейса, при нажатии кнопки тоже.
    ///  Подключить два IBOulet нельзя xCode не дает это сделать. Режим массива не подходит.
    override func viewDidLayoutSubviews() {
        labelLandscapeInputOutput.text = labelPortraitResult.text
        
    }
    
}
