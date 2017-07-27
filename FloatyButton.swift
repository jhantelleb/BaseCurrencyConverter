//
//  FloatyButton.swift
//  CurrencyConverter
//
//  Created by Jhantelle Belleza on 5/28/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import Foundation
import Floaty

class FloatyButton: Floaty {
    
    
    var addCurrency: FloatyItem {
        return addCurrencyButton()
    }
    
    var changeBase: FloatyItem  {
        return changeBaseButton()
    }
    
    
    func addCurrencyButton() -> FloatyItem {
        let addCurrency = FloatyItem()
        
        addCurrency.title = "Add Currency"
        addCurrency.titleColor = UIColor.white
        addCurrency.titleLabel.backgroundColor = UIColor.black
        addCurrency.titleLabel.backgroundColor?.withAlphaComponent(0.8)
        addCurrency.icon = UIImage(named: "addCurrency")
        
        return addCurrency
    }
    
    func changeBaseButton() -> FloatyItem {
        let changeBase = FloatyItem()
        
        changeBase.title = "Change Base Currency"
        changeBase.titleColor = UIColor.white
        changeBase.titleLabel.backgroundColor = UIColor.black
        changeBase.titleLabel.backgroundColor?.withAlphaComponent(0.8)
        changeBase.icon = UIImage(named: "")
        return changeBase
    }
    
    
}
