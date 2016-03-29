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
        
        if let status = stockQuote?.status {
            openLabel.text = "Status: \(status)"
        }else {
         print("satus error")
        }
        if let low = stockQuote?.low {
            lowLabel.text = "Low: \(low)"
        } else {
            print("low error")
        }
        if let high = stockQuote?.high{
            highLabel.text = "High: \(high)"
        }else {
            print("high error")
        }
        if let changePercentYTD = stockQuote?.changePercentYTD {
            changePercentYTDLabel.text = "Change % YTD: \(changePercentYTD)"
        }else {
            print("changePercentYTD Error")
        }
        if let changeYTD = stockQuote?.changeYTD {
            changeYTDLabel.text = "change YTD: \(changeYTD)"
        }else {
            print("changeYTD Error")
        }
        if let volume = stockQuote?.volume {
            volumeLabel.text = "Volume: \(volume)"
        }else {
            print("volume error")
        }
        if let msDate = stockQuote?.msDate {
            msDateLabel.text = "MSDate: \(msDate)"
        }else {
            print("msDate Error")
        }
        if let marketCap = stockQuote?.marketCap {
            marketCapLabel.text = "Market Cap: \(marketCap)"
        }else {
            print("marketCap Error")
        }
        if let changepercent = stockQuote?.changePercent {
            changePercentLabel.text = "Change %: \(changepercent)"
        }else {
            print("changePercent Error")
        }
        if let change = stockQuote?.change {
            changeLabel.text = "Change: \(change)"
        }else {
            print("change Error")
        }
        if let lastPrice = stockQuote?.lastPrice {
            lastPriceLabel.text = "Last Price: \(lastPrice)"
        }else {
            print("lastPrice Error")
        }
        if let symbol = stockQuote?.symbol {
            
            symbolLabel.text = "Symbol: \(symbol)"
        }else {
          symbolAlert()
        }
        if let name = stockQuote?.name {
            nameLabel.text = "Name: \(name)"
        }else {
            print("error")
        }
        
    }
    
    
    func symbolAlert() {
        let symbolAlert = UIAlertController(title: "Error", message: "Please Put A Valid Name Or Symbol", preferredStyle: .Alert)
        symbolAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        self.presentViewController(symbolAlert, animated: true, completion: nil)
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
