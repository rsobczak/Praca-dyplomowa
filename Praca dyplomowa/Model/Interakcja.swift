//
//  Interakcja.swift
//  Praca dyplomowa
//
//  Created by Radoslaw Sobczak on 24/05/2021.
//  Copyright © 2021 Radoslaw Sobczak. All rights reserved.
//

import Foundation

//MARK: Information about a interactions

// Rename the type members and file into English
class Interaction {
    let firstActiveSubstance: String
    let secondActiveSubstance: String
    let levelOfInteaction: levelOfInteraction
    let description: String
   
    
    init(substancja_1: String, substancja_2: String, stopienInterakcji: levelOfInteraction, description: String) {
        self.firstActiveSubstance = substancja_1
        self.secondActiveSubstance = substancja_2
        self.levelOfInteaction = stopienInterakcji
        self.description = description
    }
}
