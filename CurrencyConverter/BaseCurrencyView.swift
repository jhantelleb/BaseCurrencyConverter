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
    @IBOutlet weak var flagImageVIew: UIImageView!
    @IBOutlet weak var baseSignLabel: UILabel!
    @IBOutlet weak var baseCurrencyLabel: UILabel!
    @IBOutlet weak var baseAmountTextField: UITextField!
    
    
    weak var delegate: BaseCurrencyDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        baseAmountTextField.delegate = self
        baseAmountTextField.text = "1.00"
        //        amount = Double(self.baseAmountTextField.text!)!
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
        OperationQueue.main.addOperation {
            self.reloadData()
        }
        print(textField.text!)
        return true
    }
    

}
