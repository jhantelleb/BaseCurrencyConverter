//
//  ChangeBaseViewController.swift
//  CurrencyConverter
//
//  Created by Jhantelle Belleza on 6/14/17.
//  Copyright © 2017 JhantelleB. All rights reserved.
//

import UIKit

class ChangeBaseViewController: UIViewController {

    @IBOutlet var changeBaseView: UIView!
    @IBOutlet weak var changeBasePickerView: UIPickerView!
    
    
    @IBAction func ChangeButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(changeBaseView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

////For change base picker view
//extension ChangeBaseViewController: UIPickerViewDelegate, UIPickerViewDataSource {
//    
//}
