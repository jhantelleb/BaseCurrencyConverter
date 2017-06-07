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
        let value = setUpCurrency(base: base)
        self.flag = value.flag
        self.sign = value.sign
    }
    
    init(base: String) {
        self.base = base
        let value = setUpCurrency(base: base)
        self.flag = value.flag
        self.sign = value.sign
        self.currencyName = value.currencyName
    }
    
    
    init(base: String, amount: Double) {
        self.base = base
        let value = setUpCurrency(base: base)
        self.flag = value.flag
        self.sign = value.sign
        self.amount = amount
        self.currencyName = value.currencyName
    }
    
    func setUpCurrency(base: String) -> (flag: UIImage?, sign: String?, currencyName: String?){
        var flagImage: UIImage?
        var signSymbol: String?
        var currencyName: String?
        
        //        if let flagsAndSigns = UserDefaults.standard.array(forKey: "flagsAndSigns") as? [[String:Any]] {
        //            flagsAndSigns.forEach {
        //                guard let flagAndSign = $0[base.lowercased()] as? [String:String] else { return }
        //                guard let flag = flagAndSign["flagImage"] else { flagImage = nil; return }
        //                flagImage = UIImage(named: flag)
        //                guard let sign = flagAndSign["signSymbol"] else { signSymbol = nil; return }
        //                signSymbol = sign
        //                guard let cName = flagAndSign["currencyName"] else { currencyName = nil; return }
        //                currencyName = cName.uppercased()
        //            }
        //        }
        //
        guard let flagsAndSigns = UserDefaults.standard.dictionary(forKey: "flagsAndSigns") else { return (flagImage, signSymbol, currencyName)
        }
        flagsAndSigns.forEach {
            if $0.key == base.lowercased() {
                guard let detail = $0.value as? [String:String] else { return }
                guard let flag = detail["flagImage"] else { flagImage = nil; return }
                flagImage = UIImage(named: flag)
                guard let sign = detail["signSymbol"] else { signSymbol = nil; return }
                signSymbol = sign
                guard let cName = detail["currencyName"] else { currencyName = nil; return }
                currencyName = cName.uppercased()
            }
        }
        return (flagImage, signSymbol, currencyName)
    }
}
