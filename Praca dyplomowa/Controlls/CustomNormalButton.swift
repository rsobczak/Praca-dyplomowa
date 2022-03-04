//
//  CustomNormalButton.swift
//  Praca dyplomowa
//
//  Created by Radoslaw Sobczak on 18/05/2021.
//  Copyright © 2021 Radoslaw Sobczak. All rights reserved.
//

import Foundation
import UIKit

//MARK: Class that creates custom big button

class CustomNormalButton : UIButton {
    override func didMoveToWindow() {
        
        self.backgroundColor = UIColor.systemYellow
        self.layer.cornerRadius = self.frame.height / 4
        self.setTitleColor(UIColor.black, for: .normal)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.6
        self.layer.shadowOffset =     CGSize(width: 0, height: 0)
        self.titleLabel?.textAlignment = .center
        self.frame.size = CGSize(width: 120, height: 50)
        self.titleLabel?.font = self.titleLabel?.font.withSize(15)
    }
    
}
