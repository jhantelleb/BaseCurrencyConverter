//
//  CurrencyViewController.swift
//  CurrencyConverter
//
//  Created by Jhantelle Belleza on 5/25/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import UIKit
import Floaty

class CurrencyViewController: UIViewController, ChosenCurrencyDelegate {
    
    @IBOutlet weak var baseCurrencyView: BaseCurrencyView!
    @IBOutlet weak var conversionsTableView: UITableView!
    
    let store = CurrencyDataStore.sharedInstance
    let amount = 1.00
    var currenciesToDisplay = [Currency]()
    let floaty = Floaty()
    var filter = Constants.defaultCurrenciesToDisplay
    let chosenCurrency = ChooseCurrenciesTableViewController()
    
    override func viewDidLoad() {
        
        conversionsTableView.estimatedRowHeight = conversionsTableView.rowHeight
        conversionsTableView.rowHeight = UITableViewAutomaticDimension
        conversionsTableView.separatorStyle = .none
        
        super.viewDidLoad()
        OperationQueue.main.addOperation {
            self.store.getDataFromAPI{ data in
                self.currenciesToDisplay = data
                self.conversionsTableView.reloadData()
            }
        }
        
        //Floaty Button - add icon
        floaty.addItem("Add Currency", icon: UIImage(named: "addCurrency"), handler: {
            item in
            self.performSegue(withIdentifier: "choose", sender: nil)
        })
        self.view.addSubview(floaty)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reloadData()
    }
    
    func passChosen(_ currencies: [String]) {
        self.store.addCurrency(currencies)
        self.store.getDataFromAPI{ data in
            self.currenciesToDisplay = data
            self.conversionsTableView.reloadData()
        }
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
        print(baseAmount)
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
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.contentView.alpha = 0.8
        header.textLabel?.textColor = UIColor.white
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Converted Currencies"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navBar = segue.destination as! UINavigationController
        let destination = navBar.topViewController as! ChooseCurrenciesTableViewController
        self.currenciesToDisplay.forEach{
            destination.selectedCurrencies.append($0.base)
        }
        destination.delegate = self
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
