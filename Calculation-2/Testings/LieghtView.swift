//
//  LieghtView.swift
//  Calculation-2
//
//  Created by admin on 03.11.2024.
//

import UIKit

class LieghtView: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = self.frame.height / 2
        backgroundColor = .brown
        print(bounds.height / 2)
        //layer.cornerCurve = .circular
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
