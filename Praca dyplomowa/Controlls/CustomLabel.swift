//
//  CustomLabel.swift
//  Praca dyplomowa
//
//  Created by Radoslaw Sobczak on 18/05/2021.
//  Copyright © 2021 Radoslaw Sobczak. All rights reserved.
//

import Foundation
import UIKit

//MARK: Class that creates custom label

class CustomLabel: UILabel {
    override func didMoveToWindow() {
        
        //self.text = "TEST" //aby na każdym Labelu nie było napisu TEST
        self.textColor = UIColor.systemRed
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.5
        self.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowColor = UIColor.systemYellow.cgColor
        self.textAlignment = .center // wysrodkowanie
        // wielkosc buttona + czcionka wiekosc
    }

}
