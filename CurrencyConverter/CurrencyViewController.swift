//
//  CurrencyViewController.swift
//  CurrencyConverter
//
//  Created by Jhantelle Belleza on 5/25/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import UIKit
import Floaty
import SwiftSpinner

class CurrencyViewController: UIViewController, ChosenCurrencyDelegate {
    
    @IBOutlet weak var baseCurrencyView: BaseCurrencyView!
    @IBOutlet weak var conversionsTableView: UITableView!
    
    let store = CurrencyDataStore.sharedInstance
    let amount = 0.00
    var currenciesToDisplay = [Currency]()
    let floaty = Floaty()
    
    var oldBase = ""
    let networkStatus = NetworkStatus.sharedInstance
    
    override func viewDidLoad() {
        
        //Image for Navigation title
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
        imageView.image = UIImage(named: "headerLogo")
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
        
        super.viewDidLoad()
        checkReachability()
        DispatchQueue.main.async {
            self.store.getCurrenciesForNewBase(self.store.baseCurrency.base) { data in
                self.currenciesToDisplay = data
                self.store.convertCurrencies = data
                self.conversionsTableView.reloadData()
                self.stopListening()
            }
        }
        
        //Add Currency
        floaty.addItem("Add Currency", icon: UIImage(named: "addCurrency")) { (item) in
            self.performSegue(withIdentifier: "choose", sender: nil)
        }
        
        //Settings - Feedback etc?
        self.view.addSubview(floaty)
        self.conversionsTableView.dataSource = self
        self.conversionsTableView.delegate = self
//        self.conversionsTableView.allowsSelection = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reloadData()
    }
    
    //Pass chosen delegate method
    func passChosen(_ currencies: [String]) {
        SwiftSpinner.show("Converting new currencies", animated: true)
        self.store.addCurrencies(currencies)
        checkReachability()
        let base = (self.baseCurrencyView.baseCurrencyLabel.text)!
        OperationQueue.main.addOperation {
            self.store.getCurrenciesForNewBase(base) { data in
                self.currenciesToDisplay.removeAll()
                self.currenciesToDisplay = data
                SwiftSpinner.hide()
                self.stopListening()
                self.conversionsTableView.reloadData()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
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
            cell.currencyLabel?.text = "1 \(baseCurrencyView.baseCurrencyLabel.text!)   =   \(currency.amount.format2D()) \(cName)"
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
            self.reloadData()
        }
        return cell
    }
    
    //MARK: Header View configurations
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.contentView.alpha = 0.8
        header.textLabel?.textColor = UIColor.white
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Tap a row to change base currency."
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        checkReachability()
        
        if identifier == "choose" {
            if let navBar = segue.destination as? UINavigationController {
                let destination = navBar.topViewController as! ChooseCurrenciesTableViewController
                self.currenciesToDisplay.forEach{
                    destination.selectedCurrencies.insert($0.base)
                }
                destination.delegate = self
            }
        }
    }
    
    
    
    
    //MARK: Remove Currency from Converted Currencies TV
//    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        print("DELETE! \(editingStyle)")
//        if  editingStyle == .delete {
//            self.currenciesToDisplay.remove(at: indexPath.row)
//            self.conversionsTableView.deleteRows(at: [indexPath], with: .fade)
////            self.conversionsTableView.reloadData()
//        }
//    }
    
    //MARK: Change Currency with Single Tap
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //store base then add to tableView
        oldBase = baseCurrencyView.baseCurrencyLabel.text!
        let newBaseCurrency = self.currenciesToDisplay[indexPath.row]
        
        
        //Change old base to new base in store.base
        store.setBase(using: newBaseCurrency)
        //Remove new base from filter
        self.store.removeFromFilter(newBaseCurrency.base)
        //Add old base to filter
        self.store.addCurrency(oldBase) //watch out
        SwiftSpinner.show("Changing base currency", animated: true)
        
        checkReachability()
        DispatchQueue.main.async {
            self.store.getCurrenciesForNewBase(newBaseCurrency.base) { (currency) in
                //Replace Base with new key
                self.baseCurrencyView.baseCurrencyLabel.text = newBaseCurrency.base
                self.baseCurrencyView.baseSignLabel.text = newBaseCurrency.sign
                self.baseCurrencyView.flagImageView.image = newBaseCurrency.flag
                self.baseCurrencyView.baseAmountTextField.text = String(newBaseCurrency.amount)
                //sort currency based on order of filter
                let filter = self.store.filter
                self.currenciesToDisplay = currency.sorted{ filter.index(of: $0.base)! < filter.index(of: $1.base)! }
                SwiftSpinner.hide()
                self.stopListening()
            }
            self.reloadData()
        }
    }
    
    
    //Reachability
    fileprivate func checkReachability() {
        let manager  = networkStatus.reachabilityManager
        guard let reachable = manager?.isReachable else { return }
        if !reachable {
            SwiftSpinner.show("Make sure device is connected to the internet.").addTapHandler({
                SwiftSpinner.hide()
            }, subtitle: "This app requires internet connection. Connect to a wifi or turn on mobile data. Tap to hide.")
        } else {
            self.conversionsTableView.reloadData()
        }
    }
    
    fileprivate func stopListening() {
        let manager = networkStatus.reachabilityManager
        manager?.stopListening()
    }
    
}

//MARK: BaseCurrency Delegate
extension CurrencyViewController: BaseCurrencyDelegate {
    func reloadData() {
        DispatchQueue.main.async {
            self.conversionsTableView.reloadData()
        }
    }
}


extension Double {
    func format2D() -> String {
        return String(format: "%.4f", self)
    }
}
