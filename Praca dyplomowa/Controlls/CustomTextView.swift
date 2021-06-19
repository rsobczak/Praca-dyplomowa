//
//  CustomTextView.swift
//  Praca dyplomowa
//
//  Created by Radoslaw Sobczak on 18/05/2021.
//  Copyright © 2021 Radoslaw Sobczak. All rights reserved.
//

import Foundation
import UIKit


//MARK: Class that creates custom text view

class CustomTextView : UITextView {
    override func didMoveToWindow() {
        
        self.textAlignment = .center
        self.backgroundColor = .systemPink
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.blue.cgColor
        self.layer.cornerRadius = 15	
        }
}
