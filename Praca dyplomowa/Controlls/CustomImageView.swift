//
//  CustomImageView.swift
//  Praca dyplomowa
//
//  Created by Radoslaw Sobczak on 14/05/2021.
//  Copyright © 2021 Radoslaw Sobczak. All rights reserved.
//

import Foundation
import UIKit

// class that creates a image view with attributes (inherited from UIImageView)

// MARK: class Image View

class CustomImageView: UIImageView {
    override func didMoveToWindow() {
     
        self.backgroundColor = .systemBlue
        self.contentMode = .scaleToFill
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.systemYellow.cgColor
        
    }
    }
