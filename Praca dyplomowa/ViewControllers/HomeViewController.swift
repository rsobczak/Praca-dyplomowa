//
//  ViewController.swift
//  Praca dyplomowa
//
//  Created by Radoslaw Sobczak on 13/02/2021.
//  Copyright © 2021 Radoslaw Sobczak. All rights reserved.
//

import UIKit

//MARK: Home View Controller

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var laberUserName: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        navigationItem.title = "Welcome"
        laberUserName.text = "Welcome \(UIDevice.current.name)"
    
        let alertForUser = UIAlertController(title: "REMEMBER !!!", message: "Don't play with your medications. \n Your life and health are at stake.", preferredStyle: .alert)
        alertForUser.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertForUser, animated: true)
    }
}
