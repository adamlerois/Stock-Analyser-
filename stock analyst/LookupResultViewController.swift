//
//  LookupResultViewController.swift
//  stock analyst
//
//  Created by youcef bouhafna on 3/25/16.
//  Copyright © 2016 Youcef. All rights reserved.
//

import UIKit

class LookupResultViewController: UIViewController {
    @IBOutlet weak var lookupNameLabel: UILabel!
    @IBOutlet weak var SymbolLookupLabel: UILabel!
    @IBOutlet weak var exchangeLookupLabel: UILabel!
    
    var companyLookup: StockLookup?
    var companyName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let companyName = companyName {
            StockLookupController.stockLookupSearchByName(companyName, completion: { (result) in
                self.companyLookup = result
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.updateData()
                })
            })
        }
    }

    
    // stock functions
    func updateData() {
        if let companyLookup = companyLookup {
            lookupNameLabel.text = "Name: \(companyLookup.name)"
            
            SymbolLookupLabel.text = "Symbol: \(companyLookup.symbol)"
            
            exchangeLookupLabel.text = "Exchange: \(companyLookup.exchange)"
            
        }else {
            print("Error")
        }
    }
    
    // bitcoin function
    
    
    // alert if there is an error
    
    func Alert() {
        let alert = UIAlertController(title: "0 Results", message: "Sorry No Results...Please Put A Valid Name", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
