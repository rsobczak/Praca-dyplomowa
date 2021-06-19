//
//  Interakcja.swift
//  Praca dyplomowa
//
//  Created by Radoslaw Sobczak on 24/05/2021.
//  Copyright © 2021 Radoslaw Sobczak. All rights reserved.
//

import Foundation

//MARK: Information about a interactions

class Interaction {
    let substancja_1: String
    let substancja_2: String
    let stopienInterakcji: StopienInterakcji
    let opis: String
   
    
    init(substancja_1: String, substancja_2: String, stopienInterakcji: StopienInterakcji, opis: String) {
        self.substancja_1 = substancja_1
        self.substancja_2 = substancja_2
        self.stopienInterakcji = stopienInterakcji
        self.opis = opis
    }
}
