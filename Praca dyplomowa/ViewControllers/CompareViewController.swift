//
//  CompareViewController.swift
//  Praca dyplomowa
//
//  Created by Radoslaw Sobczak on 18/05/2021.
//  Copyright © 2021 Radoslaw Sobczak. All rights reserved.
//

import Foundation
import UIKit

//MARK:Compare View Controller beetwen drugs
//MARK: Data are loaded from JSON file

class CompareViewController: BaseViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //wypelnianie danymi picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bazaDanych.drugs.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bazaDanych.drugs[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView,
    didSelectRow row: Int, inComponent component: Int) {
    
        if pickerView == pickerViewDrug1 {
            
            updateLabelActiveSubstance(labelToUpdate: labelAciveSubst1, changedPicker: pickerViewDrug1)
            
        } else {
            
            updateLabelActiveSubstance(labelToUpdate: labelAciveSubst2, changedPicker: pickerViewDrug2)
        }
    }
    
    func updateLabelActiveSubstance (labelToUpdate: UILabel, changedPicker: UIPickerView) {
        
        labelToUpdate.text = bazaDanych.drugs[changedPicker.selectedRow(inComponent: 0)].activeSubstance
    }

//Outlets
    
    @IBOutlet weak var pickerViewDrug1: UIPickerView!
    @IBOutlet weak var pickerViewDrug2: UIPickerView!
    @IBOutlet weak var labelAciveSubst1: CustomLabel!
    @IBOutlet weak var labelAciveSubst2: CustomLabel!
    @IBAction func buttonConform(_ sender: UIButton) {
    }
    
    var bazaDanych:DataBase = DataBase(leki: [], interakcje: [])
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        	
        let path = Bundle.main.path(forResource: "Leki", ofType: "JSON") //1.         wskazujemy ścieżke do JSON
        //print(path)
        
        //2. wczytanie pliku
        //let contents = try String(contentsOfFile: path!)
        
        do {                                  //do - to obszar kodu , który spodziewam się, że moze sie nie powieść
            let contents = try String(contentsOfFile: path!) // try - "spróbuj cos zrobic i spodziewaj się, że coś moze sie nie udać"
                //    print(contents)
            //3. parsowanie JSONa - zamina z teksu na cos przydatniejszego
            let json = contents.data(using: .utf8)!
            let jsonData = try JSONSerialization.jsonObject(with: json, options: .allowFragments) as! [String:AnyObject]
            
            //stałe do ktorych przypisane sa wartosci w tablicach leki oraz interakcje
            let arrDrugs = jsonData["leki"]! as! [[String: AnyObject]]
            let arrInteractions = jsonData["interakcje"]! as! [[String: AnyObject]]
            
            //print(jsonData)
            //print(arrDrugs)
            //print(arrInteractions )
            
            var emptyArrDrugs: [Drug] = []
            for dictDrug in arrDrugs {
                let nazwa = dictDrug["nazwa"]! as! String
                let substancja = dictDrug["subst"]! as! String
                let drug = Drug(name: nazwa, activeSubstance: substancja)
                emptyArrDrugs.append(drug)
            }
            
            //print(emptyArrDrugs)
            
        var emptyArrInteraction: [Interaction] = []
        for dictInteraction in arrInteractions {
            let substancja_1 = dictInteraction["substancja_1"]! as! String
            let substancja_2 = dictInteraction["substancja_2"]! as! String
            let stopienInterakcji = levelOfInteraction(rawValue:dictInteraction["stopien_interakcji"]! as! String)!
            let opis = dictInteraction["opis"]! as! String
            let interaction = Interaction(substancja_1: substancja_1, substancja_2: substancja_2, stopienInterakcji: stopienInterakcji, description: opis)
                
            emptyArrInteraction.append(interaction)
            
        }
            
         bazaDanych = DataBase(leki: emptyArrDrugs, interakcje: emptyArrInteraction)
            
            } catch {
                
                print("Unexpected error: \(error).")
            
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "Compare screen"
       
        pickerViewDrug1.dataSource = self
        pickerViewDrug2.dataSource = self
        pickerViewDrug1.delegate = self
        pickerViewDrug2.delegate = self
        
        updateLabelActiveSubstance(labelToUpdate: labelAciveSubst1, changedPicker: pickerViewDrug1)
        updateLabelActiveSubstance(labelToUpdate: labelAciveSubst2, changedPicker: pickerViewDrug2)
    }
    
    // akcja alert na klikniecie w button "Confirm"
    
    @IBAction func buttonActionAlert(_ sender: UIButton) {
    
        createAlert()
    }
    
    func createAlert() {
    
        let selectedRow1: Int = pickerViewDrug1.selectedRow(inComponent: 0)
        let selecetedRow2: Int = pickerViewDrug2.selectedRow(inComponent: 0)
        let activSubstance1 = bazaDanych.drugs[selectedRow1].activeSubstance
        let acitvSubstance2 = bazaDanych.drugs[selecetedRow2].activeSubstance
        let optionalInterakcja = bazaDanych.findInteaction(activSubstance1, acitvSubstance2)
        
        var tytul: String = "TEST"
        var wiadomosc:String =
            "Inteakcja pomiedzy \(activSubstance1) oraz \(acitvSubstance2)"
        
        if let interakcje = optionalInterakcja {
            tytul = "Uwaga"
            wiadomosc =  "Inteakcja pomiedzy \(activSubstance1) oraz \(acitvSubstance2) \n\nStopien: \(interakcje.levelOfInteaction )"
        } else {
            tytul = "Nie znaleziono"
            wiadomosc = "nie znaleziono interakcji pomiedzy lekami!"
        }
        
        let alert = UIAlertController(title: tytul, message: wiadomosc, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default , handler: { (action) in alert.dismiss(animated: true, completion: nil)

//jakie ma zawierac w sobie ten alert mozliwe akcje
        }))
        
        present(alert, animated: true, completion: nil)
        
    }

}
