//
//  AlcoholCompareViewController.swift
//  Praca dyplomowa
//
//  Created by Radoslaw Sobczak on 01/06/2021.
//  Copyright © 2021 Radoslaw Sobczak. All rights reserved.
//

import Foundation
import UIKit

//MARK: Alcohol comapre View Controller
//MARK: Handles interaction beetween a drug and alcohol

class AlcoholCompareViewController: BaseViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //wypelnianie danymi picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return bazaDanych.leki.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return bazaDanych.leki[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView,
    didSelectRow row: Int, inComponent component: Int) {

    labelActiveSubst.text = bazaDanych.leki[row].activeSubstance
        
    }
    
// Outlets
    
    @IBOutlet weak var pickerViewDrug: UIPickerView!
    @IBOutlet weak var labelActiveSubst: CustomLabel!
    @IBAction func buttonConfirmAlcohol(_ sender: Any) {
    }
    
    var bazaDanych:BazaDanych = BazaDanych(leki: [], interakcje: [])
    
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
//Constants
            let substancja_1 = dictInteraction["substancja_1"]! as! String
            let substancja_2 = dictInteraction["substancja_2"]! as! String
            let stopienInterakcji = StopienInterakcji(rawValue:dictInteraction["stopien_interakcji"]! as! String)!
            let opis = dictInteraction["opis"]! as! String
            let interaction = Interaction(substancja_1: substancja_1, substancja_2: substancja_2, stopienInterakcji: stopienInterakcji, opis: opis)
                
            emptyArrInteraction.append(interaction)
            
        }
            
         bazaDanych = BazaDanych(leki: emptyArrDrugs, interakcje: emptyArrInteraction)
            
            } catch {
                
                print("Unexpected error: \(error).")
            
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "Compare screen"
       
        pickerViewDrug.dataSource = self
        pickerViewDrug.delegate = self
        labelActiveSubst.text = bazaDanych.leki[pickerViewDrug.selectedRow(inComponent: 0)].activeSubstance
    }
    
    // akcja alert na klikniecie w button "Confirm"
    
    @IBAction func buttonConfrimAlcoholAndDrug(_ sender: UIButton) {
        
        createAlert()
    }
    
    
    func createAlert() {
    

//Constants
        
        let selectedRow: Int = pickerViewDrug.selectedRow(inComponent: 0)
        let activSubstance1 = bazaDanych.leki[selectedRow].activeSubstance
        let acitvSubstance2: String = "Alcohol"
        let optionalInterakcja = bazaDanych.znajdzInterakcje(activSubstance1, substancja2: acitvSubstance2)
        
//Variables
        var tytul: String
        var wiadomosc:String =
            "Inteakcja pomiedzy \(activSubstance1) oraz alkoholem"
        
        if let interakcje = optionalInterakcja {
            tytul = "Uwaga"
            wiadomosc =  "Inteakcja pomiedzy \(activSubstance1) oraz alkoholem \n\nStopien: \(interakcje.stopienInterakcji )"
        } else {
            tytul = "Nie znaleziono"
            wiadomosc = "\nNie łącz ŻADNYCH leków z alkoholem !!!"
        }
        
// Constant
        let alert = UIAlertController(title: tytul, message: wiadomosc, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default , handler: { (action) in alert.dismiss(animated: true, completion: nil)

        }))
        
        present(alert, animated: true, completion: nil)
        
    }

}

