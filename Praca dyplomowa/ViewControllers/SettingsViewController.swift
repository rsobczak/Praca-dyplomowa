//
//  SettingsViewController.swift
//  Praca dyplomowa
//
//  Created by Radoslaw Sobczak on 19/05/2021.
//  Copyright © 2021 Radoslaw Sobczak. All rights reserved.
//

import Foundation
import UIKit

//MARK: Settings View Controller
//MARK: Dark mode handler with dark mode switch outlet and action

class SettingsViewController: BaseViewController {

    @IBOutlet weak var DarkModeSwitchButton: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let isDarkOn = UserDefaults.standard.bool(forKey: "prefs_is_dark_mode_on") as? Bool ?? true
            overrideUserInterfaceStyle = isDarkOn ? .dark : .light
        DarkModeSwitchButton.isOn = isDarkOn
//JESL DAR    K MODE JEST WLACZONY TO PRZYCISK TEZ MUSI BYC WLACZONY !
        //view.backgroundColor = .red
       
        navigationItem.title = "Settings"
    }
    
    @IBAction func DarkModeActionSwitchButton(_ sender: UISwitch) {

            UserDefaults.standard.set(DarkModeSwitchButton.isOn, forKey: "prefs_is_dark_mode_on")
            overrideUserInterfaceStyle = DarkModeSwitchButton.isOn ? .dark : .light
    }
}
