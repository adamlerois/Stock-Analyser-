//
//  QuoteResultViewController.swift
//  stock analyst
//
//  Created by youcef bouhafna on 3/25/16.
//  Copyright © 2016 Youcef. All rights reserved.
//

import UIKit

class QuoteResultViewController: UIViewController {
    
    var stockQuote: StockQuote?
    
    @IBOutlet weak var openLabel: UILabel!
    @IBOutlet weak var lowLabel: UILabel!
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var changePercentYTDLabel: UILabel!
    @IBOutlet weak var changeYTDLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var msDateLabel: UILabel!
    @IBOutlet weak var marketCapLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var changePercentLabel: UILabel!
    @IBOutlet weak var changeLabel: UILabel!
    @IBOutlet weak var lastPriceLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
        
    }
    
    // stock functions
    
    func updateLabels() {
        if let stockQuote = stockQuote {
            nameLabel.text = "Name: \(stockQuote.name)"
            openLabel.text = "Status: \(stockQuote.open)"
            lowLabel.text = "Low: \(stockQuote.low)"
            highLabel.text = "High: \(stockQuote.high)"
            changePercentYTDLabel.text = "Change % YTD: \(stockQuote.changePercentYTD)"
            changeYTDLabel.text = "change YTD: \(stockQuote.changeYTD)"
            volumeLabel.text = "Volume: \(stockQuote.volume)"
            msDateLabel.text = "MSDate: \(stockQuote.msDate)"
            marketCapLabel.text = "Market Cap: \(stockQuote.marketCap)"
            changePercentLabel.text = "Change %: \(stockQuote.changePercent)"
            changeLabel.text = "Change: \(stockQuote.change)"
            lastPriceLabel.text = "Last Price: \(stockQuote.lastPrice)"
            symbolLabel.text = "Symbol: \(stockQuote.symbol)"
            
        } else {
            print("it's printing the error")
            
        }
        
    }
    
    // alert
    func Alert() {
        let alert = UIAlertController(title: "0 Results", message: "Sorry No Results...Please Put A Valid Symbol", preferredStyle: .Alert)
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
