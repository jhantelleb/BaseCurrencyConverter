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
    
    init() {
        let value = setUpFlagAndSign(base: base)
        self.flag = value.flag
        self.sign = value.sign
    }
    
    init(base: String) {
        self.base = base
        let value = setUpFlagAndSign(base: base)
        self.flag = value.flag
        self.sign = value.sign
    }
    
    
    init(base: String, amount: Double) {
        self.base = base
        let value = setUpFlagAndSign(base: base)
        self.flag = value.flag
        self.sign = value.sign
        self.amount = amount
    }
    
    func setUpFlagAndSign(base: String) -> (flag: UIImage?, sign: String?){
        var flagImage: UIImage!
        var signSymbol: String!
        
        if let flagsAndSigns = UserDefaults.standard.array(forKey: "flagsAndSigns") as? [[String:Any]] {
            flagsAndSigns.forEach {
                guard let flagAndSign = $0[base.lowercased()] as? [String:String] else { return }
                guard let flag = flagAndSign["flagImage"] else { flagImage = nil; return }
                flagImage = UIImage(named: flag)
                guard let sign = flagAndSign["signSymbol"] else { signSymbol = nil; return }
                signSymbol = sign
            }
        }
        
        return (flagImage, signSymbol)
    }
        
}
