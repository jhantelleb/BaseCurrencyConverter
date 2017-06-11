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
        OperationQueue.main.addOperation {
            self.store.getDataFromAPI { data in
                self.currenciesToDisplay = data
                self.conversionsTableView.reloadData()
            }
        }
        
        //Floaty Button - add icon
        floaty.addItem("Add Currency", icon: UIImage(named: ""), handler: {
            item in
            self.performSegue(withIdentifier: "choose", sender: nil)
        })
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
        
        if let cName = currency.currencyName {
            cell.currencyLabel?.text = "1 \(baseCurrencyView.baseCurrencyLabel.text!) = \(currency.amount.format2D()) \(cName)"
        } else {
             cell.currencyLabel?.text = "1 \(baseCurrencyView.baseCurrencyLabel.text!) = \(currency.amount.format2D()) \(currency.base)"
        }
        
        if let sign = currency.sign {
            cell.signLabel?.text = sign
        } else {
            cell.signLabel?.text = ""
        }
        
        if let flag = currency.flag {
             cell.flagImage.image = flag
        } else {
            cell.flagImage.image = UIImage(named: "")
        }
        
        guard let baseAmount = baseCurrencyView.baseAmountTextField.text else { return cell }
        
        guard let dAmount = Double(baseAmount) else { return cell }
        if baseAmount.isEmpty ||
            dAmount == 0 {
            cell.convertedAmountLabel?.text = String(currency.amount.format2D())
        } else {
            let computedAmount = currency.amount * dAmount
            cell.convertedAmountLabel?.text = computedAmount.format2D().trimmingCharacters(in: .whitespaces)
        }
        
        OperationQueue.main.addOperation {
            self.conversionsTableView.reloadData()
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ChooseCurrenciesTableViewController {
            currenciesToDisplay.forEach{
                destination.selectedFromOtherVC.append($0.base)
            }
        }
    }
}

extension CurrencyViewController: BaseCurrencyDelegate {
    func reloadData() {
        OperationQueue.main.addOperation {
            self.conversionsTableView.reloadData()
        }
    }
    
}

extension Double {
    func format2D() -> String {
        return String(format: "%.2f", self)
    }
}

