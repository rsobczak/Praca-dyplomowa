//
//  BasicViewController.swift
//  Praca dyplomowa
//
//  Created by Radoslaw Sobczak on 18/05/2021.
//  Copyright © 2021 Radoslaw Sobczak. All rights reserved.
//

import Foundation
import UIKit

//MARK: Dark mode

class BaseViewController: UIViewController {
   
    @IBOutlet weak var DarkModeSwitchButton: UISwitch!

        override func viewDidLoad() {
            super.viewDidLoad()
            let isDarkOn = UserDefaults.standard.bool(forKey: "prefs_is_dark_mode_on") as? Bool ?? true
                overrideUserInterfaceStyle = isDarkOn ? .dark : .light
    }

    @IBAction func DarkModeActionSwitchButton(_ sender: UISwitch) {
        
        UserDefaults.standard.set(DarkModeSwitchButton.isOn, forKey: "prefs_is_dark_mode_on")
        overrideUserInterfaceStyle = DarkModeSwitchButton.isOn ? .dark : .light
    }
}
