
//
//  BaseCurrency.swift
//  CurrencyConverter
//
//  Created by Jhantelle Belleza on 5/24/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import Foundation
import UIKit

//TODO: Create a protocol to send amount to TV
protocol BaseCurrencyDelegate: class {
    func reloadData()
}

class BaseCurrencyView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var baseSignLabel: UILabel!
    @IBOutlet weak var baseCurrencyLabel: UILabel!
    @IBOutlet weak var baseAmountTextField: UITextField!
    
    
    weak var delegate: BaseCurrencyDelegate?
    
    let store = CurrencyDataStore.sharedInstance
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        baseAmountTextField.delegate = self
        
        let defaultBase = Currency(base: "USD", amount: 1.00)
        
        store.setBase(using: defaultBase)
        baseCurrencyLabel.text = store.baseCurrency.base
        baseAmountTextField.text = String(store.baseCurrency.amount)
        flagImageView.image = store.baseCurrency.flag
        baseSignLabel.text = store.baseCurrency.sign
        
        baseAmountTextField.keyboardType = .numbersAndPunctuation
        
    }
    
    fileprivate func commonInit() {
        Bundle.main.loadNibNamed("BaseCurrencyView", owner: self, options: nil)
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
}

extension BaseCurrencyView: UITextFieldDelegate, BaseCurrencyDelegate {
    
    func reloadData() {
        self.delegate?.reloadData()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        //Set max length
        let maxLength = 15
        guard string.characters.count > 0 else {
            return true
        }
        let currentText = textField.text ?? ""
        let prospectiveText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        //filter only numbers and 1 decimal
        switch string {
        case "0","1","2","3","4","5","6","7","8","9":
            if prospectiveText.characters.count <= maxLength {
            return true
            } else {
                return false
            }
        case ".":
            let array = textField.text?.characters
            var decimalCount = 0
            for character in array! {
                if character == "." {
                    decimalCount += 1
                }
            }
            
            if decimalCount == 1 {
                return false
            } else {
                return true
            }
        default:
            let array = string.characters
            if array.count == 0 {
                return true
            }
            return false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
