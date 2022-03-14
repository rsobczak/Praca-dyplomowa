//
//  StopienInterakcji.swift
//  Praca dyplomowa
//
//  Created by Radoslaw Sobczak on 24/05/2021.
//  Copyright © 2021 Radoslaw Sobczak. All rights reserved.
//

import Foundation

//MARK: Enumeriation about inteaction severity

// Rename the type its members, and file into English
enum levelOfInteraction : String { // zmienic nazwe na angielską ale stosująć refaktoryzacje kodu
    case verySerious = "bardzo powazny"
    case serious = "istotna interakcja"
    case notSerious = "nieistotny"
    case noData = "brak danych"
}
