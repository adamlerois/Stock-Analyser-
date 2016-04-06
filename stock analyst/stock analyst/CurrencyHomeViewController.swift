//
//  CurrencyHomeViewController.swift
//  stock analyst
//
//  Created by youcef bouhafna on 3/29/16.
//  Copyright © 2016 Youcef. All rights reserved.
//

import UIKit

class CurrencyHomeViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    var currencies: [Currency] = []
    var currencyArray = ["AUD", "BGN", "BRL", "CAD", "CHF", "CNY", "CZK", "DKK", "GBP", "HKD", "HRK", "HUF", "IDR", "ILS", "INR", "JPY", "KRW", "MXN", "MYR", "NOK", "NZD", "PHP", "PLN","RON","RUB","SEK","SGD","THB","TRY","ZAR","EUR"]

    @IBOutlet weak var indicatingLabel: UILabel!
    @IBOutlet weak var currencyPickerView: UIPickerView!
//    @IBOutlet weak var clickToGetRateLabel: UILabel!
//    @IBOutlet weak var titleLabel: UILabel!
//    @IBOutlet weak var CurrencyRates: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func go() {
        let index = self.currencyPickerView.selectedRowInComponent(0)
        let currencyString = self.currencyArray[index]
        CurrencyController.getCurrency(currencyString) { (currencies) in
            dispatch_async(dispatch_get_main_queue(), {
                self.currencies = currencies
                self.performSegueWithIdentifier("showCurrencies", sender: self)
            })
        }
    }
//    
//    @IBAction func CurrencyAgainstEuro(sender: UIButton) {
//        CurrencyController.getCurrency("EUR") { (currencies) in
//            dispatch_async(dispatch_get_main_queue(), { 
//                self.currencies = currencies
//                self.performSegueWithIdentifier("showCurrencies", sender: self)
//            })
//        }
//    }
//    
//    @IBAction func currencyRatesTapped(sender: UIButton) {
//        
//        CurrencyController.getCurrency("USD") { (currencies) in
//        
//            dispatch_async(dispatch_get_main_queue(), {
//                self.currencies = currencies
//               print("data coming and going through")
//                self.performSegueWithIdentifier("showCurrencies", sender: self)
//            })
//        
//        
//        }
//    }

    
    
    //MARK: - UIPickerView Protocol Methods
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       
            return currencyArray.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      return self.currencyArray[row]
       
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showCurrencies" {
         let destination = segue.destinationViewController as? CurrencyTableViewController
            destination?.currencyUnits = self.currencies
        }
    }
    
}
