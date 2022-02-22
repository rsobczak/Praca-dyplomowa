// Is this file needed? It seems to be a duplicate of Lek.swift

//
//  Lek.swift
//  Praca dyplomowa
//
//  Created by Radoslaw Sobczak on 24/05/2021.
//  Copyright © 2021 Radoslaw Sobczak. All rights reserved.
//

import Foundation

//MARK: Information about a drug

class Drug {
    let name: String
    let activeSubstance: String
    
    init(name: String, activeSubstance: String) {
        self.name = name
        self.activeSubstance = activeSubstance
    }
}
