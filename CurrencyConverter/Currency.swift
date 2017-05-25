//
//  Currecny.swift
//  CurrencyConverter
//
//  Created by Jhantelle Belleza on 5/24/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import Foundation
import UIKit

protocol Currency {
    var base: String { get set }
    var amount: Double { get set }
    var flag: UIImage? { get set }
}


struct BaseCurrency: Currency {
    var base: String
    var amount: Double
    var flag: UIImage? = UIImage(named: "")
    
    init(base: String, amount: Double) {
        self.base = base
        self.amount = amount
    }
}

//struct CurrenciesToConvert {
//    var currencies: [BaseCurrency] = []
//    
//    func convertAmountFromBase() {
//        
//    }
//}
