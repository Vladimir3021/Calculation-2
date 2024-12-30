//
//  AdaptiveVCCalculatorViewController.swift
//  Calculation-2
//
//  Created by admin on 03.11.2024.
//

import UIKit

 class SizeClasseViewController: UIViewController, UITextFieldDelegate {
    
     var numericFunction = MathFunction()
     override func viewDidLoad() {
         numericFunction.vc = self 
     }
     
    var reg_ax: Double = 0//первое слагаемое
    var reg_bx: Double = 0//второе слагаемое
    var reg_cx: Double = 0//промежуточный регистр для перемены мест слагаемых
    var reg_flag_write: Bool = false
    // для повторного срабатывания арифм. опер. неоходимо первое срабатывание "="
    var reg_pressed_equal: Bool = false// было ли первое нажатие "="
    var operation = ""// знак опереции
    var operationTag = 0// тег операции для прогр. функц. в ланландшафтном режиме
    var saveCurentInput: Double {//конвертация и сохранение значения из экрана ввода(label)
        get {
            return Double(labelPortraitResult.text!) ?? 00000000000
        }
        set {
            labelPortraitResult.text = "\(newValue)"
        }
    }
     
     @IBOutlet var enabledButton: [UIButton]!
     
    @IBOutlet weak var labelPortraitResult: UILabel!// Верхн. Label в портретном режиме.
    @IBOutlet weak var labelLandscapeInputOutput: UILabel!// Верхн. Label в ландшафтном режиме.
    @IBOutlet weak var labelDownLandscape: UILabel!
  

    // Массив математических действий по заголоаку кнопки
    @IBAction func buttonArrayMatchAction(_ sender: UIButton) {// нажимаем на кнопку действий
        reg_ax = saveCurentInput // сохранение первого значения            1
        print("reg_ax - \(reg_ax)")
        labelPortraitResult.text = "0" // сброс значения в label           2
        reg_flag_write = false // готовность к вводу нового значения       3
        operation = (sender.titleLabel?.text)!// получаем заголовок кнопки  4  --->  ввод второго числа
        if reg_pressed_equal {//было ли первое нажатие "="
            executingMathOperationModePortrait()
            
        }
    }

    // Массив для цифр по тексту в title
    @IBAction func buttonDigits(_ sender: UIButton) {
        enterDigits(sender: sender) // ввод/набор числа                    0 / 5
        
    }
    //MARK: Кнопка "="
    @IBAction func buttonEqual(_ sender: UIButton) {
        if reg_flag_write {// ----------------------------------------
            reg_bx = saveCurentInput // сохранение второго операнда 6-|-и --> Блокировка
        } else {//                                                    |        второго
            reg_ax = saveCurentInput // перевод второго операнда в    |       слагаемого
        }//                             первый при повторной операции |
        reg_flag_write = false//                                      |
        //------------------------------------------------------------
        
        executingMathOperationModePortrait() /// выполнение математичечкой операции из значения `sender.titleLabel?.text`
                                 /// и вывод значения на экран                                      7
        reg_pressed_equal = true

    }
     //MARK: Кнопка "A/C"
    @IBAction func buttonReset(_ sender: UIButton) {
        reg_ax = 0
        reg_bx = 0
        reg_cx = 0
        reg_flag_write = false
        labelPortraitResult.text = "0"
        reg_pressed_equal = false
        //возврат цвета текста после серого в "overflow"
        labelLandscapeInputOutput.textColor = .black
        enabledButton.forEach { button in// включение работы кнопок
            button.isEnabled = true
        }
    }
     //MARK: Кнопка "+/-"
    @IBAction func subtractionAndAdditionButton(_ sender: UIButton) {
        saveCurentInput = -saveCurentInput
    }
     //MARK: Массис операций для ландшафтного режима (Size Classe)
     @IBAction func unaryFuncLandscapeMode(_ sender: UIButton) {
         reg_ax = saveCurentInput
         operationTag = sender.tag
       
         executingMathOperationModeLandscape()
     }
     
     @IBAction func logButton(_ sender: UIButton) {
     
     }
 }


