//
//  BazaDanych.swift
//  Praca dyplomowa
//
//  Created by Radoslaw Sobczak on 24/05/2021.
//  Copyright © 2021 Radoslaw Sobczak. All rights reserved.
//

import Foundation


//MARK: Data base with all informations

class BazaDanych {
    let leki: [Drug]
    let interakcje: [Interaction]

    init(leki: [Drug], interakcje: [Interaction]) {
        self.leki = leki
        self.interakcje = interakcje
    }
    
    func znajdzInterakcje(_ substancja1: String, substancja2: String) -> Interaction? {
        self.interakcje.first(where:  {$0.substancja_1 == substancja1 && $0.substancja_2 == substancja2 || $0.substancja_2 == substancja1 && $0.substancja_1 == substancja2}) // dwoch substancje znajduja inteakcje jesli sitnieja.
    }
}
