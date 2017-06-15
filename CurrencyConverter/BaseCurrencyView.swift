
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
        let allowedCharacterSet = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        OperationQueue.main.addOperation {
            self.reloadData()
        }
        let limitLength = 20
        
        guard let text = textField.text else { return true }
        let newLength = text.characters.count + string.characters.count - range.length
        
        return allowedCharacterSet.isSuperset(of: characterSet) || newLength <= limitLength
    }
    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        textField.text = ""
//    }
}
