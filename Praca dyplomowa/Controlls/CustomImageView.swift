//
//  CustomImageView.swift
//  Praca dyplomowa
//
//  Created by Radoslaw Sobczak on 18/05/2021.
//  Copyright © 2021 Radoslaw Sobczak. All rights reserved.
//

import Foundation
import UIKit

//MARK: Class that creates custom image view.

class CustomImageView : UIImageView {
    override func didMoveToWindow() {
     
        self.backgroundColor = .systemBlue
        self.contentMode = .scaleToFill
        self.layer.borderWidth = 3
        //dlaczego te dwa poniezej nie działają ?
        self.layer.borderColor = UIColor.systemBlue.cgColor
        self.layer.cornerRadius = 20
        
    }
}
