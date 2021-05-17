//
//  CustomLabel.swift
//  Praca dyplomowa
//
//  Created by Radoslaw Sobczak on 14/05/2021.
//  Copyright © 2021 Radoslaw Sobczak. All rights reserved.
//

import Foundation
import UIKit

// class that creates a label with attributes (inherited from UILabel)

// MARK: class Label

class CustomLabel: UILabel {
    override func didMoveToWindow() {
        
        self.text = "TEST"
        self.textColor = UIColor.systemRed
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.5
        self.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowColor = UIColor.systemYellow.cgColor
        self.textAlignment = .center // wysrodkowanie
        // wielkosc buttona + czcionka wiekosc
    }

}
