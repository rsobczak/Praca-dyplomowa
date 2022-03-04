//
//  BasicViewController.swift
//  Praca dyplomowa
//
//  Created by Radoslaw Sobczak on 18/05/2021.
//  Copyright © 2021 Radoslaw Sobczak. All rights reserved.
//

import Foundation
import UIKit

//MARK: Common base class for all View Controllers.
//MARK: Handles dark mode settings

class BaseViewController: UIViewController {

        override func viewDidLoad() {
            super.viewDidLoad()
            let isDarkOn = UserDefaults.standard.bool(forKey: "prefs_is_dark_mode_on") as? Bool ?? true
            overrideUserInterfaceStyle = isDarkOn ? .dark : .light
    }
}
