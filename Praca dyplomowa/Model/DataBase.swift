//
//  BazaDanych.swift
//  Praca dyplomowa
//
//  Created by Radoslaw Sobczak on 24/05/2021.
//  Copyright © 2021 Radoslaw Sobczak. All rights reserved.
//

import Foundation


//MARK: Data base with all informations

// Rename the type, its members, and the file into English
class DataBase { 
    let drugs: [Drug]
    let inteactions: [Interaction]

    init(leki: [Drug], interakcje: [Interaction]) {
        self.drugs = leki
        self.inteactions = interakcje
    }
    
    func findInteaction(_ substance_1: String, _ substance_2: String) -> Interaction? {
        self.inteactions.first(where:  {$0.firstActiveSubstance == substance_1 && $0.secondActiveSubstance == substance_2 || $0.secondActiveSubstance == substance_1 && $0.firstActiveSubstance == substance_2}) // dwoch substancje znajduja inteakcje jesli sitnieja.
    }
}
