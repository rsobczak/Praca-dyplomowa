//
//  CustomTextView.swift
//  Praca dyplomowa
//
//  Created by Radoslaw Sobczak on 14/05/2021.
//  Copyright © 2021 Radoslaw Sobczak. All rights reserved.
//

import Foundation
import UIKit

// class that creates a text view field with attributes (inherited from UIView)

// MARK: class Text View

class CustomTextView : UITextView {
    override func didMoveToWindow() {
        
        self.textAlignment = .center
        self.backgroundColor = .systemPink
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.blue.cgColor
        
        }
}
