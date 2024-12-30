//
//  ViewController.swift
//  Calculation-2
//
//  Created by admin on 13.10.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lieftView: UIView!
    
    @IBOutlet var buttonArray: [UIButton]!
    
    @IBOutlet var mainButtonArray: [UIButton]!
    
    @IBOutlet weak var ddd: UIButton!
    
    @IBOutlet weak var leadingButton: UIButton!
    
    @IBOutlet weak var topLabel: UILabel!
                  
    @IBOutlet weak var downLabel: UILabel!
    
    @IBAction func dddAction(_ sender: Any) {
        downLabel.text = "111"
    }
    
    
    override func viewDidLayoutSubviews() {
        view.layoutIfNeeded()
       
        if UIDevice.current.orientation.isPortrait {
//            mainButtonArray.forEach { button in
//                button.layer.cornerRadius = button.bounds.height / 2
//               // topLabel.text = downLabel.text
//            }
        }  else {
            //topLabel.text = downLabel.text
//            mainButtonArray.forEach { button in
//                button.layer.cornerRadius = button.bounds.height / 2
//            }
//            buttonArray.forEach { button in
//                button.layer.cornerRadius = button.bounds.height / 2
//            }
        }
    }
}

