//
//  ChooseCurrencyModel.swift
//  CurrencyConverter
//
//  Created by Jhantelle Belleza on 6/7/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import Foundation
import UIKit

struct ChooseCurrencyItem {
    
    var currencyName: String = ""
    var base: String
    var flagImage: UIImage?
    var countryName: String?
    var selected: Bool = false
    
    init(base: String) {
        self.base = base
    }
}


