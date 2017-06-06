//
//  CurrencyViewController.swift
//  CurrencyConverter
//
//  Created by Jhantelle Belleza on 5/25/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import UIKit
import Floaty

class CurrencyViewController: UIViewController {
    
    @IBOutlet weak var baseCurrencyView: BaseCurrencyView!
    @IBOutlet weak var conversionsTableView: UITableView!
    
    let store = CurrencyDataStore.sharedInstance
    let amount = 1.00
    var currenciesToDisplay = [Currency]()
    let floaty = Floaty()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        store.setBase()
        
        OperationQueue.main.addOperation {
            self.store.getAllDataFromAPI { data in
                self.store.setCurrenciesForDisplay() //temp
                self.currenciesToDisplay = self.store.convertCurrencies
                self.conversionsTableView.reloadData()
            }
        }
        
        floaty.addItem(title: "Add Currency")
        self.view.addSubview(floaty)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
        
}

extension CurrencyViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.currenciesToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let currency = self.currenciesToDisplay[indexPath.row]
        
        let cell = conversionsTableView.dequeueReusableCell(withIdentifier: "othersCell", for: indexPath) as! ConvertTableViewCell
        
        cell.currencyLabel?.text = "1 \(baseCurrencyView.baseCurrencyLabel.text!) = \(currency.amount) \(currency.base)"
        cell.signLabel?.text = currency.sign
        cell.flagImage.image = currency.flag
        
        guard let baseAmount = baseCurrencyView.baseAmountTextField.text else { return cell }
        
        guard let dAmount = Double(baseAmount) else { return cell }
        if baseAmount.isEmpty ||
            dAmount == 0 {
            cell.convertedAmountLabel?.text = String(currency.amount)
        } else {
            cell.convertedAmountLabel?.text = String(currency.amount * dAmount).trimmingCharacters(in: .whitespaces)
        }
        
        OperationQueue.main.addOperation {
            self.conversionsTableView.reloadData()
        }
        return cell
    }
    
}

extension CurrencyViewController: BaseCurrencyDelegate {
    
    func reloadData() {
        OperationQueue.main.addOperation {
            self.conversionsTableView.reloadData()
        }
    }
    
}

