//
//  CurrencyFlagsAndSigns.swift
//  CurrencyConverter
//
//  Created by Jhantelle Belleza on 5/28/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import Foundation
import SwiftyJSON

struct CurrencyFlagandSign {
    var currencyName: String = ""
    var iso : String = ""
    var flagImageName : String = ""
    var signSymbol : String = ""
    var countryName: String = ""
    
    init() { }
}

class CurrencyFlagAndSignsDictionary {
    
    var isDictionaryCreated: Bool { return self.dictionaryInitialized() }
    var listOfAvailableCurrencies: [String: Any] {
        return self.getListOfAvailableCurrencies() }
    
    var flagsAndSigns: [String:Any] {
        return readCurrencyJSON()
    }
    
    init() { }
    
    var flagAndSignsDictionary: [String: CurrencyFlagandSign] = [:]
    
    func readCurrencyJSON() -> [String:Any] {
        do {
            if let file = Bundle.main.url(forResource: "currency", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = JSON(data: data)
                guard let flagsAndSigns = json.dictionaryObject else { return [:] }
                return flagsAndSigns
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
        return [:]
    }
    
    
    fileprivate func dictionaryInitialized() -> Bool {
        guard  (UserDefaults.standard.dictionary(forKey: "flagsAndSigns") != nil) else  {
            return false
        }
        return true
    }
    
    fileprivate  func getListOfAvailableCurrencies() -> [String: Any] {
        //TO DO: Clean up
        
        //guard let listOfAvailable = UserDefaults.standard.dictionary(forKey: "flagsAndSigns")            else { return [:] }
        
        //        var flagAndSign = CurrencyFlagandSign()
        var flagsAndSign = self.flagsAndSigns
        var list: [String:Any] = [:]
        
        //listOfAvailable.forEach { (key, value) in
        flagsAndSigns.forEach { (key, value) in
            guard let detail = value as? [String:String] else { return }
            /*  if let flag =  detail["flagImageName"] {
             flagsAndSign.flagImageName = flag }
             if let sign = detail["signSymbol"] {
             flagsAndSign.signSymbol = sign }
             if let cName = detail["currencyName"] {
             flagsAndSign.currencyName = cName
             }
             if let iso = detail["iso"] {
             flagsAndSign.iso = iso
             }
             */
            list[key] = flagsAndSign
        }
        return list
    }
    
    func resetDictionary() {
        UserDefaults.standard.removeObject(forKey: "flagsAndSigns")
        //createDictionaries()
    }
    
}

