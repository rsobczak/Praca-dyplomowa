//
//  CustomSmallButton.swift
//  Praca dyplomowa
//
//  Created by Radoslaw Sobczak on 18/05/2021.
//  Copyright © 2021 Radoslaw Sobczak. All rights reserved.
//

import Foundation
import UIKit

//MARK: Class that creates custom small button

class CustomSmallButton: UIButton{
    override func didMoveToWindow() {
        
        self.titleLabel?.textAlignment = .center
        self.backgroundColor = UIColor.systemGreen
        self.setTitleColor(UIColor.black, for: .normal)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset =     CGSize(width: 0, height: 0)
        self.layer.cornerRadius = self.frame.height / 2
        self.frame.size = CGSize(width: 75, height: 40)
        self.titleLabel?.font = self.titleLabel?.font.withSize(12)
    }
}
