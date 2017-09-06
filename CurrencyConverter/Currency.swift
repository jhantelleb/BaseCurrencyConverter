//
//  Currecny.swift
//  CurrencyConverter
//
//  Created by Jhantelle Belleza on 5/24/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import Foundation
import UIKit


class Currency {
    var base: String = ""
    var amount: Double = 0.00
    var flag: UIImage?
    var sign: String?
    var currencyName: String?
    
    init() {
        let value = setUpCurrency(base)
        self.flag = value.flag
        self.sign = value.sign
    }
    
    init(base: String) {
        self.base = base
        let value = setUpCurrency(base)
        self.flag = value.flag
        self.sign = value.sign
        self.currencyName = value.currencyName
    }
    
    
    init(base: String, amount: Double) {
        self.base = base
        let value = setUpCurrency(base)
        self.flag = value.flag
        self.sign = value.sign
        self.amount = amount
        self.currencyName = value.currencyName
    }
    
    func setUpCurrency(_ base: String) -> (flag: UIImage?, sign: String?, currencyName: String?){
        var flagImage: UIImage?
        var signSymbol: String?
        var currencyName: String?
        
        let flagsAndSigns = CurrencyFlagAndSignsDictionary().flagsAndSigns
        
        guard let value = flagsAndSigns[base.lowercased()] as? [String:String] else { return (flagImage, signSymbol, currencyName) }
 
        flagImage = UIImage(named: value["flagImageName"]!)
        signSymbol = value["signSymbol"]
        currencyName = (value["currencyName"])?.uppercased()
        return (flagImage, signSymbol, currencyName)
    }
}
