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
    var currenciesToDisplay = [BaseCurrency]()
    let floaty = Floaty()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        OperationQueue.main.addOperation {
            self.store.getAllDataFromAPI { data in
                self.currenciesToDisplay = self.store.filterDataToBeDisplayed(Constants.defaultCurrenciesToDisplay)
                self.conversionsTableView.reloadData()
            }
            self.currenciesToDisplay = self.store.filterDataToBeDisplayed(Constants.defaultCurrenciesToDisplay)
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
        
        cell.currencyLabel?.text = currency.base
        cell.signLabel?.text = currency.sign
        
        guard let baseAmount = baseCurrencyView.baseAmountTextField.text else { return cell }
        
        guard let dAmount = Double(baseAmount) else { return cell }
        if baseAmount.isEmpty ||
            dAmount == 0 {
            cell.convertedAmountLabel?.text = String(currency.amount    )
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
