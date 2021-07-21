//
//  StopienInterakcji.swift
//  Praca dyplomowa
//
//  Created by Radoslaw Sobczak on 24/05/2021.
//  Copyright © 2021 Radoslaw Sobczak. All rights reserved.
//

import Foundation

//MARK: Enumeriation about inteaction severity

enum StopienInterakcji : String { // zmienic nazwe na angielską ale stosująć refaktoryzacje kodu
    case bardzo_powazny = "bardzo powazny"
    case istotny = "istotna interakcja"
    case nieistotny = "nieistotny"
    case brak_danych = "brak danych"
}
