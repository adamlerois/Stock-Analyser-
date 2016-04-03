//
//  CurrencyHomeViewController.swift
//  stock analyst
//
//  Created by youcef bouhafna on 3/29/16.
//  Copyright © 2016 Youcef. All rights reserved.
//

import UIKit

class CurrencyHomeViewController: UIViewController {
    var currencies: [Currency] = []

    @IBOutlet weak var clickToGetRateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var CurrencyRates: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func CurrencyAgainstEuro(sender: UIButton) {
        CurrencyController.getCurrency("EUR") { (currencies) in
            dispatch_async(dispatch_get_main_queue(), { 
                self.currencies = currencies
                self.performSegueWithIdentifier("showCurrencies", sender: self)
            })
        }
    }
    
    @IBAction func currencyRatesTapped(sender: UIButton) {
        
        CurrencyController.getCurrency("USD") { (currencies) in
        
            dispatch_async(dispatch_get_main_queue(), {
                self.currencies = currencies
               print("data coming and going through")
                self.performSegueWithIdentifier("showCurrencies", sender: self)
            })
        
        
        }
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
